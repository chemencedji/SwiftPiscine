//
//  ViewController.swift
//  Day02
//
//  Created by Igor Chemencedji on 4/20/17.
//  Copyright © 2017 Igor Chemencedji. All rights reserved.
//

import UIKit

class ViewController:  UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var table: UITableView!
    
    class Person: NSObject {
        var name: String
        var date: String
        var desc: String
        
        init(n: String, da: String, d: String){
            self.name = n
            self.date = da
            self.desc = d
        }
        
        override public var description: String{
            return ("\(name)\n\(date)\n\(desc)")
        }
    }
    
    static var allPersons: [Person] = []
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return (ViewController.allPersons.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        tableView.backgroundColor = UIColor.black
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 150
        tableView.separatorColor = UIColor.black
        tableView.contentInset = UIEdgeInsets.zero
        
        //let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ArtistTableViewCell
        
        //cell.textLabel?.text = ViewController.allPersons[indexPath.row].description
        cell.testLabel?.text = ViewController.allPersons[indexPath.row].description
        
        
        cell.backgroundColor = UIColor.white
        cell.layer.borderWidth = 2.5
        cell.layer.cornerRadius = 10
        return cell
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

