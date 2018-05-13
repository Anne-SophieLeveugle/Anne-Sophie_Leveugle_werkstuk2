//
//  PersoonViewController.swift
//  Anne-Sophie_Leveugle_werkstuk1
//
//  Created by Anne-Sophie Leveugle on 16/04/2018.
//  Copyright © 2018 Anne-Sophie Leveugle. All rights reserved.
//

import UIKit
import MapKit


class PersoonViewController: UIViewController {
    var persoon = Persoon()
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var lblVoornaam: UILabel!
    @IBOutlet weak var lblAdres: UILabel!
    @IBOutlet weak var lblTelefoonnummer: UILabel!
    @IBOutlet weak var lblGps: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    
    
    @IBAction func transformImage(_ sender: UIPinchGestureRecognizer) {
        self.myImageView.transform =  CGAffineTransform(scaleX: sender.scale, y: sender.scale)
        
        
        //sender.scale = 1
        
        print("ok")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.myLabel.text = persoon.naam
        self.lblVoornaam.text = persoon.voornaam
        self.lblAdres.text = persoon.adres.straat
        self.lblTelefoonnummer.text = String(persoon.telefoonnummer)
        self.myImageView.image = UIImage(named: persoon.foto)
        
        let initialLocation = CLLocation(latitude: persoon.gpscoördinaten[0], longitude: persoon.gpscoördinaten[1])
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: persoon.gpscoördinaten[0], longitude: persoon.gpscoördinaten[1])
        mapView.addAnnotation(annotation)
        centerMapOnLocation(location: initialLocation)
    }
    
     let regionRadius: CLLocationDistance = 1000
     func centerMapOnLocation(location: CLLocation) {
     let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,regionRadius, regionRadius)

     mapView.setRegion(coordinateRegion, animated: true)
     }
    
    /*func mapView(_ mapView: MKMapView, didUpdate userlocation: MKUserLocation) {
        let center = CLLocationCoordinate2D(latitude: persoon.gpscoördinaten[0], longitude: persoon.gpscoördinaten[1])
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
   
        myMap.setRegion(region, animated: true)
    
    }*/
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        //Meegeven van fotoinformatie aan volgende view
        if let nextVC = segue.destination as? ImageViewController
        {
            nextVC.image = myImageView.image!
        }
        
    }
    
    
    
    
    
}

