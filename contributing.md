# Contributing

Testing Locally:

```shell
asdf plugin test <plugin-name> <plugin-url> [--asdf-tool-version <version>] [--asdf-plugin-gitref <git-ref>] [test-command*]

#
asdf plugin test memcached https://github.com/furkanural/asdf-memcached.git "memcached --version"
```

Tests are automatically run in GitHub Actions on push and PR.
