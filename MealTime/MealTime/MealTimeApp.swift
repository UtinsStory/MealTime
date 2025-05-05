//
//  MealTimeApp.swift
//  MealTime
//
//  Created by Никита Соловьев on 30.04.2025.
//

import SwiftUI
import SwiftData

@main
struct MealTimeApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            TabBarView()
        }
        .modelContainer(sharedModelContainer)
    }
}
