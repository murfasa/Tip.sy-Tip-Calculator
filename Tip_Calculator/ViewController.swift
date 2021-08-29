//
//  ViewController.swift
//  Tip_Calculator
//
//  Created by Murtaza Ali on 8/26/21.
//

import UIKit

class ViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    let numberFormatter = NumberFormatter()
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var groupSizeField: UITextField!
    @IBOutlet weak var tipPerPersonLabel: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var starStepper: UIStepper!
    @IBOutlet var stars: [UIImageView]!
    
    override func viewWillAppear(_ animated: Bool) {
        // Refreshes with bill amount if tip setting is changed
        calculateTip()
        // print("main view will appear")
        
        if defaults.bool(forKey: "darkModeBool") {
            overrideUserInterfaceStyle = .dark
            
        } else {
            overrideUserInterfaceStyle = .light
        }
        
        // Sets bill amount text field as first responder so keyboard pops up
        billAmountTextField.becomeFirstResponder()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // print("view did appear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // print("view will disappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // print("view did disappear")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Sets navigation bar title
        self.title = "Tip Calculator"
    }
    
    @IBAction func textFieldUpdate(_ sender: Any) {
        calculateTip()
    }
    
    @IBAction func starStepperUpdate(_ sender: Any) {
        let starNoFill = UIImage(systemName: "star")
        let starFill = UIImage(systemName: "star.fill")
        // creates a switch case for starStepper's value and sets the corresponding stars to fill/notFilled
        switch starStepper.value {
        case 0:
            //print("5%")
            for i in 0...4 {
                UIView.transition(with: stars[i], duration: 0.4, options: .transitionCrossDissolve, animations: {
                    self.stars[i].image = starNoFill
                }, completion: nil)
            }
        case 1:
            //print("10%")
            for i in 0...0 {
                UIView.transition(with: stars[i], duration: 0.4, options: .transitionCrossDissolve, animations: {
                    self.stars[i].image = starFill
                }, completion: nil)
            }
            for i in 1...4 {
                UIView.transition(with: stars[i], duration: 0.4, options: .transitionCrossDissolve, animations: {
                    self.stars[i].image = starNoFill
                }, completion: nil)
            }
        case 2:
            //print("15%")
            for i in 0...1 {
                UIView.transition(with: stars[i], duration: 0.4, options: .transitionCrossDissolve, animations: {
                    self.stars[i].image = starFill
                }, completion: nil)
            }
            for i in 2...4 {
                UIView.transition(with: stars[i], duration: 0.4, options: .transitionCrossDissolve, animations: {
                    self.stars[i].image = starNoFill
                }, completion: nil)
            }
        case 3:
            //print("18%")
            for i in 0...2 {
                UIView.transition(with: stars[i], duration: 0.4, options: .transitionCrossDissolve, animations: {
                    self.stars[i].image = starFill
                }, completion: nil)
            }
            for i in 3...4 {
                UIView.transition(with: stars[i], duration: 0.4, options: .transitionCrossDissolve, animations: {
                    self.stars[i].image = starNoFill
                }, completion: nil)
            }
        case 4:
            //print("20%")
            for i in 0...3 {
                UIView.transition(with: stars[i], duration: 0.4, options: .transitionCrossDissolve, animations: {
                    self.stars[i].image = starFill
                }, completion: nil)
            }
            for i in 4...4 {
                UIView.transition(with: stars[i], duration: 0.4, options: .transitionCrossDissolve, animations: {
                    self.stars[i].image = starNoFill
                }, completion: nil)
            }
        case 5:
            //print("25%")
            for i in 0...4 {
                UIView.transition(with: stars[i], duration: 0.4, options: .transitionCrossDissolve, animations: {
                    self.stars[i].image = starFill
                }, completion: nil)
            }
        default:
            print("default")
        }
        
        // calculates tip to keep outputs fresh
        calculateTip()
    }
    
    func calculateTip() {
        // Set constant "bill" equal to billAmountTextField. If nil, assume 0
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Set constant "tipPercentages" equal to an array of 3 values
        // let tipPercentages = [0.15, 0.18, 0.2]
        // Set constant "tip" equal to constant "bill" multiplied by the index of tipControl's selection in the array tipPercentages
        // let tipSelector = defaults.integer(forKey: "tipSelector")
        
        let groupSize = Int(groupSizeField.text!) ?? 1
        
        
        // Retrieves current tip value using starStepper value and corresponding key through UserDefaults
        let tipValue = defaults.double(forKey: "tipField" + String(Int(starStepper.value)) + "Value")
        // print("tipField" + String(Int(starStepper.value)) + "Value")
        // print(tipValue)
        
        let tip = bill * tipValue
        let tipPerPerson = tip / Double(groupSize)
        let total = tip + bill
        
        numberFormatter.numberStyle = .currency
        tipPerPersonLabel.text = numberFormatter.string(from: NSNumber(value: tipPerPerson))! // String(format: "$%.2f", tipPerPerson
        tipAmountLabel.text = numberFormatter.string(from: NSNumber(value: tip))! // String(format: "$%.2f", tip)
        totalLabel.text = numberFormatter.string(from: NSNumber(value: total))! // String(format: "$%.2f", total)
    }
}

