//
//  SecondViewController.swift
//  Day05
//
//  Created by Igor Chemencedji on 4/26/17.
//  Copyright © 2017 Igor Chemencedji. All rights reserved.
//

import UIKit

struct locationCity {
    let name: String
    let title: String
    let lat: Double
    let long: Double
    init(na: String, ti: String, la: Double, lo: Double) {
        self.name = na
        self.title = ti
        self.lat = la
        self.long = lo
    }
}

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    static var loc1 = locationCity(na: "Chisinau", ti: "Asta-i Chisinau", la: 47.0105, lo: 28.8638)
    static var loc2 = locationCity(na: "Balti", ti: "Asta-i Balti",la: 47.7539, lo: 27.9184)
    static var loc3 = locationCity(na: "Cahul", ti: "Asta-i Cahul",la: 45.8939, lo: 28.1890)

    static var locArray = [loc1, loc2, loc3]
    static var pArray = locationCity(na: "", ti: "", la: 0, lo: 0)
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return (SecondViewController.locArray.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        tableView.backgroundColor = UIColor.black
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 150
        tableView.separatorColor = UIColor.black
        tableView.contentInset = UIEdgeInsets.zero
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ArtistTableViewCell
        cell.testLabel?.text = SecondViewController.locArray[indexPath.row].name
        cell.backgroundColor = UIColor.white
        cell.layer.borderWidth = 2.5
        //cell.layer.cornerRadius = 10
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        SecondViewController.pArray = SecondViewController.locArray[indexPath.row]
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        //let resultViewController = storyBoard.instantiateViewController(withIdentifier: "First") as! FirstViewController
        let resultViewController = storyBoard.instantiateViewController(withIdentifier: "First01")
        self.present(resultViewController, animated:true, completion:nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

