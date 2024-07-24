//
//  ContentView.swift
//  CreditWallet
//
//  Created by Tatiana Lazarenko on 7/21/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var router = Router()
    @StateObject private var user = Person(
        name: MockData.shared.mockUser.name,
        surname: MockData.shared.mockUser.surname,
        password: MockData.shared.mockUser.password,
        avatar: MockData.shared.mockUser.avatar,
        credits: MockData.shared.mockUser.credits
    )
    
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
