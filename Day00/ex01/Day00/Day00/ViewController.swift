//
//  ViewController.swift
//  Day00
//
//  Created by Igor Chemencedji on 4/18/17.
//  Copyright © 2017 Igor Chemencedji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var LabName: UILabel!

    @IBAction func Touch(_ sender: UIButton) {
        LabName.text = "Hello World !"
    }
}

