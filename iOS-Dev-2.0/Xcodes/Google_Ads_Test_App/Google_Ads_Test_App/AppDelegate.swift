//
//  AppDelegate.swift
//  Google_Ads_Test_App
//
//  Created by Serg Nepomyaschyy on 12.12.2021.
//

import UIKit
import GoogleMobileAds
import AdSupport
import AppTrackingTransparency

@main

class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        requestTrackingPermission()

        
        
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    func requestTrackingPermission() {
      if #available(iOS 14, *) {
        // ATTrackingManager.requestTrackingAuthorization { status in
        ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
          // Load Ads here later

          switch status {
          case .authorized:
            // Tracking authorization dialog was shown
            // and we are authorized
            print("Authorized")
             
            // Now that we are authorized we can get the IDFA
            print(ASIdentifierManager.shared().advertisingIdentifier)
              
          case .denied:
            // Tracking authorization dialog was
            // shown and permission is denied
            print("Denied")

          case .notDetermined:
            // Tracking authorization dialog has not been shown
            print("Not Determined")
          case .restricted:
            print("Restricted")
          @unknown default:
            print("Unknown")
          }
        }
      )}
    }

    

}
