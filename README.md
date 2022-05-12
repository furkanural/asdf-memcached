<div align="center">

# asdf-memcached [![Build](https://github.com/furkanural/asdf-memcached/actions/workflows/build.yml/badge.svg)](https://github.com/furkanural/asdf-memcached/actions/workflows/build.yml) [![Lint](https://github.com/furkanural/asdf-memcached/actions/workflows/lint.yml/badge.svg)](https://github.com/furkanural/asdf-memcached/actions/workflows/lint.yml)


[memcached](https://github.com/memcached/memcached) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Why?](#why)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- `bash`, `curl`, `tar`: generic POSIX utilities.
- `SOME_ENV_VAR`: set this environment variable in your shell config to load the correct version of tool x.

# Install

Plugin:

```shell
asdf plugin add memcached
# or
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
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/furkanural/asdf-memcached/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Furkan Ural](https://github.com/furkanural/)
