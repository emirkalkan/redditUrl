//
//  WebService.swift
//  SisalTestCaseApplication
//
//  Created by Emir Kalkan on 8.06.2022.
//

import Foundation
import UIKit

class WebService {
    
    func getData(url: URL, completion: @escaping (Photo?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
                
            } else if let data = data {
               /*let photoList = try? JSONDecoder().decode(Photo.self, from: data)
                if let photoList = photoList {
                    completion(photoList)
                }*/
                var photoList: Photo?
                var errorList: ErrorModel?
                do{
                    photoList = try JSONDecoder().decode(Photo.self, from: data)
                    if photoList?.error == 404 {
                        
                    } else {
                        if let photoList = photoList {
                            completion(photoList)
                        }
                    }
                } catch {
                    do {
                        errorList = try JSONDecoder().decode(ErrorModel.self, from: data)
                        /*DispatchQueue.main.async {
                            let alert = UIAlertController(title: "error", message: "", preferredStyle: UIAlertController.Style.alert)
                            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                        }*/
                        print("alertttelifo")
                    } catch {
                        print("error")
                    }
                }
            }
        }.resume()
    }
}
