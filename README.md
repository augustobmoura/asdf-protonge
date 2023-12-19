# asdf-protonge [![Build](https://github.com/augustobmoura/asdf-protonge/actions/workflows/test.yml/badge.svg)](https://github.com/augustobmoura/asdf-protonge/actions/workflows/test.yml)

Unofficial [asdf](https://asdf-vm.com/) plugin for [GloriousEggroll custom Proton](https://github.com/GloriousEggroll/proton-ge-custom/) distribution.

## Installation

Install [`asdf-vm`](https://asdf-vm.com/guide/getting-started.html) and add this
repo as a plugin:

```bash
asdf plugin-add protonge https://github.com/augustobmoura/asdf-protonge.git
```

## Configuration

Configuration of the plugin is done by environment variables, you can set them
by default in the rc file of your shell of preference (`.bashrc`, `.zshrc`,
`.profile`, etc.).

| Variable                       | Description                                                                                               |
| ------------------------------ | --------------------------------------------------------------------------------------------------------- |
| ASDF_PROTONGE_STEAM_COMPAT_DIR | directory in which the custom protons will be installed. Defaults to `~/.steam/root/compatibilitytools.d` |
| GITHUB_API_TOKEN               | GH token used for downloading the tarballs. This is useful because Github tends to rate limit API calls   |

## How it works

We are basically doing the instructions for manual installation:
we download the version from GitHub, validate the checksum, and extract it on
`~/.steam/root/compatibilitytools.d` by default, you can customize the
extraction location by setting the `ASDF_PROTONGE_STEAM_COMPAT_DIR` environment
variable (if you are using flatpak's steam for example, you can set it to
`~/.var/app/com.valvesoftware.Steam/data/Steam/compatibilitytools.d/` on your
regular rc file).

We manage installed versions by symlinking the extracted directory to
`$ASDF_DIR/installs/protonge/$version`, that way we can prevent double
installations and effectively run:

```bash
asdf uninstall protonge $version.
```

If you already have custom installations in your `~/.steam/root/compatibilitytools.d`
directory you can manage with asdf-protonge by running the special command:

```bash
asdf protonge manage $version
```

To add all local versions to asdf you can run the script:

```bash
ls ~/.steam/root/compatibilitytools.d | xargs asdf protonge manage
```
