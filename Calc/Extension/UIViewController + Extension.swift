//
//  UIViewController + Extension.swift
//  Calc
//
//  Created by Saumil Doshi on 30/11/24.
//

import UIKit

extension UIViewController {
    
    func setupAlert(title: String,message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default))
        self.present(alert, animated: true,completion: nil)
    }
    
}
