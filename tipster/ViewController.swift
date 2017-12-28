//
//  ViewController.swift
//  tipster
//
//  Created by Jigyasaa Sood on 12/25/17.
//  Copyright © 2017 Jigyasaa Sood. All rights reserved.
//

import UIKit

class ViewController: UIViewController, customTipDelegate{

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipArray: UISegmentedControl!
    @IBOutlet weak var customTipArray: UISegmentedControl!
    @IBOutlet weak var miniView: UIView!
    @IBOutlet var bigView: UIView!
  
    var customTipData:Double = 0.0 //will save the numerical value of the custom tip given by user
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billField.becomeFirstResponder()
        //miniView.setGradientBackground(colorOne: Colors.blue, colorTwo: Colors.white)
        bigView.setGradientBackground(colorOne: Colors.blue, colorTwo: Colors.green)
        //billField.setGradientBackground(colorOne: Colors.darkGrey, colorTwo: Colors.lightGrey)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        billField.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //hides keyboard by tapping anywhere else on the screen
    @IBAction func onTap(_ sender: AnyObject) {
        
        view.endEditing(true)
    }
    
    //calculates the tip and total bill according to the tip percentage the user chose
    @IBAction func calculateTip(_ sender: AnyObject) {
        let tipPercentages = [0.10, 0.15, 0.20]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipArray.selectedSegmentIndex]
        
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    //calculates the custom tip and total bill according to the custom tip amount the user entered
    @IBAction func calculateCustomTip(_ sender: AnyObject) {
        var customTipPercentages = [0.0, 0.0]
        customTipPercentages[1] = customTipData
        
        let customBill = Double(billField.text!) ?? 0
        let customTip = customBill * ((customTipPercentages[customTipArray.selectedSegmentIndex])*0.01)
        
        let customTotal = customBill + customTip
        
        tipLabel.text = String(format: "$%.2f", customTip)
        totalLabel.text = String(format: "$%.2f", customTotal)
        
    }
    
    
    //update the custom segmented controller every time we edit the custom tip
    //text field on the settings page
    func updateCustomTipSegController(data: Double)
    {
        customTipArray.setTitle("\(data)%", forSegmentAt: 1)
        customTipData = data
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showUpdateCustomTip"  || segue.identifier == "SettingsViewPage" )
            {
                let settingsPage:SettingsViewController = segue.destination as! SettingsViewController
                settingsPage.delegate = self
            }
    }
    

    
    
}

