//
//  ViewController.swift
//  tipsy
//
//  Created by Can Algan on 9/27/16.
//  Copyright © 2016 Can Algan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mTipControl: UISegmentedControl!
    @IBOutlet weak var mBillField: UITextField!
    @IBOutlet weak var mTotalLabel: UILabel!
    @IBOutlet weak var mTipLabel: UILabel!
    @IBOutlet weak var mSettingsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let tipIndex = UserDefaults.standard.integer(forKey: "tip")
        mTipControl.selectedSegmentIndex = tipIndex
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTouch(_ sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func onBillChanged(_ sender: AnyObject) {
        let bill = Double(mBillField.text!) ?? 0
        let pref = UserDefaults.standard
        pref.set(mTipControl.selectedSegmentIndex, forKey: "tip")
        pref.synchronize()
        calculateTipAndTotal(bill)
    }
    
    func calculateTipAndTotal(_ billAmount : Double) ->Void {
        let tipMultipliers = [0.18, 0.2, 0.22]
        let tip = billAmount*tipMultipliers[mTipControl.selectedSegmentIndex]
        let total = tip + billAmount
        
        mTipLabel.text = String(format: "$%.2f", tip)
        mTotalLabel.text = String(format: "$%.2f", total)
    }

    
    func changeTipIndex(_ tipIndex : Int) -> Void {

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // Get the new view controller using segue.destinationViewController.
            // Pass the selected object to the new view controller.
            if segue.identifier == "SettingsViewId" {
                let settingsVC = segue.destination as! SettingsViewController
                settingsVC.calculatorView = self;
            }
            
        }

}


