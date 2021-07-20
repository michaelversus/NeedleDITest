//
//  HomeViewController.swift
//  NeddleDITest
//
//  Created by MIC KARAGIORGOS on 7/19/21.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private let account: UserAccount
    
    init(account: UserAccount) {
        self.account = account
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
