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
    
    private var detailTitleLabel = UILabel()
    private var detailAuthLabel = UILabel()
    private var detailNameLabel = UILabel()
    private var detailScoreLabel = UILabel()
    
    // MARK: - Passing Values
    var passedTitle: String = ""
    var passedAuth: String = ""
    var passedScore: Int = 0 
    var passedImage: String = ""
    var passedName: String = ""
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        customizeViews()
    }
    
    // MARK: - Functions
    private func setViews() {
        self.view.addSubview(detailTitle)
        self.view.addSubview(detailAuth)
        self.view.addSubview(detailName)
        self.view.addSubview(detailScore)
        self.view.addSubview(detailImage)
        self.view.addSubview(detailTitleLabel)
        self.view.addSubview(detailNameLabel)
        self.view.addSubview(detailScoreLabel)
        self.view.addSubview(detailAuthLabel)
        
        detailImage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.height.equalTo(200)
            make.width.equalTo(300)
            make.centerX.equalToSuperview()
        }
        
        detailTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(detailImage.snp.bottom).offset(50)
            make.left.equalToSuperview().offset(30)
            //make.height.equalTo(40)
        }
        
        detailTitle.snp.makeConstraints { make in
            make.top.equalTo(detailImage.snp.bottom).offset(50)
            make.left.equalTo(detailTitleLabel.snp.right).offset(5)
            //make.right.equalToSuperview().offset(-10)
            make.width.equalTo(200)
        }
       
        detailNameLabel.snp.makeConstraints { make in
            make.top.equalTo(detailTitleLabel.snp.bottom).offset(50)
            make.left.equalToSuperview().offset(30)
        }
        
        detailName.snp.makeConstraints { make in
            make.top.equalTo(detailTitleLabel.snp.bottom).offset(50)
            make.left.equalTo(detailNameLabel.snp.right).offset(10)
        }
        
        detailScoreLabel.snp.makeConstraints { make in
            make.top.equalTo(detailNameLabel.snp.bottom).offset(50)
            make.left.equalToSuperview().offset(30)
        }
        
        detailScore.snp.makeConstraints { make in
            make.top.equalTo(detailNameLabel.snp.bottom).offset(50)
            make.left.equalTo(detailScoreLabel.snp.right).offset(10)
        }
    }
    
    private func customizeViews() {
        detailNameLabel.text = "Name:"
        detailTitleLabel.text = "Title:"
        detailScoreLabel.text = "Score:"
        
        //view
        view.backgroundColor = .white
        detailTitle.numberOfLines = 0
        
        let url = passedImage

        if url == "" {
            detailImage.image = UIImage(named: "notFound.png")
        } else {
            if let data = try? Data(contentsOf: URL(string: url)!) {
                detailImage.image = UIImage(data: data)
            }
        }
        detailTitle.text = passedTitle
        detailName.text = passedName
        detailScore.text = String(passedScore)
    }
}
