//
//  Helper.swift
//  SisalTestCaseApplication
//
//  Created by Emir Kalkan on 8.06.2022.
//

import Foundation
import UIKit

class Helpers: UIViewController {
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

