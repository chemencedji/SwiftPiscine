//
//  ViewController.swift
//  Day07
//
//  Created by Igor Chemencedji on 5/2/17.
//  Copyright © 2017 Igor Chemencedji. All rights reserved.
//

import UIKit
import RecastAI

class ViewController: UIViewController {
    
    var bot : RecastAIClient?
    
    @IBOutlet weak var textInserted: UITextField!
    
    @IBAction func sendAction(_ sender: UIButton) {
        print("hello")
            self.bot?.textRequest(textInserted.text!, successHandler: { (data) -> Void in
                
                //let location: NSDictionary = data.entities!["location"] as! NSDictionary
               //     let lat = location["lat"]
                //    let lng = location["lng"]
                //    print("\(lat)")
                let intent = data.intent()
                self.resultGet.text = intent?.slug
            }, failureHandle: { (error) -> Void in
                self.resultGet.text = "Error"
            }
        )
    }
    @IBOutlet weak var resultGet: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //self.bot = RecastAIClient(token : "11314ceca58c3af180590ddf1223ea52")
        self.bot = RecastAIClient(token : "11314ceca58c3af180590ddf1223ea52", language: "en")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

