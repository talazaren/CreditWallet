//
//  Person.swift
//  CreditWallet
//
//  Created by Tatiana Lazarenko on 7/21/24.
//

import Foundation

struct Person {
    let name: String
    let surname: String
    let password: String
    let avatar: String
    var credits: [Credit]
    
    var fullName: String {
        "\(name)\n\(surname)"
    }
    
    static var mockUser = Person(
        name: "Владимир",
        surname: "Путин",
        password: "j2i45fosd9",
        avatar: "Avatar",
        credits: [
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
    )
    
    mutating func addCredit(credit: Credit) {
        credits.append(credit)
    }
    
    mutating func deleteCredit(credit: Credit) {
        credits.removeAll(where: { $0.name == credit.name })
    }
}


