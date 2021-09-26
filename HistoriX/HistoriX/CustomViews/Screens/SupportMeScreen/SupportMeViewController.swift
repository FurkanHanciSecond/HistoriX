//
//  SupportMeViewController.swift
//  HistoriX
//
//  Created by Furkan Hanci on 9/21/21.
//

import UIKit
import StoreKit
class SupportMeViewController: UIViewController {
    private lazy var supportButton = SupportButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButton()
    }
    
    
    private func configureButton() {
        let bottomPadding : CGFloat = 35
        let horizontalPadding : CGFloat = 36
        let height : CGFloat = 50
        view.addSubview(supportButton)
        
        NSLayoutConstraint.activate([
            supportButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: horizontalPadding),
            supportButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -horizontalPadding),
            supportButton.heightAnchor.constraint(equalToConstant: height),
            supportButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -bottomPadding)

        ])
        
        supportButton.set(backgroundColor: Constants.Style.Color.tabbBar, title: Constants.Text.Button.support)
        supportButton.addTarget(self, action: #selector(requestForReview), for: .touchUpInside)
        
    }
    
    @objc private func requestForReview() {
        guard let scene = view.window?.windowScene else {
            print("scene is not found")
            return
        }
        
        SKStoreReviewController.requestReview(in: scene)
    }

}
