//
//  ViewController.swift
//  Day00
//
//  Created by Igor Chemencedji on 4/18/17.
//  Copyright © 2017 Igor Chemencedji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var Result: UILabel!
    
    var inserted_number:Double = 0
    var previous_number:Double = 0
    var calc = false
    var operation = 0

    
    @IBAction func numbers(_ sender: UIButton) {
        
        if calc == true{
            Result.text = String(sender.tag-1)
            inserted_number = Double(Result.text!)!
            calc = false
        }
        else
        {
        Result.text = Result.text! + String(sender.tag-1)
        inserted_number = Double(Result.text!)!
        }
    }
    
    @IBAction func ft_neg(_ sender: UIButton) {
        if Result.text != ""{
        Result.text = String((-1) * Double(Result.text!)!)
        inserted_number = Double(Result.text!)!
        }
    }
    
    
    @IBAction func calculation(_ sender: UIButton) {
        if Result.text != "" && sender.tag != 11 && sender.tag != 17 && sender.tag != 16{
            
            if Result.text != "+" && Result.text != "-" && Result.text != "*" && Result.text != "/" && Result.text != "Not a number"{
                previous_number = Double(Result.text!)!
            }
            
            if sender.tag == 12{
                Result.text = "+"
            }
            else if sender.tag == 13{
                Result.text = "*"
            }
            else if sender.tag == 14{
                Result.text = "-"
            }
            else if sender.tag == 15{
                Result.text = "/"
            }
            operation = sender.tag
            calc = true

        }
        else if sender.tag  == 17 {
            if operation == 12{
                Result.text = String(previous_number + inserted_number)
            }
            else if operation == 13{
                if inserted_number == 0{
                Result.text = "0"
                inserted_number = 0
                previous_number = 0
                }
                else{
                    Result.text = String(previous_number * inserted_number)
                }
            }
            else if operation == 14{
                Result.text = String(previous_number - inserted_number)
            }
            else if operation == 15{
                if inserted_number != 0{
                Result.text = String(previous_number / inserted_number)
                }
                else{
                    Result.text = "Not a number"
                    inserted_number = 0
                    previous_number = 0
                    operation = 0
                    calc = false
                }
            }
        }
        else if sender.tag == 11{
            Result.text = ""
            inserted_number = 0
            previous_number = 0
            operation = 0
            calc = false
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        Result.adjustsFontSizeToFitWidth = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

