//
//  Alert.swift
//  MapkitTest
//
//  Created by cloud_vfx on 21/07/22.
//

import Foundation
import UIKit

extension UITableViewController {

    func alertCity(title: String , placeHolder: String , completion : @escaping(String) -> Void){
      
        let alertCont = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        
        let alertOk = UIAlertAction(title: "Ok", style: .default) { action in
            let tftext = alertCont.textFields?.first
            guard let text = tftext?.text else {return}
            completion(text)
        }
        
        alertCont.addTextField { tf in
            tf.placeholder = "Add city"
            tf.autocapitalizationType = .sentences
        }
        alertCont.addAction(alertOk)
        
        present(alertCont, animated: true, completion: nil)
    }
}

extension ViewController {
    func alertError(title : String, message: String){
        let alertCont = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertOk = UIAlertAction(title: "OK", style: .default)
        
        alertCont.addAction(alertOk)
        
        present(alertCont, animated: true, completion: nil)
    }
}


