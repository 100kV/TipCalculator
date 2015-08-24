//
//  ViewController.swift
//  TipCalculator
//
//  Created by Kevin Raymundo on 8/23/15.
//  Copyright (c) 2015 100kV. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipSegment: UISegmentedControl!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculateTip(sender: AnyObject) {
        var tipPercentages = [0.15, 0.18, 0.2]
        
        var formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        formatter.locale = NSLocale.currentLocale() // This is the default
        
        var amount = NSString(string: billField.text).doubleValue
        
        var tipPercentage = tipPercentages[tipSegment.selectedSegmentIndex]
        
        var tip = amount * tipPercentage
        var total = amount + tip
        
        tipLabel.text = formatter.stringFromNumber(tip)
        
        totalLabel.text = formatter.stringFromNumber(total)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        var defaults = NSUserDefaults.standardUserDefaults()
        var defaultTipPercentageIndex = defaults.integerForKey("default_tip_percentage_index")
        
        tipSegment.selectedSegmentIndex = defaultTipPercentageIndex
        
        billField.becomeFirstResponder()
        calculateTip(billField);
    }
}

