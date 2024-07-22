//
//  ContentView.swift
//  CreditWallet
//
//  Created by Tatiana Lazarenko on 7/21/24.
//

import SwiftUI

struct ContentView: View {
    @State private var router = Router()
    
    var body: some View {
        NavigationStack(path: $router.path) {
            router.view(for: router.startScreen)
                .navigationDestination(for: Route.self) { view in
                    router.view(for: view)
                }
        }
        .environment(router)
    }
    
}

#Preview {
    ContentView()
}
