//
//  ScrollViewController.swift
//  Day3_3
//
//  Created by Igor Chemencedji on 4/23/17.
//  Copyright © 2017 Igor Chemencedji. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var ScroImage: UIImageView!
    
    @IBOutlet weak var ScroView: UIScrollView!
    
    var image = UIImage()
    var imageView : UIImageView?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //self.ScroImage.image = image
        imageView = UIImageView(image: image)
        ScroView.addSubview(imageView!)
        ScroView.contentSize = (imageView?.frame.size)!
        ScroView.maximumZoomScale = 6.0
        ScroView.minimumZoomScale = 1.0
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
