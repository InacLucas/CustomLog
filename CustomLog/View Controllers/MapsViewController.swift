//
//  MapsViewController.swift
//  CustomLog
//
//  Created by treinamento on 09/09/19.
//  Copyright © 2019 in.kpro. All rights reserved.
//

import UIKit
import GoogleMaps

class MapsViewController: UIViewController {

    var mapView: GMSMapView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        GMSServices.provideAPIKey("AIzaSyAChTvskf4OFjhI-DX0G19O9OHzQgxE2Gc")
        
        let camera = GMSCameraPosition.camera(withLatitude: -23.515861, longitude: -46.834888, zoom: 12)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        
        view = mapView
        
        
        let currentLocation = CLLocationCoordinate2DMake(-23.515861, -46.834888)
        let marker = GMSMarker(position: currentLocation)
        marker.title = "Carapicuiba`s Park"
        marker.map = mapView
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(next(sender:)))
}
    
    @objc func next(sender: UIBarButtonItem) {
      
        let nextLocation = CLLocationCoordinate2DMake(27.989332, 86.925190)
       
        mapView?.camera     = GMSCameraPosition.camera(withLatitude: nextLocation.latitude, longitude: nextLocation.longitude, zoom: 15)
        
        let marker = GMSMarker(position: nextLocation)
        marker.title = "Teste 2"
        marker.map = mapView
        
        
        
       
        
    }
    
}
