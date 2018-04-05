//
//  SequenceViewController.swift
//  Fibonacci
//
//  Created by BJ Brooks  on 7/24/17.
//  Copyright © 2017 brookswebpro. All rights reserved.
//

import UIKit

class SequenceViewController: UIViewController {

    
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var sequenceTextView: UITextView!
    
    @IBAction func testAction(_ sender: Any) {
        
        self.numberTextField.resignFirstResponder()
        //        resultLabel.text = "Button pressed "
        //        sequenceNumberText.text = ""
        var newNum = 0
        var num1 = 1
        var num2 = 1
        var i = 3
        var sequence: String
        let numberFormatter = NumberFormatter()
        numberFormatter.usesGroupingSeparator = true
        numberFormatter.groupingSeparator = ","
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        
        let testNum = Int(numberTextField.text!)
        if let numberEntered = testNum {
            numberTextField.text = ""
            if (numberEntered == 0 || numberEntered > 45) {
                sequence = "Enter a number between 1 and 45"
            } else if (numberEntered == 1) {
                sequence = "The first Fibonacci number is 1"
            } else {
                sequence = "The first \(numberEntered) Fibonacci numbers are (1) 1; (2) 1"
                while (i <= numberEntered) {
                    newNum = num1 + num2
                    num1 = num2
                    num2 = newNum
                    let newNSNumber = NSNumber(value: newNum)
                    let newNSNumberString = numberFormatter.string(from: newNSNumber)
                    
                    sequence += "; (\(i)) " + newNSNumberString!
                    i += 1
                }
            }
            sequenceTextView.text = sequence
        }
        else {
            sequenceTextView.text = "Please enter a number"
        }
        
        

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
