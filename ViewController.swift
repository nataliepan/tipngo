//
//  ViewController.swift
//  TipNGo
//
//  Created by Natalie Pan on 2015-08-18.
//  Copyright (c) 2015 Natalie Pan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var checkAmountFld: UITextField!
    @IBOutlet weak var bgImage: UIImageView!
  
    @IBOutlet weak var tipFld: UITextField!
    
    @IBOutlet weak var tipAmountLbl: UILabel!
    @IBOutlet weak var totalAmountLbl: UILabel!
    @IBOutlet weak var shareAmountLbl: UILabel!
    @IBOutlet weak var tipPercentLbl: UILabel!
    @IBOutlet weak var shareCountLbl: UILabel!
    var people = ["2 people","3 people","4 people","5 people", "6 people", "7 people", "8 people", "9 people", "10 people"]

    @IBOutlet weak var peoplePicker: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
        checkAmountFld.text = ""
        tipAmountLbl.text = "$0.00"
        totalAmountLbl.text = "$0.00"
        shareAmountLbl.text = "$0.00"
        tipFld.text = "15"
        shareCountLbl.text = "2 people"
        
        tipPercentLbl.text = "% tip"
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    @IBAction func onTap(sender: AnyObject) {
            view.endEditing(true)
    }
    
    @IBAction func onEditChanged(sender: AnyObject) {
        var checkAmount = (checkAmountFld.text as NSString).floatValue
        var tipPercent = (tipFld.text as NSString).floatValue
        var tipAmount = ( tipPercent/100 * checkAmount)
        var totalAmount = (checkAmount + tipAmount)
       
        var pickerSelectIndex = peoplePicker.selectedRowInComponent(0)
        
        var shareAmount = totalAmount/Float (pickerSelectIndex + 2)
    
        tipAmountLbl.text = String(format: "$%.2f", tipAmount)
        totalAmountLbl.text = String(format: "$%.2f", totalAmount)
        shareAmountLbl.text = String(format: "$%.2f", shareAmount)
        
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    //Picker number of columns
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return people.count
    }
    
    //Picker text in rows
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return people[row]
    }
    
    //On Picker Selected
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        var people = row + 2;
        shareCountLbl.text = "\(people) people";
        
        var checkAmount = (checkAmountFld.text as NSString).doubleValue
        var tipAmount = 0.15 * checkAmount
        var totalAmount = checkAmount + tipAmount
        var shareAmount = totalAmount/Double(row + 2)
        shareAmountLbl.text = String(format: "$%.2f", shareAmount)
        
    }
}

