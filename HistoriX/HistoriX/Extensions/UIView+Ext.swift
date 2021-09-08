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
}
