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
    var cityName : String!
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
        cityName = searchBar.text!
        setUpPlacemark(address: cityName)
    }
}

//extension ViewController{
//func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//    // 2
//    guard let annotation = annotation else { return nil }
//    // 3
//    let identifier = "marker"
//    var view: MKMarkerAnnotationView
//    // 4
//    if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
//        as? MKMarkerAnnotationView {
//        dequeuedView.annotation = annotation
//        view = dequeuedView
//    } else {
//        // 5
//        view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
//        view.markerTintColor = .black
//        view.canShowCallout = true
//        view.calloutOffset = CGPoint(x: -5, y: 5)
//        view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
//    }
//    return view
//}
//    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
//        print("Button Press")
//        let alertController = UIAlertController(title: "Hello", message: "This will start alerts", preferredStyle: .alert)
//        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//        alertController.addAction(cancelAction)
//        self.present(alertController, animated: true, completion: nil)
//    }
//}
