//
//  HomeViewController.swift
//  NeddleDITest
//
//  Created by MIC KARAGIORGOS on 7/19/21.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private let accountProvider: UserAccountProviderProtocol
    
    private let label: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    required init(accountProvider: UserAccountProviderProtocol) {
        self.accountProvider = accountProvider
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        configureUI()
    }
}

fileprivate extension HomeViewController {
    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }
    
    func configureUI() {
        if let account = try? accountProvider.loadAccount() {
            label.text = "Welcome \(account.username)"
        } else {
            label.text = "Something went wrong"
        }
    }
}
