# asdf-protonge [![Build](https://github.com/augustobmoura/asdf-protonge/actions/workflows/test.yml/badge.svg)](https://github.com/augustobmoura/asdf-protonge/actions/workflows/test.yml)

Unofficial [asdf](https://asdf-vm.com/) plugin for [GloriousEggroll custom Proton](https://github.com/GloriousEggroll/proton-ge-custom/) distribution.

## Installation

Install [`asdf-vm`](https://asdf-vm.com/guide/getting-started.html) and add this
repo as a plugin:

```bash
asdf plugin-add protonge https://github.com/augustobmoura/asdf-protonge.git
```

Optional tools:

- [`pv`](https://www.ivarch.com/programs/pv.shtml): We use `pv` to show progress
  bars when extracting the tarballs. It is specially useful in slower computers
  which could take a few minutes to finish extraction.

## Configuration

Configuration of the plugin is done by environment variables, you can set them
by default in the rc file of your shell of preference (`.bashrc`, `.zshrc`,
`.profile`, etc.).

| Variable                       | Description                                                                                                |
| ------------------------------ | ---------------------------------------------------------------------------------------------------------- |
| ASDF_PROTONGE_STEAM_COMPAT_DIR | directory in which the custom protons will be installed. Defaults to `~/.steam/root/compatibilitytools.d`. |
| GITHUB_API_TOKEN               | GH token used for downloading the tarballs. This is useful because Github tends to rate limit API calls    |

> [!TIP]
> If you are using flatpak's Steam you need to set the `ASDF_PROTONGE_STEAM_COMPAT_DIR` variable to:
> `~/.var/app/com.valvesoftware.Steam/data/Steam/compatibilitytools.d/`

## Usage

You can install any pre-compiled release from the Github release page.

### Examples of versions supported by asdf

```bash
# Install latest version available
asdf install protonge latest

# Install latest version starting with prefix
asdf install protonge latest:GE-Proton8

# Install specific version
asdf install protonge GE-Proton9-18
```

> [!NOTE]
> asdf ref versions (build from source) are not supported ~yet~
> This will not work:
>
> ```bash
> asdf install protonge ref:master
> ```

### Managing already installed versions

If you already have custom installations in your `compatibilitytools.d`
directory you can start managing them with asdf-protonge by running:

```bash
asdf protonge manage $version
```

An useful one-liner to manage all already installed versions is:

```bash
ls ~/.steam/root/compatibilitytools.d | xargs asdf protonge manage
```

## How it works

We are basically doing the instructions for manual installation:

1. Download the tarball and checksum from the GitHub releases page
2. Validate the checksum
3. Extract the tarball to the `compatibilitytools.d` directory
4. Symlink the extracted directory to the asdf directory

We manage installed versions by symlinking the extracted directory to
`$ASDF_DIR/installs/protonge/$version`, that way we can prevent double
installations and manage uninstallations with asdf.

```bash
asdf uninstall protonge $version
```

## TODO

- Build from source and support asdf `ref:` installs
