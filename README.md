# Fly.io Actual Deployment

## Description

A Fly.io app for [Actual](https://actualbudget.org/docs/install/), a self-hosted budgeting app. The app is only
privately accessible (i.e. from the Fly org's private network) as it contains sensitive data. Access can be granted by
using something like a Tailscale Subnet router or tunneling via Wireguard.

This apps also uses [Flycast](https://fly.io/docs/networking/flycast/#flycast-quickstart) in order to support automatic
machine start and stop based on incoming requests. This makes it inexpensive to host.

## Development Environment

The development environment uses [nix-direnv](https://github.com/nix-community/nix-direnv) to install all dependencies
and link in any helper scripts. Simply entering the directory once `nix-direnv` (and nix, etc.) have been installed
should trigger the installation of all of the dependencies.

### Creating the App

```sh
$ create
Skipping creation of app as it already exists...
Skipping creation of Flycast IP as it already exists...
Skipping creation of cert for budget.mcnama.family as it already exists...
Flycast IP for mc-actual: fdaa:a:7d38:0:1::5
```

This command is idempotent and will not take any actions unless required. It will also print out the Flycast IP of the
app in order to make configuring DNS easier.

### Deploying

```sh
$ deploy
```

The deploy will output its progress and wait until it's completed before returning.

### Linting

```sh
lint
```

## TODO

- [ ] CI via Github Actions
- [ ] CD via Github Actions
- [ ] Add [prom exporter](https://github.com/sakowicz/actual-budget-prometheus-exporter) maybe?
- [ ] Backups to another provider
