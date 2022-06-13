# Crontab UI

This project is a simple Docker image for [this](https://github.com/alseambusher/crontab-ui/blob/master/README.md) 
project with a few changes. The Docker image defaults to version 0.3.16 of the project, however can be changed by 
updating the env variable `CRONTAB_UI_RELEASE` in the github action `build.yml` file.

Documentation is the same as the original project. Additions are:
1. Supported platforms - arm64, armv7, armv6.
1. Includes `rsync` in the image.
