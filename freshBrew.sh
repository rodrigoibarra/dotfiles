#!/usr/bin/env bash

set -e

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "${BASEDIR}"

echo "Let's get ready to brew some hot env"

sh "${BASEDIR}"/install/Ground.sh

echo "Everything is grounded"

echo "Let's pour some hot water in and let it brew"

sh "${BASEDIR}"/MacOS/Pour.sh


echo "wait, before we go... lets clean up and link all the dotfiles again..."

sh "${BASEDIR}"/cleanup.sh

sh "${BASEDIR}"/extra.sh
echo "Aight... we Gucci!"