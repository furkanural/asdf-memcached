#!/usr/bin/env bash

set -euo pipefail

RELEASES_URL="https://github.com/memcached/memcached/wiki/ReleaseNotes"
DOWNLOAD_URL="http://www.memcached.org/files/"
TOOL_NAME="memcached"
TOOL_TEST="memcached --version"

fail() {
  echo -e "asdf-$TOOL_NAME: $*"
  exit 1
}

sort_versions() {
  sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
    LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

list_all_versions() {
  curl -s "$RELEASES_URL" |
    awk 'match($0, /([[:digit:]]+[\.][[:digit:]]+[\.][[:digit:]]+).[(].*[)]/) { print substr($0, RSTART, RLENGTH) }' |
    awk 'match($0, /[[:digit:]]+[\.][[:digit:]]+[\.][[:digit:]]+/) { print substr($0, RSTART, RLENGTH) }' |
    cut -d/ -f3- |
    sed 's/^v//'
}

download_release() {
  local version filename url old_url
  version="$1"
  filename="$2"

  url="$DOWNLOAD_URL/$TOOL_NAME-${version}.tar.gz"
  old_url="$DOWNLOAD_URL/old/$TOOL_NAME-${version}.tar.gz"

  echo "* Downloading $TOOL_NAME release $version..."

  if curl --output /dev/null --silent --head --fail "$url"; then
    curl -o "$filename" -C - "$url" || fail "Could not download $url"
  fi

  if curl --output /dev/null --silent --head --fail "$old_url"; then
    curl -o "$filename" -C - "$old_url" || fail "Could not download $old_url"
  fi
}

install_version() {
  local install_type="$1"
  local version="$2"
  local install_path="$3"

  if [ "$install_type" != "version" ]; then
    fail "asdf-$TOOL_NAME supports release installs only"
  fi

  (
    mkdir -p "$install_path"

    local download_path_and_version="$ASDF_DOWNLOAD_PATH/$version"

    if [ -z "${ASDF_MEMCACHED_CONFIGURE_OPTIONS:-}" ]; then
      local configuration_options="--prefix=$install_path --disable-coverage"
    else
      local configuration_options="--prefix=$install_path --disable-coverage $ASDF_MEMCACHED_CONFIGURE_OPTIONS"
    fi

    cd $(dirname $download_path_and_version)

    ./configure $configuration_options || exit 1
    make || exit 1
    make install || exit 1

    local tool_cmd
    tool_cmd="$(echo "$TOOL_TEST" | cut -d' ' -f1)"
    test -x "$install_path/bin/$tool_cmd" || fail "Expected $install_path/bin/$tool_cmd to be executable."

    echo "$TOOL_NAME $version installation was successful!"
  ) || (
    rm -rf "$install_path"
    fail "An error ocurred while installing $TOOL_NAME $version."
  )
}
