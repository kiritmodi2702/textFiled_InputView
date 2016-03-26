//
//  ViewController.swift
//  textFiled_InputView
//
//  Created by Nimble Chapps on 26/03/16.
//  Copyright © 2016 Nimble Chapps. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate{

    @IBOutlet weak var textField_Date: UITextField!
    var datePicker : UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- textFiled Delegate
    func textFieldDidBeginEditing(textField: UITextField) {
        self.pickUpDate(self.textField_Date)
    }
    
    //MARK:- Function of datePicker 
    func pickUpDate(textField : UITextField){
        
        // DatePicker
        self.datePicker = UIDatePicker(frame:CGRectMake(0, 0, self.view.frame.size.width, 216))
        self.datePicker.backgroundColor = UIColor.whiteColor()
        self.datePicker.datePickerMode = UIDatePickerMode.Date
        textField.inputView = self.datePicker
        
        // ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .Default
        toolBar.translucent = true
        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()
        
        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .Plain, target: self, action: "doneClick")
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .Plain, target: self, action: "cancelClick")
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.userInteractionEnabled = true
        textField.inputAccessoryView = toolBar
        
    }
    
    // MARK:- Button Done and Cancel
    func doneClick() {
        let dateFormatter1 = NSDateFormatter()
        dateFormatter1.dateStyle = .MediumStyle
        dateFormatter1.timeStyle = .NoStyle
        textField_Date.text = dateFormatter1.stringFromDate(datePicker.date)
        textField_Date.resignFirstResponder()
    }
    func cancelClick() {
        textField_Date.resignFirstResponder()
    }

}

