#! /usr/bin/env bash

set -eu -o pipefail

. "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../utils.bash"

start_managing() {
	local version="${1#Proton-}"

	local installation_path="$ASDF_PROTONGE_STEAM_COMPAT_DIR/Proton-$version"
	local asdf_install_path="${ASDF_DATA_DIR:-$HOME/.asdf}/installs/$PLUGIN_NAME/$version"

	if ! [ -d "$installation_path" ]; then
		printf "$ERROR: Installation path for version %s (%s) not found\n" "$version" "$installation_path"
		return 2
	fi

	installation_path=$(cd "$installation_path" && pwd -P)

	if [ -d "$asdf_install_path" ]; then
		if ! [ "$(cd "$asdf_install_path" && pwd -P)" = "$installation_path" ]; then
			printf "\
$ERROR: Version %s is already being managed by asdf but points to a different location:

  Currently managed: %s
          Requested: %s
" "$version" "$(cd "$asdf_install_path" && pwd -P)" "$installation_path"
			return 3
		fi

		printf "$WARNING: Installation on %s is already being managed as version %s\n" "$installation_path" "$version"
		return 0
	fi

	if [ -L "$asdf_install_path" ]; then
		printf "$ERROR: Current managed version in asdf it's broken, please uninstall it then try again\n"
		return 4
	fi

	ln -s "$installation_path" "$asdf_install_path"
	printf "Managing %s as version %s now\n" "$installation_path" "$version"
}

for arg; do
	start_managing "$arg"
done
