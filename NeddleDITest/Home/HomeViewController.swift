//
//  HomeViewController.swift
//  NeddleDITest
//
//  Created by MIC KARAGIORGOS on 7/19/21.
//

import UIKit

protocol HomeViewControllerProtocol: AnyObject {
    func configureButton(title: String)
    func configureLabel(text: String)
    func popToRoot()
}

final class HomeViewController: UIViewController {
    
    private let presenter: HomePresenterProtocol
    
    private let label: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .center
        return lbl
    }()
    
    required init(presenter: HomePresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attach(self)
        setupUI()
        presenter.initialLoad()
    }
}

extension HomeViewController: HomeViewControllerProtocol {
    func configureButton(title: String) {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Logout",
            style: .plain,
            target: self,
            action: #selector(handleLogout)
        )
    }
    
    func configureLabel(text: String) {
        label.text = text
    }
    
    @objc func handleLogout() {
        presenter.logout()
    }
    
    func popToRoot() {
        navigationController?.popToRootViewController(animated: true)
    }
}

fileprivate extension HomeViewController {
    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(label)
        navigationItem.setHidesBackButton(true, animated: true)
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }
}
