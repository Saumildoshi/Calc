////
////  ViewModalCalc.swift
////  Calc
////
////  Created by Saumil Doshi on 04/12/24.
////
//
//import UIKit
//
//class CalcViewModel {
//    
//    // MARK: - Properties
//    var workings: String = "" {
//        didSet {
//            updateWorkings?(workings)
//        }
//    }
//    var result: String = "" {
//        didSet {
//            updateResult?(result)
//        }
//    }
//    
//    // Closures for binding
//    var updateWorkings: ((String) -> Void)?
//    var updateResult: ((String) -> Void)?
//    
//    // MARK: - Methods
//    func clearAll() {
//        workings = ""
//        result = ""
//    }
//    
//    func addToWorkings(value: String) {
//        if value == "%" {
//            workings += "*0.01"
//        } else {
//            workings += value
//        }
//    }
//    
//    func calculateResult() {
//        guard !workings.isEmpty else {
//            result = "Invalid Input"
//            return
//        }
//        
//        if validInput() {
//            let checkedWorkingForPercent = workings.replacingOccurrences(of: "%", with: "*0.01")
//            let expression = NSExpression(format: checkedWorkingForPercent)
//            if let calcResult = expression.expressionValue(with: nil, context: nil) as? Double {
//                result = formatResult(result: calcResult)
//            } else {
//                result = "Error"
//            }
//        } else {
//            result = "Invalid Input"
//        }
//    }
//    
//    func removeLastCharacter() {
//        if !workings.isEmpty {
//            workings.removeLast()
//        }
//    }
//    
//    private func validInput() -> Bool {
//        var correctedWorkings = ""
//        var lastOperator: Character? = nil
//        
//        for char in workings {
//            if specialCharacters(char: char) {
//                if char == "-" && lastOperator != nil {
//                    correctedWorkings.append(char)
//                    lastOperator = nil
//                    continue
//                }
//                if let lastOp = lastOperator, specialCharacters(char: lastOp) {
//                    correctedWorkings.removeLast()
//                }
//                lastOperator = char
//            } else {
//                lastOperator = nil
//            }
//            correctedWorkings.append(char)
//        }
//        
//        workings = correctedWorkings
//        return !(workings.first.map(specialCharacters) ?? false || workings.last.map(specialCharacters) ?? false)
//    }
//    
//    private func specialCharacters(char: Character) -> Bool {
//        return ["*", "/", "+", "-"].contains(char)
//    }
//    
//    private func formatResult(result: Double) -> String {
//        return result.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", result) : String(format: "%.2f", result)
//    }
//}
//
