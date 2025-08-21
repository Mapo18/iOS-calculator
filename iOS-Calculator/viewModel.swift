//
//  viewModel.swift
//  iOS-Calculator
//
//  Created by Maria Peña Ocampo on 8/08/25.
//

import Foundation
final class ViewModel:ObservableObject{
    @Published var textFieldValue: String = "0"
    
    var textFieldSavedValue: String = "0"
    var currentOperationToExecute: OperationType?
    var shouldRunOperation: Bool = false
    
    func Logic (Key: KeyboardButton){
        switch Key.type {
        case.number(let value):
            if shouldRunOperation{
                textFieldValue = "0"
                
            }
            textFieldValue = textFieldValue == "0" ? "\(value)" : textFieldValue + "\(value)"
        case.reset:
        textFieldValue = "0"
            textFieldSavedValue = "0"
            currentOperationToExecute = nil
            shouldRunOperation = false
        case.result:
            guard let operation = currentOperationToExecute else {
                return
            }
            switch operation {
            case .multiplication:
                let result = Double(textFieldSavedValue)! * Double(textFieldValue)!
                textFieldValue = String(result)

            case .sum:
                let result = Double(textFieldSavedValue)! + Double(textFieldValue)!
                textFieldValue = String(result)

            case .Subtract:
                let result = Double(textFieldSavedValue)! - Double(textFieldValue)!
                textFieldValue = String(result)

            case .divide:
                if Double(textFieldValue)! == 0 {
                    textFieldValue = "Error"
                } else {
                    let result = Double(textFieldSavedValue)! / Double(textFieldValue)!
                    textFieldValue = String(result)
                }
            }

        case.operation(let type):
            textFieldSavedValue = textFieldValue
            currentOperationToExecute = type
            shouldRunOperation = true
            
        }
    }
}
