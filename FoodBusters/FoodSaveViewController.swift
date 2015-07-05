//
//  FoodSaveViewController.swift
//  FoodBusters
//
//  Created by Mihriban Minaz on 05/07/15.
//  Copyright (c) 2015 Mihriban Minaz. All rights reserved.
//

import Foundation
import UIKit

class FoodSaveViewController: UIViewController  {
    
    @IBOutlet weak var foodTF: UITextField!
    
    @IBOutlet weak var numberOfDaysSlider: UISlider!
    
    @IBOutlet weak var foodDayLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func saveBtnTapped(sender: AnyObject) {
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}