#!/bin/bash

# Enable error handling
set -e

# Create and navigate to the build directory
mkdir -p build
cd build

# Run cmake
if ! cmake ..; then
  echo "Error: CMake configuration failed."
  cd ..
  rm -rf build
  exit 1
fi

# Run make
if ! make; then
  echo "Error: Make process failed."
  cd ..
  rm -rf build
  exit 1
fi

# Remove the build directory
cd ..

# Notify user of successful completion
echo "Build completed successfully. Executables are located in the 'bin' folder."
