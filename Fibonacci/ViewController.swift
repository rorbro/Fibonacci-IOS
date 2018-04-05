//
//  ViewController.swift
//  Fibonacci
//
//  Created by BJ Brooks  on 6/22/17.
//  Copyright © 2017 brookswebpro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    var numberEntered = 0
    var num1 = 0
    var num2 = 0
    

    @IBOutlet weak var enterNumberLabel: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        self.enterNumberLabel.resignFirstResponder()

        var newNum = 0
        var num1 = 1
        var num2 = 1
        var counter = 2
        resultLabel.text = ""
        let testNum = Int(enterNumberLabel.text!)
        if let numberEntered = testNum {
            resultLabel.text = "\(numberEntered) was entered"
            enterNumberLabel.text = ""
            if (numberEntered == 0) {
                resultLabel.text = "0 is not a Fibonacci number. "
            } else if (numberEntered == 1) {
                resultLabel.text = "Yes, \(numberEntered) is a Fibonacci number! It is the 1st and 2nd Fibonacci numbers."
            } else if (numberEntered > 2000000000) {
                 resultLabel.text = "Please enter a smaller number"
            } else {

                while (numberEntered > newNum) {
                    newNum = num1 + num2
                    num1 = num2
                    num2 = newNum
                    counter += 1
                }
                if numberEntered == newNum {
                    
                    resultLabel.text = "Yes, " + convertToNSString(number: numberEntered) + " is a Fibonacci number! It is the \(counter)th number in the Fibonacci sequence. "
                } else {
                    resultLabel.text = "No, " + convertToNSString(number: numberEntered) + " is not a Fibonacci number. It comes between the \(counter-1)th Fibonacci number which is " + convertToNSString(number: num1) + " and the \(counter)th Fibonacci number which is " + convertToNSString(number: newNum) + "."
                }
            }
        }
        
        else {
            resultLabel.text = "Please enter a number"
        }
    }
    
    func convertToNSString (number:Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.usesGroupingSeparator = true
        numberFormatter.groupingSeparator = ","
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        
        let numberNS = NSNumber(value: number)
        let numberNSString = numberFormatter.string(from: numberNS)

        return numberNSString!
    
    }

    @IBOutlet weak var submitButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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


}

