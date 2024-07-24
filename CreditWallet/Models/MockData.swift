//
//  MockData.swift
//  CreditWallet
//
//  Created by Tatiana Lazarenko on 7/24/24.
//

import Foundation

//MARK: - Singleton

struct MockData {
    static let shared = MockData()
    
    let mockUser = Person(
        name: "Владимир",
        surname: "Путин",
        password: "j2i45fosd9",
        avatar: "Avatar",
        credits: [
            Credit(
                name: "2-шка за МКАДом",
                percent: "8",
                fullCost: "25000000",
                initialFee: "10000000",
                term: "30"),
            Credit(
                name: "Дача в Киеве",
                percent: "15",
                fullCost: "50000000",
                initialFee: "20000000",
                term: "10")
        ]
    )
    
    private init() {}
}
