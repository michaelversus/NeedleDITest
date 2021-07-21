//
//  TutorialViewController.swift
//  NeddleDITest
//
//  Created by MIC KARAGIORGOS on 7/19/21.
//

import UIKit

protocol TutorialViewControllerProtocol: AnyObject {
    func configureLabel(text: String)
    func configureButton(title: String)
    func goToHome()
}

final class TutorialViewController: UIViewController {
    
    private let homeComponent: HomeComponentProtocol
    private let presenter: TutorialPresenterProtocol
    
    private let label: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .center
        return lbl
    }()
    
    private lazy var button: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitleColor(.black, for: .normal)
        btn.layer.borderWidth = 2
        btn.layer.borderColor = UIColor.black.cgColor
        btn.layer.cornerRadius = 2
        btn.layer.masksToBounds = true
        btn.addTarget(self, action: #selector(handleButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    @objc func handleButtonTapped() {
        presenter.buttonTapped()
    }
    
    init(
        homeComponent: HomeComponentProtocol,
        presenter: TutorialPresenterProtocol
    ) {
        self.homeComponent = homeComponent
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attach(self)
        presenter.initialLoad()
        setupUI()
    }
}

extension TutorialViewController: TutorialViewControllerProtocol {
    func configureLabel(text: String) {
        label.text = text
    }
    
    func configureButton(title: String) {
        button.setTitle(title, for: .normal)
    }
    
    func goToHome() {
        navigationController?.pushViewController(homeComponent.homeViewController, animated: true)
    }
}

fileprivate extension TutorialViewController {
    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(label)
        view.addSubview(button)
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }
}
