////
////  ViewCalc.swift
////  Calc
////
////  Created by Saumil Doshi on 04/12/24.
////
//
//
//
//import UIKit
//
//class CalcVC: UIViewController {
//    
//    // MARK: - Outlets
//    @IBOutlet weak var btnClear: UIButton!
//    @IBOutlet weak var btnRemove: UIButton!
//    @IBOutlet weak var btnPercentage: UIButton!
//    @IBOutlet weak var btnDevide: UIButton!
//    
//    @IBOutlet weak var btnMultiply: UIButton!
//    @IBOutlet weak var btnEqual: UIButton!
//    @IBOutlet weak var btnPlus: UIButton!
//    @IBOutlet weak var btnMinus: UIButton!
//    
//    @IBOutlet weak var btnOne: UIButton!
//    @IBOutlet weak var btnTwo: UIButton!
//    @IBOutlet weak var btnThree: UIButton!
//    @IBOutlet weak var btnFour: UIButton!
//    @IBOutlet weak var btnFive: UIButton!
//    @IBOutlet weak var btnSix: UIButton!
//    @IBOutlet weak var btnSeven: UIButton!
//    @IBOutlet weak var btnEight: UIButton!
//    @IBOutlet weak var btnNine: UIButton!
//    
//    @IBOutlet weak var calcWorking: UILabel!
//    @IBOutlet weak var calcResult: UILabel!
//    
//    // MARK: - ViewModel
//    private var viewModel = CalcViewModel()
//    
//    // MARK: - Lifecycle
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupBindings()
//    }
//    
//    // MARK: - Bindings
//    private func setupBindings() {
//        viewModel.updateWorkings = { [weak self] workings in
//            self?.calcWorking.text = workings
//        }
//        
//        viewModel.updateResult = { [weak self] result in
//            self?.calcResult.text = result
//        }
//        
//        viewModel.clearAll() // Initialize labels
//    }
//    
//    // MARK: - Actions
//    @IBAction func btnOneTapped(_ sender: Any) { viewModel.addToWorkings(value: "1") }
//    @IBAction func btnTwoTapped(_ sender: Any) { viewModel.addToWorkings(value: "2") }
//    @IBAction func btnThreeTapped(_ sender: Any) { viewModel.addToWorkings(value: "3") }
//    @IBAction func btnFourTapped(_ sender: Any) { viewModel.addToWorkings(value: "4") }
//    @IBAction func btnFiveTapped(_ sender: Any) { viewModel.addToWorkings(value: "5") }
//    @IBAction func btnSixTapped(_ sender: Any) { viewModel.addToWorkings(value: "6") }
//    @IBAction func btnSevenTapped(_ sender: Any) { viewModel.addToWorkings(value: "7") }
//    @IBAction func btnEightTapped(_ sender: Any) { viewModel.addToWorkings(value: "8") }
//    @IBAction func btnNineTapped(_ sender: Any) { viewModel.addToWorkings(value: "9") }
//    @IBAction func btnZeroTapped(_ sender: Any) { viewModel.addToWorkings(value: "0") }
//    @IBAction func btnDotTapped(_ sender: Any) { viewModel.addToWorkings(value: ".") }
//    
//    @IBAction func btnPlusTapped(_ sender: Any) { viewModel.addToWorkings(value: "+") }
//    @IBAction func btnMinusTapped(_ sender: Any) { viewModel.addToWorkings(value: "-") }
//    @IBAction func btnMultiplyTapped(_ sender: Any) { viewModel.addToWorkings(value: "*") }
//    @IBAction func btnDevideTapped(_ sender: Any) { viewModel.addToWorkings(value: "/") }
//    @IBAction func btnPercentageTapped(_ sender: Any) { viewModel.addToWorkings(value: "%") }
//    
//    @IBAction func btnEqualTapped(_ sender: Any) { viewModel.calculateResult() }
//    @IBAction func btnRemoveTapped(_ sender: Any) { viewModel.removeLastCharacter() }
//    @IBAction func btnAllClearTapped(_ sender: Any) { viewModel.clearAll() }
//}
//
