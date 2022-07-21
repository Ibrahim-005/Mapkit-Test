//
//  ViewController.swift
//  MapkitTest
//
//  Created by cloud_vfx on 21/07/22.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapview: MKMapView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var annotationArray = [MKPointAnnotation]()
    var textc : String!
    var name : String = "London"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpPlacemark(address: name)
       // searchBarr.delegate = self
    }
    
     func setUpPlacemark(address : String){
        
        getCity(city: address) { cordinat in
            
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
        textc = searchBar.text!
        setUpPlacemark(address: textc)
    }
}

