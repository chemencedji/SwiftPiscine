//
//  FirstViewController.swift
//  Day05
//
//  Created by Igor Chemencedji on 4/26/17.
//  Copyright © 2017 Igor Chemencedji. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class FirstViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    var boo: Bool = true
    var locManager = CLLocationManager()
    let annotation = MKPointAnnotation()
    var region:MKCoordinateRegion?
    
    @IBAction func zoom(_ sender: Any) {
        self.mapView.setRegion(self.region!, animated: true)
        print("OK")
    }
    
    @IBOutlet weak var SegControl: UISegmentedControl!
    
    @IBOutlet weak var mapView: MKMapView!
    @IBAction func SegAction(_ sender: UISegmentedControl) {
        switch (sender.selectedSegmentIndex) {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .satellite
        default:
            mapView.mapType = .hybrid
        }
    }
    
    var pinAnnotationView:MKPinAnnotationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locManager.requestWhenInUseAuthorization()
        locManager.delegate = self
        locManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locManager.distanceFilter = 10
        locManager.startUpdatingLocation()
        self.mapView.showsUserLocation = true
        if SecondViewController.pArray.title.characters.count > 1 {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: SecondViewController.pArray.lat, longitude: SecondViewController.pArray.long)
            annotation.title = SecondViewController.pArray.name
            annotation.subtitle = SecondViewController.pArray.title
            mapView.addAnnotation(annotation)
            mapView.mapType = .hybrid
        }
        else {
        for location in SecondViewController.locArray {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: location.lat, longitude: location.long)
            annotation.title = location.name
            annotation.subtitle = location.title
            mapView.addAnnotation(annotation)
            mapView.mapType = .hybrid
        }
        }
    }
    

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        let location = locations.last
        let center = CLLocationCoordinate2DMake((location?.coordinate.latitude)!, (location?.coordinate.longitude)!)
        self.region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
    }


    
    /*func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Errors " + error.localizedDescription)
    }\*/

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

