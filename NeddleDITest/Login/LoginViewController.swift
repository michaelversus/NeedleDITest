//
//  LoginViewController.swift
//  NeddleDITest
//
//  Created by MIC KARAGIORGOS on 7/19/21.
//

import UIKit

final class LoginViewController: UIViewController {
    
    private let homeComponent: HomeComponentProtocol
    
    init(homeComponent: HomeComponentProtocol) {
        self.homeComponent = homeComponent
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
