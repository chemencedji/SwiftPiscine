//
//  AddPersonViewController.swift
//  Day02
//
//  Created by Igor Chemencedji on 4/21/17.
//  Copyright © 2017 Igor Chemencedji. All rights reserved.
//

import UIKit

class AddPersonViewController: UIViewController {
    
    
    @IBOutlet weak var writeName: UITextField!
    @IBOutlet weak var pickerDate: UIDatePicker!
    @IBOutlet weak var descriptionLabel: UITextView!
    
    
    @IBAction func onAdd(_ sender: Any)
    {
        let new: ViewController.Person = ViewController.Person(n: writeName.text!, da: pickerDate.date.description(with: Locale.current), d: descriptionLabel.text!)
        ViewController.allPersons.append(new)
        let view = navigationController?.viewControllers[0] as? ViewController
        view?.table.reloadData()
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}
