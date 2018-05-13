//
//  Adres.swift
//  Anne-Sophie_Leveugle_werkstuk1
//
//  Created by Anne-Sophie Leveugle on 13/05/2018.
//  Copyright © 2018 Anne-Sophie Leveugle. All rights reserved.
//

import UIKit

class Adres{
    var straat:String
    var huisnummer:Int
    var postcode:Int
    var gemeente:String
    
    init(straat:String, huisnummer:Int, postcode:Int, gemeente:String) {
        self.straat = straat
        self.huisnummer = huisnummer
        self.postcode = postcode
        self.gemeente = gemeente
    }
    
    init() {
        self.straat = ""
        self.huisnummer = 0
        self.postcode = 0
        self.gemeente = ""
    }
}
