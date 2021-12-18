#!/bin/bash

# Set up the desktop environment
cp ../images/desktop.jpg ~/desktop.jpg
dconf load /org/gnome/ < ../../settings.dconf