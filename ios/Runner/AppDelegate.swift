import UIKit
import Flutter
import flutter_downloader
import FirebaseCore
import FirebaseMessaging


@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    FirebaseApp.configure()
    GeneratedPluginRegistrant.register(with: self)
    FlutterDownloaderPlugin.setPluginRegistrantCallback(registerPlugins)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
  override func application(
                    _ application: UIApplication,
                    didRegisterForRemoteNotificationsWithDeviceToken deviceToken:Data
                  ) {
                  Messaging.messaging().apnsToken = deviceToken
                  print("Token: \(deviceToken)")
                  super.application(application,didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
                  }
}

private func registerPlugins(registry: FlutterPluginRegistry) {
    if (!registry.hasPlugin("FlutterDownloaderPlugin")) {
       FlutterDownloaderPlugin.register(with: registry.registrar(forPlugin: "FlutterDownloaderPlugin")!)
    }
}
