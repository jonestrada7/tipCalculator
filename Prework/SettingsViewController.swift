//
//  SettingsViewController.swift
//  Prework
//
//  Created by Jonathan Estrada on 1/23/21.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var defaultTip: UITextField!
    @IBOutlet weak var bgColorPicker: UIPickerView!
    
    var bgColors: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Connecting data
        self.bgColorPicker.reloadAllComponents()
        self.bgColorPicker.delegate = self
        self.bgColorPicker.dataSource = self
        
        bgColors = ["simple", "ocean", "sky", "coffee", "forest"]
        
        // Do any additional setup after loading the view.
        let defaults = UserDefaults.standard
        defaults.set(0.15, forKey: "defaultTipVal")
        defaults.set("simple", forKey: "colorScheme")
        defaults.synchronize()
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func saveSettings(_ sender: Any) {
        let defTip = Double(defaultTip.text!) ?? 0
        let defaults = UserDefaults.standard
        defaults.set(defTip, forKey: "defaultTipVal")
        defaults.synchronize()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return bgColors.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        let color: String = String(bgColors[row])
        return color
      }

    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        
        let color: String = bgColors[pickerView.selectedRow(inComponent: 0)]
        
        // Set color scheme of SettingsViewController
        
        switch color {
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
        
        // Save color scheme for use in main ViewController
        let defaults = UserDefaults.standard
        defaults.set(color, forKey: "colorScheme")
        defaults.synchronize()
        self.bgColorPicker.reloadAllComponents()
    }
}
