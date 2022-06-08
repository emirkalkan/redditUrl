//
//  HomeViewModel.swift
//  SisalTestCaseApplication
//
//  Created by Emir Kalkan on 8.06.2022.
//

import Foundation
import UIKit

protocol HomeViewModelProtocol: NSObject {
    func updateList()
    func navigateToDetailVC(vc: UIViewController)
    func showToast(message:String,font:UIFont, width: Int, height: Int)
}

class HomeViewModel: NSObject {
    
    weak var delegate: HomeViewModelProtocol?
    
    var photoThumbnail = [String]()
    var photoTitle = [String]()
    var photoScore = [Int]()
    var photoName = [String]()
    
    func getData(url: URL, completion: @escaping (Photo?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {

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
                        DispatchQueue.main.async {
                        self.delegate?.showToast(message: "Data not found", font: .systemFont(ofSize: 14), width: 250, height: 40)
                        }
                    } catch {
                        print("error")
                    }
                }
            }
        }.resume()
    }
}

extension HomeViewModel: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return photoThumbnail.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.cellId, for: indexPath) as! CustomCell
        
        let url = photoThumbnail[indexPath.row]
        
        if url == "" {
            cell.photo.image = UIImage(named: "notFound.png")
        } else {
            if let data = try? Data(contentsOf: URL(string: url)!) {
                cell.photo.image = UIImage(data: data)
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //Show photo details
        let vc = DetailsViewController()
        vc.passedTitle = photoTitle[indexPath.row]
        vc.passedName = photoName[indexPath.row]
        vc.passedScore = photoScore[indexPath.row]
        vc.passedImage = photoThumbnail[indexPath.row]
        delegate?.navigateToDetailVC(vc: vc)
        //self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //searchbar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        photoThumbnail.removeAll()
        let url = URL(string: "\(Constants.baseUrl)\(searchText)\(Constants.endpoint)")
        
        if searchText == "" {
            photoThumbnail.removeAll()
        } else {
            getData(url: url!) { (photos) in
                if let photos = photos {
                    print(photos)
                    for item in photos.data.children {
                        self.photoThumbnail.append(item.data.thumbnail)
                        self.photoName.append(item.data.name)
                        self.photoTitle.append(item.data.title)
                        self.photoScore.append(item.data.score)
                    }
                    DispatchQueue.main.async {
                        self.delegate?.updateList()
                    }
                }
            }
        }
        self.delegate?.updateList()

    }
}
