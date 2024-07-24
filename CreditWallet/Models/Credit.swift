//
//  Credit.swift
//  CreditWallet
//
//  Created by Tatiana Lazarenko on 7/21/24.
//

import Foundation

struct Credit: Identifiable, Hashable {
    let id = UUID()
    var name: String
    var percent: String
    var fullCost: String
    var initialFee: String
    var term: String
    
    var monthlyPayment: Double {
        let numerator = loanAmount * monthlyInterestRate * pow(1 + monthlyInterestRate, totalPayments)
        let denominator = pow(1 + monthlyInterestRate, totalPayments) - 1
    
        return numerator / denominator
    }
    
    var totalAmountPaid: Double {
        monthlyPayment * totalPayments
    }
    
    var totalInterestPaid: Double {
        totalAmountPaid - loanAmount
    }
    
    private var loanAmount: Double {
        (Double(fullCost) ?? 0.0) - (Double(initialFee) ?? 0.0)
    }
    
    private var monthlyInterestRate: Double {
        ((Double(percent) ?? 0.0) / 100) / 12
    }
    
    private var totalPayments: Double {
        (Double(term) ?? 0.0) * 12
    }
}
