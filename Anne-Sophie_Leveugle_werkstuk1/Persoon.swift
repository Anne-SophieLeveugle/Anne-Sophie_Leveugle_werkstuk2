//
//  Persoon.swift
//  Anne-Sophie_Leveugle_werkstuk1
//
//  Created by Anne-Sophie Leveugle on 16/04/2018.
//  Copyright © 2018 Anne-Sophie Leveugle. All rights reserved.
//

import UIKit

class Persoon {
    var naam:String
    var voornaam:String
    var foto:String
    var adres:Adres
    var gpscoördinaten:[Double]
    var telefoonnummer:Int
    
    init() {
        naam = ""
        voornaam = ""
        foto = ""
        adres = Adres()
        gpscoördinaten = [0,0]
        telefoonnummer = 0
    }
    
    init(naam: String, voornaam:String, foto:String, adres:Adres, gpscoördinaten:[Double], telefoonnummer:Int){
        self.naam = naam
        self.voornaam = voornaam
        self.foto = foto
        self.adres = adres
        self.gpscoördinaten = gpscoördinaten
        self.telefoonnummer = telefoonnummer
    }
}
