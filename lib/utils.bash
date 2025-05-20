
export PLUGIN_NAME=$(basename "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)")

export STEAM_ROOT="${STEAM_ROOT:-$HOME/.steam/root}"
export ASDF_PROTONGE_STEAM_COMPAT_DIR="${ASDF_PROTONGE_STEAM_COMPAT_DIR:-$STEAM_ROOT/compatibilitytools.d}"

# Colors
colored() {
	local color="$1" text="$2"
	printf "\033[%sm%s\033[0m\n" "$color" "$text"
}

export BOLD=1
export RED=31 GREEN=32 YELLOW=33 BLUE=34 MAGENTA=35 CYAN=36

export ERROR=$(colored $RED ERROR) WARNING=$(colored $YELLOW WARNING) SUCCESS=$(colored $GREEN SUCCESS)

export REPO_PAGE=https://github.com/augustobmoura/asdf-protonge
export ISSUES_PAGE="$REPO_PAGE/issues"
