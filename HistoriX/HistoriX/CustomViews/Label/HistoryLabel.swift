//
//  HistoryLabel.swift
//  HistoriX
//
//  Created by Furkan Hanci on 9/19/21.
//

import UIKit

class HistoryLabel: UILabel {

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
        translatesAutoresizingMaskIntoConstraints = false
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        numberOfLines = 0
        sizeToFit()
        lineBreakMode = .byWordWrapping
      }
    
}
