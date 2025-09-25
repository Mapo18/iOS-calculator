//
//  Model.swift
//  iOS-Calculator
//
//  Created by Maria Peña Ocampo on 30/07/25.
//

import Foundation
import SwiftUICore

struct KeyboardButton: Hashable {
    let title: String
    let textColor: Color
    let backgroundColor: Color
    let isDoubleWidth : Bool
    let type : ButtonType
}
enum ButtonType: Hashable {
    case number (Int)
    case operation (OperationType)
    case result
    case reset
    case decimal
    case percent
}
enum OperationType: Hashable {
    case sum
    case multiplication
    case Subtract
    case divide
}


