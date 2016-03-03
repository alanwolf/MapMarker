//
//  ViewController.swift
//  MapMarker
//
//  Created by Alan Wolf on 2/17/16.
//  Copyright © 2016 Wolf Cottage, LLC. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate{
    @IBOutlet weak var mapview :MKMapView?
    var locationManager :CLLocationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
    
    }
    func setup() {
     
        self.locationManager.delegate = self
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.startUpdatingLocation()
        self.mapview!.showsUserLocation = true
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func mapView(mapView: MKMapView, didUpdateUserLocation userLocation: MKUserLocation){
        let region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 100,100)
        self.mapview!.setRegion(region, animated: true)
    }

}

