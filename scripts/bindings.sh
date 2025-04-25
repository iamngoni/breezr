#!/usr/bin/env bash
# Breezr: Flutter-Rust FFI Bridge Generator
# This script regenerates the Dart bindings for the Rust core

flutter_rust_bridge_codegen \
  --rust-input breezr_core/src/bridge.rs \
  --dart-output breezr_flutter/lib/breezr_core_generated.dart \
  --dart-decl-output breezr_flutter/lib/breezr_core_api.dart
