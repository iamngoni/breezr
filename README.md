# 🌬️ Breezr

**Breezr** is a fast, lightweight, and privacy-friendly system cleaning and optimization tool — built with Flutter for the UI and Rust for the core engine.

> Think CleanMyMac, but very minimal & free.

---

## 📁 Project Structure

```
breezr/
├── breezr_flutter/   # Flutter frontend (UI)
├── breezr_core/      # Rust backend (cleaning engine)
└── README.md         # This file
```

---

## 🚀 Getting Started

### 1. Clone the project

```bash
git clone https://github.com/iamngoni/breezr.git
cd breezr
```

### 2. Set up the Flutter app

```bash
cd breezr_flutter
flutter pub get
```

### 3. Set up the Rust backend

```bash
cd ../breezr_core
cargo build
```

## 🧩 Flutter + Rust Integration

Breezr uses flutter_rust_bridge to link Rust and Dart seamlessly. Rust handles all the heavy lifting — file scanning, deletion, system metrics — while Flutter provides a sleek, cross-platform UI.

## 🛠️ Tech Stack

- Frontend: Flutter
- Backend: Rust
- FFI: flutter_rust_bridge

## 🧪 Development Tips

Regenerate FFI bindings from the root directory:

```bash
flutter_rust_bridge_codegen \
  --rust-input breezr_core/src/bridge.rs \
  --dart-output breezr_flutter/lib/breezr_core_generated.dart \
  --dart-decl-output breezr_flutter/lib/breezr_core_api.dart
```

## 💡 Roadmap

- Cache cleaner
- App uninstaller
- System monitor
- Startup item manager
- Developer folder cleaner (e.g. node_modules, Docker)
- One-click optimize button
- Cross-platform support: macOS → Linux → Windows (mmmh maybe not - I only need Mac for now)

## 📜 License

- [MIT](./LICENSE)

## 🙌 Contributions

Breezr is still in early development, but contributions are welcome!
Stay tuned for a CONTRIBUTING.md and GitHub issues to get involved.

⸻

Breezr: Give your system a breath of fresh air.
