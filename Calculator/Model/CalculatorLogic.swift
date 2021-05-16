//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Jesther Silvestre on 5/2/21.
//

import UIKit
struct CalculatorLogic {
    private var number:Double?
    private var intermediateCalculation:(n1:Double, calcMethod:String)?
    
    
    //setter function for number
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    //getter function for number
    func getNumber() -> Double {
        var  nonOptionalN:Double = 0
        if let n = number{
            nonOptionalN = n
        }
        return nonOptionalN
    }
    
    mutating func calculateFunction(symbol: String)-> Double? {
        if let n = number{
            switch symbol {
            case "+/-":return n*1;
            case "AC":return 0;
            case "%":return n*0.01
            case "=":return performTwoNumCalculation(n2: n)
            default: intermediateCalculation = (n1: n, calcMethod: symbol)
            }
        }
        return nil
    }
    
    
    func performTwoNumCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.calcMethod {
            //operations
            switch operation {
            case "+": return n1 + n2;
            case "-": return n1 - n2;
            case "×": return n1 * n2;
            case "÷": return n1 / n2;
            default: fatalError("walang matches sa mga operations mo!")
            }
        }
        return nil
    }
}
