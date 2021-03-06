#!/usr/bin/env bash

###############################################################################
# Xcode                                                                       #
###############################################################################

# Install Xcode Command Line Tools
if ! $(xcode-select -p &>/dev/null); then
  xcode-select --install &>/dev/null

  # Wait until the Xcode Command Line Tools are installed
  until $(xcode-select -p &>/dev/null); then
    sleep 5
  done
fi

# Accept the Xcode/iOS license agreement
if ! $(sudo xcodebuild -license status); then
  sudo xcodebuild -license accept
fi
