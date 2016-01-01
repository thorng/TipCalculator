//
//  SettingsViewController.swift
//  Tips CodePath
//
//  Created by Timothy Horng on 12/31/15.
//  Copyright © 2015 Timothy Horng. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipPercentages: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let tipValue = defaults.doubleForKey("default_tip_percentage")
        
        if tipValue == 0.18 {
            tipPercentages.selectedSegmentIndex = 0
        } else if tipValue == 0.2 {
            tipPercentages.selectedSegmentIndex = 1
        } else {
            tipPercentages.selectedSegmentIndex = 2
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onEditing(sender: AnyObject) {
        
        var tipPercentagesArray = [0.18, 0.2, 0.22]
        let tipPercentage = tipPercentagesArray[tipPercentages.selectedSegmentIndex]
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(tipPercentage, forKey: "default_tip_percentage")
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
