//
//  ViewController.swift
//  tips
//
//  Created by Wanting Huang on 1/1/15.
//  Copyright (c) 2015 Wan-Ting Huang. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var splitField: UITextField!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billField.text = ""
        splitField.text = "1"
        totalLabel.text = "$0.00"
        tipLabel.text = "$0.00"
        
        billField.becomeFirstResponder()
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = (billField.text as NSString).doubleValue
        var tip = billAmount * tipPercentage
        var split: Double! = (splitField.text as NSString).doubleValue

        var totalForEach = (billAmount + tip) / split
        
        //billField.text = "$\(billAmount)"
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(totalForEach)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", totalForEach)
    }
    
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    


}

