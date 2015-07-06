//
//  FoodSaveViewController.swift
//  FoodBusters
//
//  Created by Mihriban Minaz on 05/07/15.
//  Copyright (c) 2015 Mihriban Minaz. All rights reserved.
//

import Foundation
import UIKit

class FoodSaveViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var foodCollection: UICollectionView!
    @IBOutlet weak var foodTF: UITextField!
    @IBOutlet weak var numberOfDaysSlider: UISlider!
    @IBOutlet weak var foodDayLbl: UILabel!
    
    private let reuseIdentifier = "FoodCollectionView"
    private let sectionInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
    private var foodList = [ShortcutFood]()
    private var selectedFood = ShortcutFood()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        insertItems()
        self.foodCollection.reloadData()
        self.foodCollection.selectItemAtIndexPath(NSIndexPath(forItem: 0, inSection: 0), animated: false, scrollPosition: UICollectionViewScrollPosition.CenteredVertically)
        setFoodDayLabelValue()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func saveBtnTapped(sender: AnyObject) {
        
        var savedFood = self.foodTF.text
        
        if count(savedFood) == 0 {
            savedFood = self.foodDayLbl.text
        }
        
        let alertVC : UIAlertController = UIAlertController(title: "Saved!", message: savedFood, preferredStyle: UIAlertControllerStyle.Alert)

        let cancelAction = UIAlertAction(title: "OK", style: .Cancel) { (action) in
        }
        alertVC.addAction(cancelAction)
        UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(alertVC, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func insertItems() {
    
        let firstFood : ShortcutFood = ShortcutFood()
        firstFood.foodImage = "sugar"
        firstFood.foodName = "Sugar"
        self.foodList.insert(firstFood, atIndex: 0)
        
        let secondFood : ShortcutFood = ShortcutFood()
        secondFood.foodImage = "sugar"
        secondFood.foodName = "Toilet Paper"
        self.foodList.insert(secondFood, atIndex: 1)
        
        let thirdFood : ShortcutFood = ShortcutFood()
        thirdFood.foodImage = "sugar"
        thirdFood.foodName = "Salt"
        self.foodList.insert(thirdFood, atIndex: 2)
        
        let fourthFood : ShortcutFood = ShortcutFood()
        fourthFood.foodImage = "sugar"
        fourthFood.foodName = "Bread"
        self.foodList.insert(fourthFood, atIndex: 3)
        
        let fifthFood : ShortcutFood = ShortcutFood()
        fifthFood.foodImage = "sugar"
        fifthFood.foodName = "Juice"
        self.foodList.insert(fifthFood, atIndex: 4)
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true;
    }
    
    //textfield func for the touch on BG
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.foodTF.resignFirstResponder()
        self.view.endEditing(true)
    }
    
    
    @IBAction func sliderValueChanged(sender: UISlider) {
        var currentValue = Int(sender.value)
        setFoodDayLabelValue()
    }
    
    //1
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //2
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return foodList.count
    }
    
    //3
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        //1
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! FoodCollectionView
        //2
        let foodData = foodList[indexPath.row]
        cell.backgroundColor = UIColor.clearColor()
        //3
        cell.foodImageView.image = UIImage(named:foodData.foodImage!)
        cell.foodName.text = foodData.foodName

        return cell
    }

    //1
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            return CGSize(width: 160, height: 160)
    }
    
    //3
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAtIndex section: Int) -> UIEdgeInsets {
            return sectionInsets
    }

    func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.selectedFood = self.foodList[indexPath.row]
        self.foodTF.text = ""
        setFoodDayLabelValue()
    }
    
    func setFoodDayLabelValue() {
        let foodName = self.selectedFood.foodName as String!
        self.foodDayLbl.text = "\(foodName) for \(Int(self.numberOfDaysSlider.value)) days"
    }
}