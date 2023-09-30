#!/bin/bash

version=$(sw_vers -productVersion)
if [ $(echo "$version 13.0.1" | awk '{print ($1 >= 13 && $1 <= $2)}') -eq 1 ] || [ $(echo "$version 12.6.1" | awk '{print ($1 >= 12 && $1 <= $2)}') -eq 1 ]; then
  echo 1
else
  echo 0
fi