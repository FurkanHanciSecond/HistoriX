//
//  UIViewController+Ext.swift
//  HistoriX
//
//  Created by Furkan Hanci on 9/15/21.
//

import SafariServices

extension UIViewController {
    func presentSafari(with url : URL) {
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredControlTintColor = Constants.Style.Color.green
        present(safariVC, animated: true, completion: nil)
    }
}
