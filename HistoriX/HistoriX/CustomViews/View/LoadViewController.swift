//
//  LoadViewController.swift
//  HistoriX
//
//  Created by Furkan Hanci on 9/25/21.
//

import UIKit

class LoadViewController: UIViewController {

    private var containerView : UIView!
    
    
    public func loadingView() {
        containerView = UIView(frame: view.bounds)
        view.addSubview(containerView)
        containerView.backgroundColor = Constants.Style.Color.background
         containerView.alpha = 0
        UIView.animate(withDuration: 0.5) {
           self.containerView.alpha = 0.8
         }
        
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        containerView.addSubview(activityIndicator)

        activityIndicator.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
          activityIndicator.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
          activityIndicator.centerXAnchor.constraint(equalTo: containerView.centerXAnchor)
        ])
        
        activityIndicator.startAnimating()
      
    }
    
    
    public  func noResultsInTableView(with message : String , with tableView: UITableView) {
        let label = HistoryLabel(fontSize: 16, fontWeight: .medium, textColor: .secondaryLabel)
        label.text = message
        tableView.addSubview(label)
        NSLayoutConstraint.activate([
           label.topAnchor.constraint(equalTo: tableView.topAnchor, constant: 16),
           label.centerXAnchor.constraint(equalTo: tableView.centerXAnchor)
         ])
        
        tableView.backgroundView = label


    }
    
    
    public func dismissLoading() {
         DispatchQueue.main.async {
             self.containerView.removeFromSuperview()
             self.containerView = nil
         }
     }
}
