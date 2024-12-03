//
//  CalcVC.swift
//  Calc
//
//  Created by Saumil Doshi on 29/11/24.
//

import UIKit

class CalcVC: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var btnClear: UIButton!
    @IBOutlet weak var btnRemove: UIButton!
    @IBOutlet weak var btnPercentage: UIButton!
    @IBOutlet weak var btnDevide: UIButton!
    
    @IBOutlet weak var btnMultiply: UIButton!
    @IBOutlet weak var btnEqual: UIButton!
    @IBOutlet weak var btnPlus: UIButton!
    @IBOutlet weak var btnMinus: UIButton!
    
    @IBOutlet weak var btnOne: UIButton!
    @IBOutlet weak var btnTwo: UIButton!
    @IBOutlet weak var btnThree: UIButton!
    @IBOutlet weak var btnFour: UIButton!
    @IBOutlet weak var btnFive: UIButton!
    @IBOutlet weak var btnSix: UIButton!
    @IBOutlet weak var btnSeven: UIButton!
    @IBOutlet weak var btnEight: UIButton!
    @IBOutlet weak var btnNine: UIButton!
    
    @IBOutlet weak var calcWorking: UILabel!
    @IBOutlet weak var calcResult: UILabel!
    
    
    // MARK: - Class properties
    
    var workings: String = ""
    
    // MARK: - Class functions
    
    func clearAll() {
        workings = ""
        calcWorking.text = ""
        calcResult.text = ""
    }
    
    func addToWorkings(value: String) {
        
        if value == "%" {
            if let currentText = calcWorking.text, let currentNumber = Double(currentText) {
                let percentageValue = currentNumber / 100
                calcWorking.text = "\(percentageValue)"
            }
        } else {
            workings = workings + value
            calcWorking.text = workings
        }
    }
    
    
    // MARK: - Action functions
    
    
    
    @IBAction func btnOneTapped(_ sender: Any) {
        addToWorkings(value: "1")
    }
    
    @IBAction func btnTwoTapped(_ sender: Any) {
        addToWorkings(value: "2")
    }
    
    
    @IBAction func btnThreeTapped(_ sender: Any) {
        addToWorkings(value: "3")
    }
    
    
    @IBAction func btnFourTapped(_ sender: Any) {
        addToWorkings(value: "4")
    }
    
    @IBAction func btnFiveTapped(_ sender: Any) {
        addToWorkings(value: "5")
    }
    
    @IBAction func btnSixTapped(_ sender: Any) {
        addToWorkings(value: "6")
    }
    
    @IBAction func btnSevenTapped(_ sender: Any) {
        addToWorkings(value: "7")
    }
    
    @IBAction func btnEightTapped(_ sender: Any) {
        addToWorkings(value: "8")
    }
    
    @IBAction func btnNineTapped(_ sender: Any) {
        addToWorkings(value: "9")
    }
    
    
    @IBAction func btnDotTapped(_ sender: Any) {
        addToWorkings(value: ".")
    }
    
    
    @IBAction func btnZeroTapped(_ sender: Any) {
        addToWorkings(value: "0")
    }
    
    
    @IBAction func btnEqualTapped(_ sender: Any) {
        
        guard !workings.isEmpty else {
            setupAlert(title: "Invalid Input", message: "Please enter a valid expression.")
            return
        }
        
        if(validInput()) {
            let checkedWorkingForPercent = workings.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: checkedWorkingForPercent)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            calcResult.text = resultString
        } else {
            let alert = UIAlertController(title: "Invalid Input", message: "Calculator enable to do math based on input", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true,completion: nil)
        }
    }
    
    func validInput() -> Bool {
        
        var count = 0
        var funcCharIndexs = [Int]()
        
        for char in workings {
            if(specialCharacters(char: char)) {
                funcCharIndexs.append(count)
            }
            count += 1
        }
        
        var previous: Int = -1
        
        for index in funcCharIndexs {
            if(index == 0) {
                return false
            }
            
            if(index == workings.count - 1) {
                return false
            }
            
            if(previous != 1) {
                if (index - previous == 1) {
                    return false
                }
            }
            previous = index
        }
        
        return true
    }
    
    func specialCharacters(char: Character) -> Bool {
        if(char == "*") {
            return true
        }
        if(char == "*") {
            return true
        }
        if(char == "/") {
            return true
        }
        if(char == "+") {
            return true
        }
        if(char == "-") {
            return true
        }
        return false
    }
    
    func formatResult(result: Double) -> String {
        if(result.truncatingRemainder(dividingBy: 1) == 0) {
            return String(format: "%.0f", result)
        } else {
            return String(format: "%.2f", result)
        }
    }
    
    @IBAction func btnPlusTapped(_ sender: Any) {
        addToWorkings(value: "+")
    }
    
    
    @IBAction func btnMinusTapped(_ sender: Any) {
        addToWorkings(value: "-")
    }
    
    @IBAction func btnMultiplyTapped(_ sender: Any) {
        addToWorkings(value: "*")
    }
    
    
    @IBAction func btnDevideTapped(_ sender: Any) {
        addToWorkings(value: "/")
    }
    
    @IBAction func btnPercentageTapped(_ sender: Any) {
        addToWorkings(value: "%")
    }
    
    @IBAction func btnRemoveTapped(_ sender: Any) {
        
        if let text = calcWorking.text, !text.isEmpty {
            calcWorking.text = String(text.dropLast())
            workings = String(workings.dropLast())
        } else {
            setupAlert(title: "Nothing to Remove", message: "The input is already empty.")
        }
    }
    
    
    @IBAction func btnAllClearTapped(_ sender: Any) {
        clearAll()
    }
    
    
    // MARK: - Web Service functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
        // Do any additional setup after loading the view.
    }
    
}
