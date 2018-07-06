#!/usr/bin/env bash

set -e

git config --global user.email "ccarnerolinan@gmail.com"
git config --global user.name "Cristóbal Carnero Liñán"

cd ~/.the-bootstrap

git remote rm origin
git remote add origin git@github.com:cristobalcl/.the-bootstrap.git
