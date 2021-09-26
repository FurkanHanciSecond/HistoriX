//
//  HistoryDetailLabel.swift
//  HistoriX
//
//  Created by Furkan Hanci on 9/26/21.
//

import UIKit

class HistoryDetailLabel: UILabel {

    override init(frame: CGRect) {
      super.init(frame: frame)

      configure()
    }
    
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }

    convenience init(fontSize: CGFloat, fontWeight: UIFont.Weight, textColor: UIColor = Constants.Style.Color.label) {
      self.init(frame: .zero)
      self.font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
      self.textColor = textColor
    }

    private func configure() {
      adjustsFontSizeToFitWidth = true
      minimumScaleFactor = 0.9
        lineBreakMode = .byWordWrapping
      translatesAutoresizingMaskIntoConstraints = false
    }

}
