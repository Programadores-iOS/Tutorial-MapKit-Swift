//
//  ViewController.swift
//  Tutorial-MapKitSwift
//
//  Created by Fernando Medina on 8/1/14.
//  Copyright (c) 2014 Programadores-iOS.net. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
                            
    @IBOutlet weak var mapa: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        mapa.delegate = self
        var ubicacion: CLLocationCoordinate2D =  CLLocationCoordinate2DMake(34.0219, -118.4814)
        var span : MKCoordinateSpan = MKCoordinateSpanMake(0.5, 0.5)
       
        var region : MKCoordinateRegion = MKCoordinateRegionMake(ubicacion, span)
       
        if CLLocationCoordinate2DIsValid (ubicacion) {
            mapa.setRegion(region, animated: true)
        }
        
        var annotation = MKPointAnnotation()
        annotation.setCoordinate(ubicacion)
        annotation.title = "Santa Monica, CA"
        annotation.subtitle = "Programadores-iOS.net"
        mapa.addAnnotation(annotation)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func mapView(mapaView: MKMapView!, viewForAnnotation anotacion: MKAnnotation!) -> MKAnnotationView! {
        if !(anotacion is MKPointAnnotation) {
            return nil
        }
        
        let reusarId = "anotacion"
        
        var anotacionView = mapaView.dequeueReusableAnnotationViewWithIdentifier(reusarId)
        if anotacionView == nil {
            anotacionView = MKAnnotationView(annotation: anotacion, reuseIdentifier: reusarId)
            anotacionView.image = UIImage(named:"mascota")
            anotacionView.canShowCallout = true
        }
        else {
            
            anotacionView.annotation = anotacion
        }
        
        return anotacionView
    }

}

