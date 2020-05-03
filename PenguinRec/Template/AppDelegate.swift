//
//  AppDelegate.swift
//  PenguinRec
//
//  Created by Esmaeil MIRZAEE on 2020-05-03.
//  Copyright © 2020 TheBeaver. All rights reserved.
//

import UIKit
import AVFoundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let session = AVAudioSession.sharedInstance()
        do {
            try session.setCategory(.playAndRecord, options: .defaultToSpeaker)
            try session.setActive(true)
            
            session.requestRecordPermission({(granted: Bool) -> Void in
                if granted {
                    appHasMicAccess = true
                } else {
                    appHasMicAccess = false
                }
            })
        
        } catch let error as NSError {
            print("AVAudioSession configuration error: \(error.localizedDescription)")
        }
        
        registerDefaults()
        return true
    }
    
    private func registerDefaults() {
        var factorySettings = [String: Any]()
        factorySettings["Loop Audio"] = false
        factorySettings["Volume"] = 0.5
        factorySettings["Pen"] = 0.0
        factorySettings["Rate"] = 1.0
        
        UserDefaults.standard.register(defaults: factorySettings)
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


}

