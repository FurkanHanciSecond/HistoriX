//
//  UILabel+Ext.swift
//  HistoriX
//
//  Created by Furkan Hanci on 9/29/21.
//

import UIKit


extension UILabel {

    func computeHeight(text: String, width: CGFloat) -> CGFloat {
        // A dummy label in order to compute dynamic height.
        let label = UILabel()

        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.systemFont(ofSize: 17.0)

        label.preferredMaxLayoutWidth = width
        label.text = text
        label.invalidateIntrinsicContentSize()

        let height = label.intrinsicContentSize.height
        return height
    }

}
