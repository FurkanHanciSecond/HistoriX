//
//  HTableViewCell.swift
//  HistoriX
//
//  Created by Furkan Hanci on 9/5/21.
//

import UIKit

class HTableViewCell: UITableViewCell {
    
    private lazy var TestLabel : UILabel = {
       let label = UILabel()
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(TestLabel)
        configLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configLabel() {
        TestLabel.text = "Furkan"
        TestLabel.adjustsFontSizeToFitWidth = true
        TestLabel.translatesAutoresizingMaskIntoConstraints = false
        TestLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        TestLabel.leadingAnchor.constraint(equalTo: leadingAnchor , constant: 15).isActive = true
        TestLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        TestLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
    }
    

}
