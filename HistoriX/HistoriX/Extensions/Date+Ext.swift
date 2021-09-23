//
//  Date+Ext.swift
//  HistoriX
//
//  Created by Furkan Hanci on 9/23/21.
//

import UIKit

extension Date {
    func getComponent(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
         return calendar.dateComponents(Set(components), from: self)
     }
}
