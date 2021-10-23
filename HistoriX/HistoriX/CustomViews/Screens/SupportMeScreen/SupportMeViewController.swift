//
//  SupportMeViewController.swift
//  HistoriX
//
//  Created by Furkan Hanci on 9/21/21.
//

import UIKit
import StoreKit
import MessageUI
class SupportMeViewController: UIViewController {
    private lazy var supportButton = SupportButton()
    private lazy var sendMailButton = SupportButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        configureButtons()
        self.title = Constants.Text.Bar.support
        self.view.backgroundColor = Constants.Style.Color.systembackground
    }
    
    
    private func configureButtons() {
        let bottomPadding : CGFloat = 35
        let horizontalPadding : CGFloat = 36
        let height : CGFloat = 50
        view.addSubviews(supportButton , sendMailButton)
        
        NSLayoutConstraint.activate([
            supportButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: horizontalPadding),
            supportButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -horizontalPadding),
            supportButton.heightAnchor.constraint(equalToConstant: height),
            supportButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -bottomPadding),
            
            sendMailButton.bottomAnchor.constraint(equalTo: supportButton.topAnchor, constant: -bottomPadding),
            sendMailButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: horizontalPadding),
            sendMailButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -horizontalPadding),
            sendMailButton.heightAnchor.constraint(equalToConstant: height),

        ])
        
        supportButton.set(backgroundColor: Constants.Style.Color.tabbBar, title: Constants.Text.Button.support)
        supportButton.addTarget(self, action: #selector(showMailComposer), for: .touchUpInside)
        
        sendMailButton.set(backgroundColor: Constants.Style.Color.lightGray, title: Constants.Text.Button.sendMail)
        sendMailButton.addTarget(self, action: #selector(requestForReview), for: .touchUpInside)
    }
    
    @objc private func requestForReview() {
        guard let scene = view.window?.windowScene else {
            print("scene is not found")
            return
        }
        
        SKStoreReviewController.requestReview(in: scene)
    }
    
    @objc private func showMailComposer() {
        guard MFMailComposeViewController.canSendMail() else {
            return
        }
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        composer.setToRecipients(["furkanhanci265@gmail.com"])
        composer.setSubject("Hey there!")
        composer.setMessageBody("I love your app keep going!", isHTML: false)
        present(composer, animated: true)


}
    
}


extension SupportMeViewController : MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        if let _ = error {
            controller.dismiss(animated: true, completion: nil)
            return
        }
        switch result {
        case .cancelled:
            break
        case .failed:
            break
        case .saved:
            break
        case .sent:
            break
        }
        controller.dismiss(animated: true, completion: nil)
    }
}
