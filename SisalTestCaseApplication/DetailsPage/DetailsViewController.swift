//
//  DetailsViewController.swift
//  SisalTestCaseApplication
//
//  Created by Emir Kalkan on 7.06.2022.
//

import UIKit
import SnapKit

class DetailsViewController: UIViewController {
    
    // MARK: - UI Elements
    private var detailTitle = UILabel()
    private var detailAuth = UILabel()
    private var detailName = UILabel()
    private var detailScore = UILabel()
    private var detailImage = UIImageView()
    
    
    // MARK: - Passing Values
    var backButtonTitle: String = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationItem.backButtonTitle = "\(backButtonTitle)"
        setViews()
        customizeViews()
        get()
    }
    
    // MARK: - Functions
    private func setViews() {
        self.view.addSubview(detailTitle)
        self.view.addSubview(detailAuth)
        self.view.addSubview(detailName)
        self.view.addSubview(detailScore)
        self.view.addSubview(detailImage)
        
        detailImage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.height.equalTo(300)
            make.width.equalTo(200)
            make.centerX.equalToSuperview()
        }
        
        detailTitle.snp.makeConstraints { make in
            make.top.equalTo(detailImage.snp.bottom).offset(40)
            make.left.equalToSuperview().offset(140)
            //make.height.equalTo(40)
        }
        
        detailAuth.snp.makeConstraints { make in
            make.top.equalTo(detailImage.snp.bottom).offset(40)
            make.left.equalTo(detailTitle.snp.right).offset(30)
            
            
            //make.centerX.equalTo(detailTitle)
            //make.right.equalToSuperview().offset(-5)
            //make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-10)
        }
        
        detailName.snp.makeConstraints { make in
            make.top.equalTo(detailTitle.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
        }
        
        detailScore.snp.makeConstraints { make in
            make.top.equalTo(detailName.snp.bottom).offset(80)
            make.centerX.equalToSuperview()
            //make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-50)
        }
    }
    
    private func customizeViews() {
        //view
        view.backgroundColor = .white
        detailImage.backgroundColor = .red
        
        detailTitle.text = "title"
        detailAuth.text = "auth"
        detailName.text = "name"
        detailScore.text = "11"
    }
    
    func get() {
        let url = URL(string: "https://www.reddit.com/r/soccer/top.json")
        URLSession.shared.dataTask(with: URL(string: "https://www.reddit.com/r/soccer/top.json")!, completionHandler: { data, response, error in
            
            guard let data = data, error == nil else { return }
            
            //convert
            var result: Photo?
            
            do{
                result = try JSONDecoder().decode(Photo.self, from: data)
            } catch {
                print("error")
            }
            
            guard let finalResult = result else { return }
            /*
            DispatchQueue.main.async {
                let url = finalResult.Poster
                /*if let data = try? Data(contentsOf: URL(string: url)!) {
                    self.posterImageView.image = UIImage(data: data)
                }*/
            }*/
        }).resume()
    }
    
    
}
