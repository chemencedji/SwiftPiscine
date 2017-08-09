//
//  ViewController.swift
//  Day04
//
//  Created by Igor Chemencedji on 4/25/17.
//  Copyright © 2017 Igor Chemencedji. All rights reserved.
//

import UIKit

var allTweets: [Tweet] = []
var tokenGlobal: String = ""

struct Tweet: CustomStringConvertible {
    var name : String
    var text : String
    var date : String
    public var description: String {
        return "\(name)\n\(date)\n\(text)"
    }
}

protocol APITwitterDelegate {
    func threatTheTweets(name: [Tweet])
    func error(er: NSError)
}

class APIController {
    var delegate: APITwitterDelegate?
    var token: String = ""
    init(na: APITwitterDelegate){
        self.delegate = na
    }
    
    func queryRequest(dict: String){
        let info = URL(string: "https://api.twitter.com/1.1/search/tweets.json?q=\(dict)&count=100&lang=en&result_type=recent".addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)
        
        var url = URLRequest(url: info!)
        url.httpMethod = "GET"
        url.setValue("Bearer \(self.token)", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                self.delegate?.error(er: error! as NSError)
            }
            else
            {
                do {
                    let dic = try JSONSerialization.jsonObject(with: data!, options: []) as! [String: Any]
                    print(dic)
                    var t : [Tweet] = []
                    let statuses: [NSDictionary] = (dic["statuses"] as? [NSDictionary])!
                    for d in statuses {
                        let name = d["user"] as! NSDictionary
                        let date = d["created_at"]
                        let text = d["text"]
                        t.append(Tweet(name: name.value(forKey: "name")! as! String, text: text! as! String, date: date! as! String))
                    }
                    self.delegate?.threatTheTweets(name: t)
                }
                catch let err
                {
                    print(err)
                }
            }
        }
        task.resume()
    }
}


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, APITwitterDelegate, UISearchBarDelegate{
    
    
    @IBOutlet weak var serchBarr: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    //static let p = Tweet(name: "Ion", text: "Bag pula")
    
    var allTweets: [Tweet] = []
    
    func threatTheTweets(name: [Tweet])
    {
        self.allTweets = name
        self.tableView.reloadData()
    }
    
    func error(er: NSError)
    {
        print(er)
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return (allTweets.count)
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        //tableView.backgroundColor = UIColor.black
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 150
        tableView.separatorColor = UIColor.black
        tableView.contentInset = UIEdgeInsets.zero
        
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ArtistTableViewCell
        cell.testLabel?.text = allTweets[indexPath.row].name
        cell.testLabel2?.text = allTweets[indexPath.row].date
        cell.testLabel3?.text = allTweets[indexPath.row].text
        //cell.testLabel?.text = allTweets[indexPath.row].description
        cell.backgroundColor = UIColor.white
        cell.layer.borderWidth = 2.5
        //cell.layer.cornerRadius = 10
        return cell
    }
    
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let a = APIController(na: self)
        if (searchBar.text?.characters.count)! > 0 {
        a.token = tokenGlobal
        a.queryRequest(dict: searchBar.text!)
        }
        else {
            a.token = tokenGlobal
            a.queryRequest(dict: "ecole 42")
        }
    }
    
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let a = APIController(na: self)
        if (searchBar.text?.characters.count)! > 0 {
        a.token = tokenGlobal
        a.queryRequest(dict: searchBar.text!)
        }
        else {
            a.token = tokenGlobal
            a.queryRequest(dict: "ecole 42")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //serchBarr.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        let CUSTUMER_KEY = "Xdoz0kpNz79Cw1X5CaVGoc6EA"
        let CUSTUMER_SECRET = "GTQSXO9EamEVPSdUtM4SDPFiE7l6d9MdYXIGJgMurnqbcljJAN"
        let BEARER = ((CUSTUMER_KEY + ":" + CUSTUMER_SECRET).data(using: String.Encoding.utf8))!.base64EncodedString(options: NSData.Base64EncodingOptions.init(rawValue: 0))
        
        let url = URL(string: "https://api.twitter.com/oauth2/token")
        var request = URLRequest(url: url! as URL)
        request.httpMethod = "POST"
        request.setValue("Basic " + BEARER, forHTTPHeaderField: "Authorization")
        request.setValue("application/x-www-form-urlencoded;charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.httpBody = "grant_type=client_credentials".data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if nil != error{
                print(error.debugDescription)
            }
            else if let d = data {
                do {
                    let dic: Dictionary = try JSONSerialization.jsonObject(with: d, options: []) as! [String:Any]
                    let a = APIController(na: self)
                    a.token = (dic["access_token"] as? String)!
                    tokenGlobal = a.token
                    a.queryRequest(dict: "ecole 42")
                }
                catch (let err){
                    print(err)
                }
            }
        }
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

