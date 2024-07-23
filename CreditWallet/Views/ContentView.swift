//
//  ContentView.swift
//  CreditWallet
//
//  Created by Tatiana Lazarenko on 7/21/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var router = Router()
    @StateObject private var user = Person()
    
    var body: some View {
        NavigationStack(path: $router.path) {
            router.view(for: router.startScreen)
                .navigationDestination(for: Route.self) { view in
                    router.view(for: view)
                }
        }
        .environmentObject(router)
        .environmentObject(user)
    }
    
}

#Preview {
    ContentView()
}
