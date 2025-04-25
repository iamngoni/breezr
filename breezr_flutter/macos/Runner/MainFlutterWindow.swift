import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    let windowFrame = self.frame
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)

    /** ──────────────────────────────────────────────────────────────
     *  MethodChannel: breezr_permissions
     *  ──────────────────────────────────────────────────────────── */
    let channel = FlutterMethodChannel(
      name: "breezr_permissions",
      binaryMessenger: flutterViewController.engine.binaryMessenger)

    channel.setMethodCallHandler { call, result in
      switch call.method {

      case "requestNotifications":
        UNUserNotificationCenter.current()
          .requestAuthorization(options: [.alert, .sound, .badge]) { granted, _ in
            result(granted)     // true / false
          }

      case "requestAccessibility":
        // Shows the “Breezr would like to control this computer” sheet
        let opts = [kAXTrustedCheckOptionPrompt.takeRetainedValue() as String: true] as CFDictionary
        let trusted = AXIsProcessTrustedWithOptions(opts)
        result(trusted)

      case "openFullDiskAccess":
        // Open System Settings  ➜  Privacy & Security ➜ Full-Disk Access
        let url = URL(string: "x-apple.systempreferences:com.apple.preference.security?Privacy_FullDiskAccess")!
        NSWorkspace.shared.open(url)
        result(nil)

      default:
        result(FlutterMethodNotImplemented)
      }
    }
    /** ──────────────────────────────────────────────────────────── */

    RegisterGeneratedPlugins(registry: flutterViewController)
    super.awakeFromNib()
  }
}
