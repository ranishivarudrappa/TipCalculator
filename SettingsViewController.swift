//
//  ViewController2ViewController.swift
//  TipCalculator
//
//  Created by Rani Shivarudrappa on 3/11/17.
//  Copyright © 2017 Home. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        
        //Displaying the CustomTip
        label.text = (ViewController.customTip * 100).description + "%"
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        textField.resignFirstResponder()
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func textField(_ sender: Any) {
        
        //If TextField is empty,Update Placeholder
        if (textField.text?.isEmpty)! {
            textField.placeholder = "Enter Custom Tip!!"
        }
        else {
            let tipPercentage = Double(textField.text!)!/100;
            label.text = textField.text! + "%";
            
            //Update Static Variable CustomTip
            ViewController.customTip = tipPercentage
        }
    }

}
