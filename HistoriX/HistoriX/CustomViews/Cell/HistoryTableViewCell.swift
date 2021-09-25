//
//  HistoryTableViewCell.swift
//  HistoriX
//
//  Created by Furkan Hanci on 9/19/21.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    private lazy var containerView: UIView = {
      let view = UIView()
        view.backgroundColor = Constants.Style.Color.lightGray
      view.addBorder()
      view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var arrowRightImageView: UIImageView = {
      let imageView = UIImageView()
      imageView.contentMode = .scaleAspectFill
        imageView.tintColor = Constants.Style.Color.label
      imageView.image = Constants.Style.Image.arrowRight
      imageView.translatesAutoresizingMaskIntoConstraints = false
      return imageView
    }()
    
    private lazy var historyNameLabel = HistoryLabel(fontSize: 17, fontWeight: .semibold)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: Constants.Cell.cellId)

        
      configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        configureContainer()

    }
    

    private func configureContainer() {
        containerView.layer.cornerRadius = containerView.frame.height / 5
        containerView.shadow()
      }

      private func configureCell() {
        selectionStyle = .none

        let horizontalPadding: CGFloat = 16
        let verticalPadding: CGFloat = 12
        let symbolHeight: CGFloat = 20

        addSubview(containerView)
        containerView.addSubviews(historyNameLabel, arrowRightImageView)

        NSLayoutConstraint.activate([
          containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horizontalPadding),
          containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horizontalPadding),
          containerView.topAnchor.constraint(equalTo: topAnchor, constant: verticalPadding),
          containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -verticalPadding),

            historyNameLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            historyNameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: horizontalPadding),

            arrowRightImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            arrowRightImageView.trailingAnchor.constraint(equalTo:  containerView.trailingAnchor, constant: -horizontalPadding),
            arrowRightImageView.widthAnchor.constraint(equalToConstant: symbolHeight),
            arrowRightImageView.heightAnchor.constraint(equalToConstant: symbolHeight),

            historyNameLabel.trailingAnchor.constraint(equalTo: arrowRightImageView.leadingAnchor, constant: -horizontalPadding)
        ])
      }

      public func set(data: MainModel) {
        historyNameLabel.text = data.year
      }

}
