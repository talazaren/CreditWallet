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
    case calculateCredit(credit: Credit)
}

//MARK: - Observer. В Swift UI этот паттерн можно сказать вшит в @Observable и ObservableObject

final class Router: ObservableObject {
    @Published var startScreen: Route = .main
    @Published var path = NavigationPath()
    
    @ViewBuilder func view(for route: Route) -> some View {
        switch route {
        case .main:
            MainView()
                .navigationBarBackButtonHidden()
        case .addCredit:
            CreditView()
        case .calculateCredit(let credit):
            CalculateCreditView(credit: credit)
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
