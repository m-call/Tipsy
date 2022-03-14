//
//  ViewController.swift
//  Tipsy
//
//  Created by Michael Callahan on 3/9/22.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    
    var tip = 0.10

    @IBAction func tipChanged(_ sender: UIButton) {
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        
        let buttonTitleNoPercent = String(buttonTitle.dropLast())
        
        let buttonTitleAsNumber = Double(buttonTitleNoPercent)!
        
        tip = buttonTitleAsNumber / 100
        
        billTextField.endEditing(true)
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let billAmount = billTextField.text!
        if billAmount != "" {
            let tipBillAmount = Double(billAmount)! + Double(billAmount)! * tip
            let splitAmount = tipBillAmount / Double(splitNumberLabel.text!)!
            let roundedSplitAmount = round(splitAmount * 100) / 100
            print(roundedSplitAmount)
        }
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            
        }
    }
    
}

