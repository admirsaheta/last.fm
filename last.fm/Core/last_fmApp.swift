//
//  last_fmApp.swift
//  last.fm
//
//  Created by admin on 20.1.22..
//

import SwiftUI

@main
struct last_fmApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            SplashView()
        }
    }
}
