//
//  CreditWalletApp.swift
//  CreditWallet
//
//  Created by Tatiana Lazarenko on 7/21/24.
//

import SwiftUI
import SwiftData

@main
struct CreditWalletApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
            Person.self,
            Credit.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
