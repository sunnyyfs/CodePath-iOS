//
//  calculateTip.swift
//  prework
//
//  Created by Sunny Yu on 7/20/22.
//

import Foundation

class TipCalculator {
    var billAmountBeforeTax: Double = 0
    var tipAmount: Double = 0
    var tipPercentage: Double = 0
    var totalAmount: Double = 0
    
    init(billAmountBeforeTax: Double, tipPercentage: Double) {
        self.billAmountBeforeTax = billAmountBeforeTax
        self.tipPercentage = tipPercentage
    }
    
    func calculateTip() {
        tipAmount = billAmountBeforeTax * tipPercentage
        totalAmount = tipAmount + billAmountBeforeTax
    }
}
