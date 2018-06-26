//
//  ViewController.swift
//  maps
//
//  Created by Filip on 21.06.2018.
//  Copyright © 2018 Filip. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let latitude: CLLocationDegrees =  15.2
        
        let longitude: CLLocationDegrees = 80
        
        let latDelta: CLLocationDegrees = 0.05
        
        let longDelta: CLLocationDegrees = 0.05
        
         /* let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        
        let location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let region: MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        
        map.setRegion(region, animated: true)*/  //Long way but clear
        
        
        /*
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 15, longitude: 76)
        let region: MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        
        map.setRegion(region, animated: true)*/ //Longer case , harderd to easy manipulate
        
        
       // map.setRegion(MKCoordinateRegion(center: (CLLocationCoordinate2D(latitude: 52.23, longitude: 18.24)), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)), animated: true)
        
        map.setRegion(MKCoordinateRegion(center: (CLLocationCoordinate2D(latitude: latitude, longitude: longitude)), span: MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)), animated: true)
        
        
        let annotation = MKPointAnnotation()
        annotation.title = "Hello annotation"
        annotation.subtitle = "bla bla bla"
        annotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        map.addAnnotation(annotation)
        
        let uilpgr = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longpress(gestureRecognizer:)))
        uilpgr.minimumPressDuration = 2
        map.addGestureRecognizer(uilpgr)
        
        }
    
        @objc func longpress(gestureRecognizer: UIGestureRecognizer) {
            
            let touchPoint = gestureRecognizer.location(in: self.map)
            let coordinate = map.convert(touchPoint, toCoordinateFrom: self.map)
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotation.title = "You touche here"
            annotation.subtitle = "blabla"
            map.addAnnotation(annotation)
            
            
            

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

