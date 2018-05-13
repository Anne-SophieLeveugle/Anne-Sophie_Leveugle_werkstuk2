import UIKit

class Persoon {
    var naam:String
    var voornaam:String
    var foto:String
    var adres:Adres
    var gpscoördinaten:[Double]
    var telefoonnummer:String
    
    init() {
        naam = ""
        voornaam = ""
        foto = ""
        adres = Adres()
        gpscoördinaten = [0,0]
        telefoonnummer = ""
    }
    
    init(naam: String, voornaam:String, foto:String, adres:Adres, gpscoördinaten:[Double], telefoonnummer:String){
        self.naam = naam
        self.voornaam = voornaam
        self.foto = foto
        self.adres = adres
        self.gpscoördinaten = gpscoördinaten
        self.telefoonnummer = telefoonnummer
    }
}
