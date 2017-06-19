#!/usr/bin/env bash

if [ -z "$(which gsettings)" ]; then
  echo "gsettings is missing, forget to install package libglib2.0-bin?"
  exit -1
fi
if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
  echo "dbus session is not found, are you running from gui?"
fi
gsettings set org.gnome.desktop.media-handling autorun-never true
gsettings set org.gnome.desktop.media-handling automount false
gsettings set org.gnome.desktop.media-handling automount-open false
