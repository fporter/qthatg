#!/bin/sh

# make pak folder
mkdir -p pak

flatpak-builder --force-clean --ccache --repo pak/repo --user -y pak/build deploy/com.example.qthatg.yaml

