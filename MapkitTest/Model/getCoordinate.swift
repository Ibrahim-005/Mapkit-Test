//
//  getCoordinate.swift
//  MapkitTest
//
//  Created by cloud_vfx on 21/07/22.
//

import Foundation
import CoreLocation

func getCity(city: String , completion: @escaping (CLLocationCoordinate2D?) -> Void) {
    getCordinate(city: city) { cordinate, error in
        guard let cordinat = cordinate?.coordinate , error == nil else {return}
        completion(cordinat)
    }
}

func getCordinate(city: String, completin: @escaping(_ cordinate: CLLocation?, _ error:  Error?) -> ()){
    CLGeocoder().geocodeAddressString(city) { placemark, error in
        completin(placemark?.first?.location, error)
    }
}
