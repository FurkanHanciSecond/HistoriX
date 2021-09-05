//
//  UIView+Ext.swift
//  HistoriX
//
//  Created by Furkan Hanci on 9/5/21.
//

import UIKit

extension UIView {
     func pinToView(to view : UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superview!.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superview!.bottomAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superview!.trailingAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superview!.leadingAnchor).isActive = true
    }
}
