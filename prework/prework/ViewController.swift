//
//  ViewController.swift
//  prework
//
//  Created by Sunny Yu on 7/20/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var billAmountTextField: UITextField!
    
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipAmountSlider: UISlider!
    @IBOutlet weak var tipAmountSliderValue: UILabel!
    
    @IBOutlet weak var splitSliderValue: UILabel!
    @IBOutlet weak var splitSlider: UISlider!
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var splitTotalLabel: UILabel!
    
    //default tip is 10%
    var tc = TipCalculator(billAmountBeforeTax: 0, tipPercentage: 0.1)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //bill amount is always the first responder
        billAmountTextField.becomeFirstResponder()
    }
    
    func calculateTip() {
        tc.tipPercentage = Double(tipAmountSlider.value) / 100.0
        tc.billAmountBeforeTax = Double(billAmountTextField.text!) ?? 0
        tc.calculateTip()
        updateUI()
        
    }
    
    func updateUI() {
        tipAmountLabel.text = String( format: "$%.2f", tc.tipAmount)
        totalLabel.text =  String( format: "$%.2f", tc.totalAmount)
        let numOfPeople: Int = Int(splitSlider.value)
        splitTotalLabel.text = String( format: "$%.2f", tc.totalAmount/Double(numOfPeople))
        
    }
    
    @IBAction func tipSliderChanged( sender: Any) {
        tipAmountSliderValue.text = ("Tip: \(Int(tipAmountSlider.value))%")
        calculateTip()
    }
    
    @IBAction func splitSliderChanged( sender: Any) {
        splitSliderValue.text = ("Split: \(Int(splitSlider.value))")
        calculateTip()
        
    }
    
    @IBAction func billAmtChanged( sender: Any) {
        calculateTip()
    }
    
    
    
    
    
    
    

}

