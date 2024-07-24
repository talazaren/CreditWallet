//
//  Person.swift
//  CreditWallet
//
//  Created by Tatiana Lazarenko on 7/21/24.
//

import Foundation

//MARK: - Observer. В Swift UI этот паттерн можно сказать вшит в @Observable и ObservableObject

final class Person: ObservableObject {
    let name: String
    let surname: String
    let password: String
    let avatar: String
    
    @Published var credits: [Credit]
    
    var fullName: String {
        "\(name)\n\(surname)"
    }
    
    init(name: String, surname: String, password: String, avatar: String, credits: [Credit]) {
        self.name = name
        self.surname = surname
        self.password = password
        self.avatar = avatar
        self.credits = credits
    }
    
    func addCredit(credit: Credit) {
        if !credits.contains(credit) {
            credits.append(credit)
        }
    }
    
    func deleteCredit(credit: Credit) {
        credits.removeAll(where: { $0.name == credit.name })
    }
}


