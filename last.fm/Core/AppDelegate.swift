//
//  AppDelegate.swift
//  last.fm
//
//  Created by admin on 21.1.22..
//

import UIKit
import APIProvider

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        Task {
            await APICache.clear(.expired)
        }
        return true
    }
}
