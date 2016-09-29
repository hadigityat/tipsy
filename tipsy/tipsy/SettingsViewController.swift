//
//  SettingsViewController.swift
//  tipsy
//
//  Created by Can Algan on 9/28/16.
//  Copyright © 2016 Can Algan. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl! 

    weak  var calculatorView: ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipControl.selectedSegmentIndex = UserDefaults.standard.integer(forKey: "tip")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

//
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//    }

    @IBAction func onTipPercentChanged(_ sender: AnyObject) {
        if let cal = calculatorView {
            cal.mTipControl.selectedSegmentIndex = tipControl.selectedSegmentIndex
            cal.onBillChanged(sender)
            let pref = UserDefaults.standard
            pref.set(tipControl.selectedSegmentIndex, forKey: "tip")
            pref.synchronize()
        }
        
        self.navigationController!.popToViewController(self, animated: true)
    }
    

}
