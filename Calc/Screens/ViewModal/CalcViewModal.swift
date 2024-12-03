//
//  CalcViewModal.swift
//  Calc
//
//  Created by Saumil Doshi on 30/11/24.
//


//class CalcViewModel {
//    // Bindings for View
//    var onWorkingsUpdated: ((String) -> Void)?
//    var onResultUpdated: ((String) -> Void)?
//    var onError: ((String) -> Void)?
//    
//    private var workings: String = ""
//    
//    // MARK: - Methods
//    
//    func clearAll() {
//        workings = ""
//        notifyWorkingsUpdated()
//        onResultUpdated?("")
//    }
//    
//    func addToWorkings(value: String) {
//        workings += value
//        notifyWorkingsUpdated()
//    }
//    
//    func removeLastCharacter() {
//        guard !workings.isEmpty else { return }
//        workings.removeLast()
//        notifyWorkingsUpdated()
//    }
//    
//    func calculateResult() {
//        if validInput() {
//            let expressionString = workings.replacingOccurrences(of: "%", with: "*0.01")
//            let expression = NSExpression(format: expressionString)
//            let result = expression.expressionValue(with: nil, context: nil) as? Double ?? 0.0
//            let formattedResult = formatResult(result: result)
//            onResultUpdated?(formattedResult)
//        } else {
//            onError?("Invalid Input. Unable to calculate.")
//        }
//    }
//    
//    // MARK: - Private Helper Methods
//    
//    private func validInput() -> Bool {
//        var count = 0
//        var funcCharIndexes = [Int]()
//        
//        for char in workings {
//            if specialCharacters(char: char) {
//                funcCharIndexes.append(count)
//            }
//            count += 1
//        }
//        
//        var previous: Int = -1
//        
//        for index in funcCharIndexes {
//            if index == 0 || index == workings.count - 1 {
//                return false
//            }
//            if previous != -1, index - previous == 1 {
//                return false
//            }
//            previous = index
//        }
//        
//        return true
//    }
//    
//    private func specialCharacters(char: Character) -> Bool {
//        return ["*", "/", "+", "-", "%"].contains(char)
//    }
//    
//    private func formatResult(result: Double) -> String {
//        return result.truncatingRemainder(dividingBy: 1) == 0
//            ? String(format: "%.0f", result)
//            : String(format: "%.2f", result)
//    }
//    
//    private func notifyWorkingsUpdated() {
//        onWorkingsUpdated?(workings)
//    }
//}
//
