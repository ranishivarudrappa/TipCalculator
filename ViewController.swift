//
//  ViewController.swift
//  TipCalculator
//
//  Created by Rani Shivarudrappa on 3/6/17.
//  Copyright © 2017 Home. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    //MARK: Variables
    
    @IBOutlet weak var AmountField: UITextField!
    @IBOutlet weak var TipField: UILabel!
    @IBOutlet weak var TotalField: UILabel!
    @IBOutlet weak var tipchoiceselector: UISegmentedControl!
    @IBOutlet weak var Message: UILabel!
    @IBOutlet weak var splitAmong: UIStepper!
    @IBOutlet weak var NoOfPersons: UILabel!
    
    var TipPercentage : Double!
    var noOfPersons : Double!
    
    static var customTip: Double = 0.18
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AmountField.delegate = self// Do any additional setup after loading the view, typically from a nib.
        NoOfPersons.text = Int(splitAmong.value).description;
        TipPercentage = ViewController.customTip;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldShouldReturn(_ AmountField: UITextField) -> Bool {   //delegate method
        AmountField.resignFirstResponder()
        return true
    }
    
    //MARK: Actions

    func calculateTip(_tip : Double) {
        var tip : Double!;
        
        if(_tip.isNaN) {
            tip = ViewController.customTip;
        }
        else {
            tip = _tip;
        }
        if(AmountField.text?.isEmpty)! {
            AmountField.placeholder = "Enter Amount!" ;
        }
        else {
            let amt = Double(AmountField.text!);
            TipField.text = (amt! * tip).description;
            TotalField.text = (amt! + (amt! * tip)).description;
        }
    }
    @IBAction func AmountEntered(_ sender: Any) {
        if((TipPercentage) != nil) {
            calculateTip(_tip: TipPercentage!)
        }
        else {
            calculateTip(_tip: ViewController.customTip)
        }
    }
    
    //Updates the TipPercentage based on the TipChoiceSelector.
    @IBAction func TIpChoice(_ sender: UISegmentedControl) {
        let index = tipchoiceselector.selectedSegmentIndex
        if(index == 0) {
            TipPercentage = 0.15
        }
        else if(index == 1) {
            TipPercentage = 0.18
        }
        else if(index == 2) {
            TipPercentage = 0.20
        }
        else if(index == 3) {
            TipPercentage = ViewController.customTip;
        }
        calculateTip(_tip: TipPercentage!)
    }
    
    //Splits the Tip based on Number of person splitting the bill
    @IBAction func Splitter(_ sender: Any) {
        noOfPersons = splitAmong.value;
        NoOfPersons.text = Int(noOfPersons).description;
        if((AmountField.text?.isEmpty)!) {
        }
        else {
            let amt = Double(AmountField.text!);
            TipField.text = NSString(format: "%.2f", ((amt! * TipPercentage) / noOfPersons)) as String;
            TotalField.text = NSString(format: "%.2f", ((amt! + (amt! * TipPercentage)) / noOfPersons)) as String;
            
            if( noOfPersons > 5) {
                Message.adjustsFontSizeToFitWidth = true;
                Message.textColor = UIColor.red;
                Message.text = "Check If Gratuity is Already Added !"
            }
            else {
                Message.text = ""
            }
        }
    }
    
}

