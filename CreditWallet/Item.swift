//
//  Item.swift
//  CreditWallet
//
//  Created by Tatiana Lazarenko on 7/21/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
