//
//  Router.swift
//  CreditWallet
//
//  Created by Tatiana Lazarenko on 7/22/24.
//

import SwiftUI

enum Route: Hashable {
    case main
    case addCredit
    case calculateCredit
}

final class Router: ObservableObject {
    @Published var startScreen: Route = .main
    @Published var path = NavigationPath()
    
    @ViewBuilder func view(for route: Route) -> some View {
        switch route {
        case .main:
            MainView()
                .navigationBarBackButtonHidden()
        case .addCredit:
            AddCreditView()
                .navigationBarBackButtonHidden()
        case .calculateCredit:
            CalculateCreditView()
                .navigationBarBackButtonHidden()
        }
    }
    
    func navigateTo(_ appRoute: Route) {
        path.append(appRoute)
    }
        
    func navigateBack() {
        path.removeLast()
    }
        
    func popToRoot() {
        path.removeLast(path.count)
    }
}
