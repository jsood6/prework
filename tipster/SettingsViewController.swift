//
//  SettingsViewController.swift
//  tipster
//
//  Created by Jigyasaa Sood on 12/26/17.
//  Copyright © 2017 Jigyasaa Sood. All rights reserved.
//

import UIKit

protocol customTipDelegate {
    func updateCustomTipSegController(data:Double)
}

class SettingsViewController: UIViewController {
    
    
    @IBOutlet weak var customTipField: UITextField!
    @IBOutlet var myView: UIView!
    @IBOutlet weak var myButton: UIButton!
    
    var delegate: customTipDelegate? = nil
    //var customTipData:Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.setGradientBackground(colorOne: Colors.white, colorTwo: Colors.green)
        myButton.setGradientBackground(colorOne: Colors.green, colorTwo: Colors.darkGrey)
        customTipField.becomeFirstResponder()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //hides the keyboard upon clicking anywhere else on the screen
    @IBAction func onTapSettings(_ sender: AnyObject) {
        
        view.endEditing(true)
        
    }
    
    //updating the custom tip amount
    @IBAction func updateCustomBtnPressed(_ sender: AnyObject) {
        
        if delegate != nil
        {
            if customTipField.text != nil
            {
                let data = Double(customTipField.text!) ?? 0
                
                delegate?.updateCustomTipSegController(data: data)
                
                //this will take us back to the first page
                navigationController!.popViewController(animated: true)
                
            }
        }
        
    }
    

}
