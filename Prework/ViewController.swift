    //
//  ViewController.swift
//  Prework
//
//  Created by Jonathan Estrada on 1/21/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipPercentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Tip Calculator"
        let defaults = UserDefaults.standard
        defaults.set(0.15, forKey: "defaultTipVal")
        defaults.synchronize()
        tipPercentLabel.text = String(defaults.double(forKey: "defaultTipVal"))
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        billAmountTextField.keyboardType = .numberPad
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let defaults = UserDefaults.standard
        let percent = 100 * defaults.double(forKey: "defaultTipVal")
        tipPercentLabel.text = String(format: "%.2f", percent) + "%"
        
        let colorScheme = defaults.string(forKey: "colorScheme")
        
        switch colorScheme {
        case "ocean":
            self.view.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        case "sky":
            self.view.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        case "coffee":
            self.view.backgroundColor = #colorLiteral(red: 1, green: 0.7504402995, blue: 0.4987524748, alpha: 1)
        case "forest":
            self.view.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        default:
            self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }


    @IBAction func calculateTip(_ sender: Any) {
        
        let defaults = UserDefaults.standard
        
        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Get Total tip by multiplying tip * tipPercentage
//        let tipPercentages = [0.15, 0.18, 0.2]
//        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        
        let tipPercent = defaults.double(forKey: "defaultTipVal")
        let tip = bill * tipPercent

        let total = bill + tip
    
//        tipPercentLabel.text = String(defaults.double(forKey: "tipPercentVal"))

        // Update Tip Amount Label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        // Update Total Amount
        totalLabel.text = String(format: "$%.2f", total)
    }
}

