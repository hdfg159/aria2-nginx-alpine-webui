#!/bin/sh
aria2c \
&& nginx -g "daemon off;"
