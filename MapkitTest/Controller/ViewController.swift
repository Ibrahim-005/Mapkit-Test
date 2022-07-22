//
//  ViewController.swift
//  MapkitTest
//
//  Created by cloud_vfx on 21/07/22.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var mapview: MKMapView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var annotationArray = [MKPointAnnotation]()
    var cityName : String!
    var name : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpPlacemark(address: name)
    }
    
    func setUpPlacemark(address : String ){
        
        getCity(city: address) {[self] cordinat in
            
            let annotation = MKPointAnnotation()
            annotation.title = "\(address)"
            
            guard let cordinate = cordinat else {
                self.alertError(title: "Failed", message: "Couldn't fint City")
                return
            }
            annotation.coordinate = cordinate
            
            self.annotationArray.append(annotation)
            self.mapview.showAnnotations(self.annotationArray, animated: true)
    }
}

    @IBAction func searchButton(_ sender: UIButton) {
        cityName = searchBar.text!
        setUpPlacemark(address: cityName)
    }
}
