//
//  Person.swift
//  CreditWallet
//
//  Created by Tatiana Lazarenko on 7/21/24.
//

import Foundation

final class Person: ObservableObject {
    let name: String
    let surname: String
    let password: String
    let avatar: String
    @Published var credits: [Credit]
    
    var fullName: String {
        "\(name)\n\(surname)"
    }
    
    init() {
        self.name = "Владимир"
        self.surname = "Путин"
        self.password = "j2i45fosd9"
        self.avatar = "Avatar"
        self.credits = [
            Credit(
                name: "2-шка в центре Москвы",
                percent: "8",
                fullCost: "25000000",
                initialFee: "10000000",
                term: "30"),
            Credit(
                name: "Замок на берегу Сочи",
                percent: "15",
                fullCost: "50000000",
                initialFee: "20000000",
                term: "10")
        ]
    }
    
    func addCredit(credit: Credit) {
        credits.append(credit)
    }
    
    func deleteCredit(credit: Credit) {
        credits.removeAll(where: { $0.name == credit.name })
    }
}


