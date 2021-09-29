//
//  HistoryDetailView.swift
//  HistoriX
//
//  Created by Furkan Hanci on 9/29/21.
//

import UIKit

class HistoryDetailView: UIView {

    private lazy var yearLabel = HistoryLabel(fontSize: 24, fontWeight: .bold)
    private lazy var descriptionLabel = HistoryLabel(fontSize: 20, fontWeight: .medium)    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        setupUI()
        setDetail()
    }
    
    private func setDetail() {
        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 15
        addBorder()
    }
    
    public func setupTexts(with mainModel : MainModel) {
        yearLabel.text = "In\(" ")\(mainModel.year)"
        descriptionLabel.text = mainModel.text
    }
    
    private func setupUI() {
        let padding : CGFloat = 20
        
        addSubviews(yearLabel , descriptionLabel)

        NSLayoutConstraint.activate([
            yearLabel.topAnchor.constraint(equalTo: topAnchor , constant: padding),
            yearLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            yearLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: padding),
            
            descriptionLabel.topAnchor.constraint(equalTo: yearLabel.bottomAnchor , constant: padding),
            descriptionLabel.leadingAnchor.constraint(equalTo: yearLabel.leadingAnchor , constant: padding),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding)
            
        ])
    }

}
