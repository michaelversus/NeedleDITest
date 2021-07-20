//
//  TutorialViewController.swift
//  NeddleDITest
//
//  Created by MIC KARAGIORGOS on 7/19/21.
//

import UIKit

final class TutorialViewController: UIViewController {
    
    private let loginComponent: LoginComponentProtocol
    
    init(loginComponent: LoginComponentProtocol) {
        self.loginComponent = loginComponent
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }
}
