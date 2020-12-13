//
//  Signin_with_AppleApp.swift
//  Shared
//
//  Created by Chaudhery on 11/12/2020.
//

import SwiftUI

@main
struct Signin_with_AppleApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
