//
//  ViewController.swift
//  Calculator
//
//  Created by Jesther Silvestre on 5/2/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var displayLabel: UILabel!
    //variables
    private var calculator = CalculatorLogic()
    private var isFinishTyping:Bool = true
    private var displayValue:Double {
        get{
            guard let number = Double(displayLabel.text!) else {
                fatalError("Error Displaying Label to number")
            }
            return number
        }
        set{
            displayLabel.text = String(newValue)
            print("new displayLabel.text is set:\(newValue)")
        }
    }
    
    
    
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishTyping = true
        //What should happen when a non-number button is pressed
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle{
            if let result = calculator.calculateFunction(symbol: calcMethod){
                displayValue = result
            }
        }
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is pressed into the keypad
        if let numValue = sender.currentTitle{
            if isFinishTyping{
                displayLabel.text = numValue
                isFinishTyping = false
            }else{
                //fixing insertion of decimal point
                if numValue == "."{
                    let isInt:Bool = floor(displayValue) == displayValue
                    if !isInt {
                        return
                    }
                }
                //giving new set of numbers
                displayLabel.text = displayLabel.text! + numValue
                
            }
        }
        //adding to displayLabel
        
    }
    
}

