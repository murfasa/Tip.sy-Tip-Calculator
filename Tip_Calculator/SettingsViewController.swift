//
//  SettingsViewController.swift
//  Tip_Calculator
//
//  Created by Murtaza Ali on 8/26/21.
//

import UIKit

class SettingsViewController: UIViewController {

    let defaults = UserDefaults.standard
    let numberFormatter = NumberFormatter()
    
    @IBOutlet var starPercentFields: [UITextField]!
    @IBOutlet weak var darkModeBool: UISwitch!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //print("view will appear")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        
        // Retrieve selected value for key tipSelector and set current selected segment to the tipSelector value
        // let tipSelector = defaults.integer(forKey: "tipSelector")
        // print(tipSelector)
        
        // Retrieves the corresponding field in the Outlet Collection and updates it value to what was saved
        // while also formatting into a percent
        numberFormatter.numberStyle = .percent
        for (index, aField) in starPercentFields.enumerated() {
            
            aField.text = numberFormatter.string(from: defaults.object(forKey: "tipField" + String(index) + "Value") as! NSNumber)
        }
        
        if defaults.bool(forKey: "darkModeBool") {
            overrideUserInterfaceStyle = .dark
            
            darkModeBool.isOn = true
        } else {
            overrideUserInterfaceStyle = .light
            darkModeBool.isOn = false
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // print("view did appear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // print("view will disappear")
//        defaults.set(tipControl.selectedSegmentIndex, forKey: "tipSelector")
       
        saveFields()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        // print("view did disappear")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        starPercentFields[0].becomeFirstResponder()
        
        
    }

    @IBAction func darkModeChanged(_ sender: Any) {
        if darkModeBool.isOn == true {
            overrideUserInterfaceStyle = .dark
        } else {
            overrideUserInterfaceStyle = .light
        }
        defaults.set(darkModeBool.isOn, forKey: "darkModeBool")
    }
    func saveFields() {
        
        // Iterates through Outlet Collection starPercentFields and saves to it's own key with index.
        // If the value in the field is empty or not a double, it will be replaced with the default values.
        let defaultValues = [0.05, 0.10, 0.15, 0.18, 0.20, 0.25]
        
        numberFormatter.numberStyle = .percent
        numberFormatter.isLenient = true
        
        for (index, aField) in starPercentFields.enumerated() {
            let fieldValue = aField.text!
            
                // Convert from percentage to double
            let fieldNSNumber = numberFormatter.number(from: fieldValue) ?? NSNumber(value: defaultValues[index])
            
            defaults.set(fieldNSNumber, forKey: "tipField" + String(index) + "Value")
            
                /*if let value = Double(fieldValue) {
                defaults.set(value, forKey: "tipField" + String(index) + "Value")
            } else {
                defaults.set(defaultValues[index], forKey: "tipField" + String(index) + "Value")
            }*/
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
