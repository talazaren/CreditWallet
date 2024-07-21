//
//  Credit.swift
//  CreditWallet
//
//  Created by Tatiana Lazarenko on 7/21/24.
//

import Foundation
import SwiftData

@Model
struct Credit {
    let name: String
    let percent: Double
    let fullCost: Int
    let initialFee: Int
    let term: Int
    
    init(name: String, percent: Double, fullCost: Int, initialFee: Int, term: Int) {
        self.name = name
        self.percent = percent
        self.fullCost = fullCost
        self.initialFee = initialFee
        self.term = term
    }
}
