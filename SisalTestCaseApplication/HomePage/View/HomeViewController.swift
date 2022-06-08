//
//  HomeViewController.swift
//  SisalTestCaseApplication
//
//  Created by Emir Kalkan on 7.06.2022.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - UI Elements
    private var homeTitle = UILabel()
    private var homeSearchBar = UISearchBar()
    private var homeTableView = UITableView()
    
    var items: [String] = ["1", "2", "3","1", "2", "3","1", "2", "3","1", "2", "3","1", "2", "3"]
    var logoImages: [UIImage] = [UIImage(named: "avengers.jpeg")!, UIImage(named: "avengers.jpeg")!, UIImage(named: "avengers.jpeg")!, UIImage(named: "avengers.jpeg")!]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Photo Application"
        setViews()
        customizeViews()
        setupTableView()
        
        //api request
        let url = URL(string: "\(Constants.baseUrl)soccer\(Constants.endpoint)")
        WebService().getDatas(url: url!) { (photos) in
            if let photos = photos {
                print(photos)
            }
        }
    }
    
    // MARK: - Functions
    private func setViews() {
        self.view.addSubview(homeTitle)
        self.view.addSubview(homeSearchBar)
        self.view.addSubview(homeTableView)
        /*
        homeTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.right.equalToSuperview().offset(-10)
            make.right.equalToSuperview().offset(10)
            make.centerX.equalToSuperview()
        }*/
        
        homeSearchBar.snp.makeConstraints { make in
            //make.top.equalTo(homeTitle.snp.bottom).offset(300)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.left.equalToSuperview().offset(5)
            make.right.equalToSuperview().offset(-5)
            make.height.equalTo(50)
        }
        
        homeTableView.snp.makeConstraints { make in
            make.top.equalTo(homeSearchBar.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(5)
            make.right.equalToSuperview().offset(-5)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-10)
        }
    }
    
    private func customizeViews() {
        //view
        view.backgroundColor = .white
        
        homeTitle.text = "Photos Application"
        
        homeSearchBar.placeholder = "Search Photos"
        homeSearchBar.delegate = self
        
    }
    
    private func setupTableView() {
        
        //tableview
        homeTableView.delegate = self
        homeTableView.dataSource = self
        homeTableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.cellId)
        self.view.addSubview(homeTableView)
        
        /*homeTableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view.safeAreaLayoutGuide)
        }*/
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return logoImages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.cellId, for: indexPath) as! CustomCell
            //cell.lblTitle.text = items[indexPath.row]
            cell.photo.image = logoImages[indexPath.row]
            return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //Show photo details
        let vc = DetailsViewController()
        vc.backButtonTitle = "backk"
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

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
        /*
        lblTitle.snp.makeConstraints { (make) in
            make.top.leading.equalTo(20)
            make.trailing.bottom.equalTo(-20)
        }*/
        
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
