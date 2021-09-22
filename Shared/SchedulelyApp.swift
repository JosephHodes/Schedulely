//
//  SchedulelyApp.swift
//  Shared
//
//  Created by joseph on 9/22/21.
//

import SwiftUI

@main
struct SchedulelyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
