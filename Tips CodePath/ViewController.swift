//
//  ViewController.swift
//  Tips CodePath
//
//  Created by Timothy Horng on 12/30/15.
//  Copyright © 2015 Timothy Horng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        self.title = "Tip Calculator"
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let tipValue = defaults.doubleForKey("default_tip_percentage")
        
        if tipValue == 0.18 {
            tipControl.selectedSegmentIndex = 0
        } else if tipValue == 0.2 {
            tipControl.selectedSegmentIndex = 1
        } else {
            tipControl.selectedSegmentIndex = 2
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        var tipPercentages = [0.18, 0.2, 0.22]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = Double(billField.text!)
        var tip = billAmount! * tipPercentage
        var total = billAmount! + tip
        
        tip = Double(round(100*tip)/100)
        total = Double(round(100*total)/100)
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
    }

    @IBAction func onTap(sender: AnyObject) {
        
        view.endEditing(true)
        
    }
}

