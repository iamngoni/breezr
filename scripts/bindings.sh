#!/usr/bin/env bash
# Breezr: Flutter-Rust FFI Bridge Generator
# This script regenerates the Dart bindings for the Rust core

flutter_rust_bridge_codegen generate \
  -r crate::bridge \
  --rust-root ../breezr_core \
  -d ../breezr_flutter/lib
