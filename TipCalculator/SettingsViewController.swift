//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Kevin Raymundo on 8/23/15.
//  Copyright (c) 2015 100kV. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultSettingsSegment: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        var defaults = NSUserDefaults.standardUserDefaults()
        var defaultTipPercentageIndex = defaults.integerForKey("default_tip_percentage_index")
        
        defaultSettingsSegment.selectedSegmentIndex = defaultTipPercentageIndex
    }
    
    @IBAction func setDefaultTipPercentage(sender: AnyObject) {
        var tipPercentageIndex = defaultSettingsSegment.selectedSegmentIndex
        
        var defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setInteger(tipPercentageIndex, forKey: "default_tip_percentage_index")
        defaults.synchronize()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
