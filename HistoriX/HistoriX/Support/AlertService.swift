//
//  AlertService.swift
//  HistoriX
//
//  Created by Furkan Hanci on 9/5/21.
//

import UIKit

class AlertManager {

  static func showAlert(
    title: String = Constants.Text.Error.oops,
    message: String,
    alertAction: (() -> Void)? = nil,
    viewController: UIViewController?)
   {
    DispatchQueue.main.async {
      let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
      let action = UIAlertAction(title: Constants.Text.Error.ok, style: .default) { action in
        alertAction?()
      }
      alertController.addAction(action)
      viewController?.present(alertController, animated: true, completion: nil)
    }
  }
}
