//
//  HomeViewController.swift
//  SisalTestCaseApplication
//
//  Created by Emir Kalkan on 7.06.2022.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController, UISearchBarDelegate, HomeViewModelProtocol {
    func updateList() {
        homeTableView.reloadData()
    }
    func navigateToDetailVC(vc: UIViewController) {
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func showToast(message:String,font:UIFont, width: Int, height: Int){
        let toastLabel = UILabel()
        toastLabel.backgroundColor = UIColor(red:0.30, green:0.30, blue:0.30, alpha:1.0)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center
        toastLabel.text = message
        toastLabel.alpha = 1
        toastLabel.layer.cornerRadius = 18
        toastLabel.clipsToBounds = true
        self.view.addSubview(toastLabel)
        toastLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.view)
            make.centerX.equalTo(self.view)
            make.height.equalTo(height)
            make.width.equalTo(width)
        }
        UIView.animate(withDuration: 0.5, delay: 1.0, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
    // MARK: - UI Elements
    private var homeTitle = UILabel()
    private var homeSearchBar = UISearchBar()
    private var homeTableView = UITableView()
    
    private var homeViewModel = HomeViewModel()
    
    let webService = WebService()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Photo Application"
        setViews()
        customizeViews()
        setupTableView()
    }
    
    // MARK: - Functions
    private func setViews() {
        self.view.addSubview(homeTitle)
        self.view.addSubview(homeSearchBar)
        self.view.addSubview(homeTableView)
        
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
        homeSearchBar.delegate = homeViewModel
        homeSearchBar.autocapitalizationType = .none
        
    }
    
    private func setupTableView() {
        
        //tableview
        homeTableView.delegate = homeViewModel
        homeTableView.dataSource = homeViewModel
        homeViewModel.delegate = self
        homeTableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.cellId)
        self.view.addSubview(homeTableView)
    }
}
