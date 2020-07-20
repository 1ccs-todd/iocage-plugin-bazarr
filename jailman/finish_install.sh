#!/usr/local/bin/bash
# This file contains the install script for bazarr

#init jail
initplugin "$1"

# Initialise defaults

# Check if dataset for media library and the dataset for movies exist, create if they do not.
createmount "$1" "${global_dataset_media}"
createmount "$1" "${global_dataset_media}"/movies /mnt/movies
createmount "$1" "${global_dataset_media}"/series /mnt/series

iocage exec "$1" chown -R bazarr:bazarr /usr/local/share/bazarr /config
iocage exec "$1" service bazarr start

exitplugin "$1"
