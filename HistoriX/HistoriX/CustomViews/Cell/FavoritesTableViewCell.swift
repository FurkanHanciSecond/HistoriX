//
//  FavoritesTableViewCell.swift
//  HistoriX
//
//  Created by Furkan Hanci on 10/18/21.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {

    private lazy var containerView: UIView = {
      let view = UIView()
        view.backgroundColor = Constants.Style.Color.black
      view.addBorder()
      view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var eventNameLabel = HistoryLabel(fontSize: 17, fontWeight: .semibold)
    private lazy var yearTextLabel = HistoryLabel(fontSize: 20, fontWeight: .medium)
    
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

        addSubview(containerView)
        containerView.addSubviews(eventNameLabel , yearTextLabel)

        NSLayoutConstraint.activate([
          containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horizontalPadding),
          containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horizontalPadding),
          containerView.topAnchor.constraint(equalTo: topAnchor, constant: verticalPadding),
          containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -verticalPadding),

            eventNameLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            eventNameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: horizontalPadding),
            eventNameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: horizontalPadding),
            yearTextLabel.bottomAnchor.constraint(equalTo: eventNameLabel.topAnchor, constant: verticalPadding),
            yearTextLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: verticalPadding),
            yearTextLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: horizontalPadding)
        ])
        
        eventNameLabel.numberOfLines = 0
      }

      public func set(data: Events?) {
        eventNameLabel.text = data?.event
        yearTextLabel.text = "In\(" ")\(data?.year ?? "NULL")"
      }

}
