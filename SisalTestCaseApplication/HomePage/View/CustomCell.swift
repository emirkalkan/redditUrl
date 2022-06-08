//
//  CustomCell.swift
//  SisalTestCaseApplication
//
//  Created by Emir Kalkan on 8.06.2022.
//

import Foundation
import UIKit
import SnapKit

class CustomCell: UITableViewCell {
    
    static var cellId = "cell"

    let lblTitle: UILabel = {
        let v = UILabel()
        //v.backgroundColor = .systemGreen
        v.textColor = .black
        //v.textAlignment = .center
        v.layer.cornerRadius = 5
        v.layer.masksToBounds = true
        return v
    }()
    
    let photo: UIImageView = {
      let i = UIImageView()
      return i
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupUI() {
        self.addSubview(lblTitle)
        self.addSubview(photo)
        
        photo.snp.makeConstraints { make in
            //make.top.equalTo(lblTitle.snp.bottom).offset(20)
            make.top.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-20)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.width.equalTo(300)
            make.height.equalTo(200)
        }
    }
}

