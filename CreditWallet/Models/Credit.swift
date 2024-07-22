//
//  Credit.swift
//  CreditWallet
//
//  Created by Tatiana Lazarenko on 7/21/24.
//

import Foundation

struct Credit: Identifiable {
    let id = UUID()
    let name: String
    let percent: Double
    let fullCost: Double
    let initialFee: Double
    let term: Double
    
    var monthlyPayment: Double {
        let numerator = loanAmount * monthlyInterestRate * pow(1 + monthlyInterestRate, totalPayments)
        let denominator: Double = pow(1 + monthlyInterestRate, totalPayments) - 1
    
        return numerator / denominator
    }
    
    var totalAmountPaid: Double {
        monthlyPayment * totalPayments
    }
    
    var totalInterestPaid: Double {
        totalAmountPaid - loanAmount
    }
    
    private var loanAmount: Double {
        fullCost - initialFee
    }
    
    private var monthlyInterestRate: Double {
        percent / 12
    }
    
    private var totalPayments: Double {
        term * 12
    }
}
