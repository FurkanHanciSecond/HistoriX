//
//  UITableView+Ext.swift
//  HistoriX
//
//  Created by Furkan Hanci on 9/8/21.
//

import UIKit

extension UITableView {
    func removeCells() {
        tableFooterView = UIView(frame: .zero)
    }
    
    func reloadDataMainThread() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}


