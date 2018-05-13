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
    @IBOutlet weak var lblHuisnummer: UILabel!
    @IBOutlet weak var lblPostcode: UILabel!
    @IBOutlet weak var lblGemeente: UILabel!
    
    
    
    @IBAction func transformImage(_ sender: UIPinchGestureRecognizer) {
        self.myImageView.transform =  CGAffineTransform(scaleX: sender.scale, y: sender.scale)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myLabel.text = persoon.naam
        self.lblVoornaam.text = persoon.voornaam
        self.lblAdres.text = persoon.adres.straat
        self.lblTelefoonnummer.text = String(persoon.telefoonnummer)
        self.myImageView.image = UIImage(named: persoon.foto)
        self.lblGemeente.text = persoon.adres.gemeente
        self.lblPostcode.text = String(persoon.adres.postcode)
        self.lblHuisnummer.text = String(persoon.adres.huisnummer)
        
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Meegeven van fotoinformatie aan volgende view
        if let nextVC = segue.destination as? ImageViewController
        {
            nextVC.image = myImageView.image!
        }
        
    }
}

