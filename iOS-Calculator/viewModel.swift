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
                textFieldValue = "\(Int(textFieldValue)! * Int(textFieldSavedValue)!)"
            case .sum :
                textFieldValue = "\(Int(textFieldValue)! + Int(textFieldSavedValue)!)"
            case .Subtract:
                textFieldValue = "\(Int(textFieldValue)! - Int(textFieldSavedValue)!)"
            case .divide:
                textFieldValue = "\(Int(textFieldValue)! / Int(textFieldSavedValue)!)"
            }
        case.operation(let type):
            textFieldSavedValue = textFieldValue
            currentOperationToExecute = type
            shouldRunOperation = true
            
        }
    }
}
