//
//  UserData.swift
//  CreditWallet
//
//  Created by Tatiana Lazarenko on 7/21/24.
//

import Foundation

struct UserData {
    static let shared = UserData()
    
    let user = Person(
        name: "Владимир",
        surname: "Путин",
        password: "j2i45fosd9",
        credits: [
            Credit(
                name: "Ипотека 2-шка в центре Москвы",
                percent: 8,
                fullCost: 25_000_000,
                initialFee: 10_000_000,
                term: 30),
            Credit(
                name: "Лимузин",
                percent: 15,
                fullCost: 50_000_000,
                initialFee: 20_000_000,
                term: 10)
        ]
    )
    
    private init() {}
}
