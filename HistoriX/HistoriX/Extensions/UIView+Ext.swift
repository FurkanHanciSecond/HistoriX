//
//  UIView+Ext.swift
//  HistoriX
//
//  Created by Furkan Hanci on 9/5/21.
//

import UIKit

extension UIView {
     func configConstraints(to view : UIView) {
        translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview!.topAnchor),
            bottomAnchor.constraint(equalTo: superview!.bottomAnchor),
            trailingAnchor.constraint(equalTo: superview!.trailingAnchor),
            leadingAnchor.constraint(equalTo: superview!.leadingAnchor),
        
        ])
       
    }
    
    
    
    func addSubviews(_ views: UIView...) {
      for view in views {
        addSubview(view)
      }
    }
    
    func shadow() {
      layer.shadowColor = Constants.Style.Color.black.cgColor
      layer.shadowOffset = CGSize(width: 0, height: 3)
      layer.shadowOpacity = 0.1
        layer.shadowRadius = 2
    }

    func addBorder() {
      layer.borderWidth = 1
      layer.borderColor = Constants.Style.Color.lightGray.cgColor
    }
}
