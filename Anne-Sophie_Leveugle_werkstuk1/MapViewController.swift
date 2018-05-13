//
//  MapViewController.swift
//  Anne-Sophie_Leveugle_werkstuk1
//
//  Created by Anne-Sophie Leveugle on 12/05/2018.
//  Copyright © 2018 Anne-Sophie Leveugle. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

var personen = [Persoon]()

class MapViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var myMap: MKMapView!
    
    var locationManager = CLLocationManager()
    
    //Inladen elementen uit view
    
    override func viewDidLoad() {
        myMap.showsUserLocation = true
        myMap.delegate = self
        super.viewDidLoad()
        
        let persoon1 = Persoon(naam: "Leveugle", voornaam: "Anne-Sophie", foto:"foto1", adres:Adres(straat: "Zavel", huisnummer: 61, postcode: 2870, gemeente: "Puurs"), gpscoördinaten:[50.937581, 5.315562], telefoonnummer: 0470925334)
        let persoon2 = Persoon(naam: "De Raes", voornaam: "Nikki", foto:"foto2", adres:Adres(straat: "Kerkstraat", huisnummer: 20, postcode: 1860, gemeente: "Malderen"), gpscoördinaten:[51.287275, 4.758538], telefoonnummer: 0475276574)
        let persoon3 = Persoon(naam: "Van Campenhout", voornaam: "Frederik", foto:"foto3", adres:Adres(straat: "Hoogstraat", huisnummer: 27, postcode: 1537, gemeente: "Opdorp"), gpscoördinaten:[51.079586, 3.438007], telefoonnummer: 0467387263)
        let persoon4 = Persoon(naam: "Violet", voornaam: "Jonas", foto:"foto4", adres:Adres(straat: "Palingstraat", huisnummer: 101, postcode: 2650, gemeente: "Londerzeel"), gpscoördinaten:[50.624856, 4.667302], telefoonnummer: 0463748574)
        let persoon5 = Persoon(naam: "Van Lint", voornaam: "Lina", foto:"foto5", adres:Adres(straat: "Kerkstraat", huisnummer: 20, postcode: 6050, gemeente: "Brussel"), gpscoördinaten:[50.856254, 4.404570], telefoonnummer: 0473524364)
        
        personen.append(persoon1)
        personen.append(persoon2)
        personen.append(persoon3)
        personen.append(persoon4)
        personen.append(persoon5)
        
        print(personen.count)
        
        for i in 0 ..< personen.count{
            let annotation = MKPointAnnotation()
            annotation.title = "\(personen[i].voornaam) \(personen[i].naam)"
            annotation.subtitle = personen[i].adres.straat
            annotation.coordinate = CLLocationCoordinate2D(latitude: personen[i].gpscoördinaten[0], longitude: personen[i].gpscoördinaten[1])
            self.myMap.addAnnotation(annotation)
        }
        
        /*let initialLocation = CLLocation(latitude: persoon.gpscoördinaten[0], longitude: persoon.gpscoördinaten[1])
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: persoon.gpscoördinaten[0], longitude: persoon.gpscoördinaten[1])
        myMap.addAnnotation(annotation)*/
        
        //Lege var aanmaken voor gps coor
        /*var gpsSteve = CLLocationCoordinate2D()
        var gpsNatasha = CLLocationCoordinate2D()
        var gpsBruce = CLLocationCoordinate2D()
        
        //GPS coor invullen met data uit tabcontroller
        if let tbc = self.tabBarController as? TabController{
            gpsSteve = tbc.coorSteve
            gpsNatasha = tbc.coorNatasha
            gpsBruce = tbc.coorBruce
        }
        
        //Aanmaken van annotations
        let annotationSteve:MijnAnnotation = MijnAnnotation(coordinate: gpsSteve, title: "Steve")
        let annotationNatasha:MijnAnnotation = MijnAnnotation(coordinate: gpsNatasha, title: "Natasha")
        let annotationBruce:MijnAnnotation = MijnAnnotation(coordinate: gpsBruce, title: "Bruce")
        
        //Invoegen van annotations op map
        self.MijnTweedeMap.addAnnotation(annotationSteve)
        self.MijnTweedeMap.addAnnotation(annotationNatasha)
        self.MijnTweedeMap.addAnnotation(annotationBruce)
        self.MijnTweedeMap.showAnnotations(self.MijnTweedeMap.annotations, animated: true)*/
        
        //User location gebruiken
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Map centreren op user location
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let center = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 2, longitudeDelta: 2))
        
        mapView.setRegion(region, animated: true)
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
