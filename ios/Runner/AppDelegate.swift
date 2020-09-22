import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let batteryChannel = FlutterMethodChannel(name: "show_webview",
                                              binaryMessenger: controller.binaryMessenger)
    batteryChannel.setMethodCallHandler({
      (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
      // Note: this method is invoked on the UI thread.
      // Handle battery messages.
        guard call.method == "show" else {
          result(FlutterMethodNotImplemented)
          return
        }
        
        let args = call.arguments as? Dictionary<String, Any>
        self.showWebview(url: args?["url"] as! String,result: result)
    })
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    private func showWebview(url: String, result: FlutterResult) {
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        
        print("show webview at \(url)")
        
        let newViewController = WebviewViewController()
        newViewController.url = url
        controller.present(newViewController, animated: true, completion: nil)
    }
}
