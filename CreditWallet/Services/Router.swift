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

@Observable
final class Router {
    var startScreen: Route = .main
    var path = NavigationPath()
    
    @ViewBuilder func view(for route: Route) -> some View {
        switch route {
        case .main:
            MainView()
        case .addCredit:
            AddCreditView()
        case .calculateCredit:
            CalculateCreditView()
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
