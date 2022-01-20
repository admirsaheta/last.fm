//
//  last_fmApp.swift
//  last.fm
//
//  Created by admin on 20.1.22..
//

import SwiftUI

@main
struct last_fmApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
