//
//  ViewController.swift
//  Day3_3
//
//  Created by Igor Chemencedji on 4/23/17.
//  Copyright © 2017 Igor Chemencedji. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var tableImages: [String] = ["https://images-assets.nasa.gov/image/iss046e044208/iss046e044208~thumb.jpg",
                                 "https://images-assets.nasa.gov/image/nhq201611180002/nhq201611180002~thumb.jpg",
                                 "https://images-assets.nasa.gov/image/KSC-20170419-PH_KLS01_0052/KSC-20170419-PH_KLS01_0052~thumb.jpg",
                                 "https://images-assets.nasa.gov/image/ED14-0222-149/ED14-0222-149~thumb.jpg"]
    
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return (tableImages.count)
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ImageCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ImageCollectionViewCell
        let url = URL(string: tableImages[indexPath.row])
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            if data == nil {
                let urlName = self.tableImages[indexPath.row]
                let alertController = UIAlertController(title: "Error", message: "Cannot acces to \(urlName)", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: nil))
                self.present(alertController, animated: true, completion: nil)
            }
            else {
                DispatchQueue.main.async {
                    cell.loader.hidesWhenStopped = true
                    cell.loader.stopAnimating()
                    cell.myImage.image = UIImage(data: data!)
                }
            }
        }
        cell.loader.startAnimating()
        cell.layer.borderColor = (UIColor.black.cgColor)
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 5
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let s = segue.destination as! ScrollViewController
        let cell = sender! as! ImageCollectionViewCell
        s.image = cell.myImage.image!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


