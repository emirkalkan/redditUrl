//
//  WebService.swift
//  SisalTestCaseApplication
//
//  Created by Emir Kalkan on 8.06.2022.
//

import Foundation
import UIKit

class WebService {
    
    func getDatas(url: URL, completion: @escaping (Photo?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
                
            } else if let data = data {
               let photoList = try? JSONDecoder().decode(Photo.self, from: data)
                if let photoList = photoList {
                    completion(photoList)
                }
            }
        }.resume()
    }
}
