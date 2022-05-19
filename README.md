<div align="center">

# asdf-memcached [![Build](https://github.com/furkanural/asdf-memcached/actions/workflows/build.yml/badge.svg)](https://github.com/furkanural/asdf-memcached/actions/workflows/build.yml) [![Lint](https://github.com/furkanural/asdf-memcached/actions/workflows/lint.yml/badge.svg)](https://github.com/furkanural/asdf-memcached/actions/workflows/lint.yml)


[memcached](https://github.com/memcached/memcached) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- MacOS
  - automake
- Ubuntu
  - libevent-dev

# Install

Plugin:

```shell
asdf plugin add memcached https://github.com/furkanural/asdf-memcached.git
```

memcached:

```shell
# Show all installable versions
asdf list-all memcached

# Install specific version
asdf install memcached latest

# Set a version globally (on your ~/.tool-versions file)
asdf global memcached latest

# Now memcached commands are available
memcached --version

# Run memcached in background
memcached -d
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

## ASDF options

When installing memcached using asdf install, you can pass custom configure options with the following env var:

- `ASDF_MEMCACHED_CONFIGURE_OPTIONS`

For example, if you want to compile with an openssl libraries `ASDF_MEMCACHED_CONFIGURE_OPTIONS="--enable-tls --with-libssl=$(brew --prefix openssl@1.1)" asdf install memcached`

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/furkanural/asdf-memcached/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Furkan Ural](https://github.com/furkanural/)
