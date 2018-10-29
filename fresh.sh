#!/usr/bin/env bash

set -e


BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "${BASEDIR}"

sh "${BASEDIR}"/install/install.sh

echo "So... tha basics are installed, we could stop here but naaah"

echo "Let's configure some stuff"

sh "${BASEDIR}"/MacOS/defaults.sh


echo "wait, before we go... lets link all the dotfiles again..."

sh "${BASEDIR}"/cleanup.sh

echo "Aight... we Gucci!"