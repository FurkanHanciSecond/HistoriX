//
//  HistoryDetailViewController.swift
//  HistoriX
//
//  Created by Furkan Hanci on 9/25/21.
//

import UIKit

class HistoryDetailViewController: UIViewController {
    let label : UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
    let detailLabel : UILabel = UILabel(frame: CGRect(x: 10, y: 10, width: 200, height: 50))
    public var viewModel : HistoryDetailViewModel {
        didSet {
            configure()
        }
    }
    
    
    init(mainModel : MainModel) {
        self.viewModel = HistoryDetailViewModel(mainModel: mainModel)
        super.init(nibName: nil, bundle: nil)
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            label.font = UIFont.preferredFont(forTextStyle: .footnote)
        label.textColor = .white
            label.center = CGPoint(x: 160, y: 284)
            label.textAlignment = .center
        detailLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        detailLabel.textColor = .white
        detailLabel.center = CGPoint(x: 160, y: 320)
        detailLabel.textAlignment = .center

        view.addSubviews(label , detailLabel)
      configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(viewModel.datas)
    }
    
    private func setUpTexts(with mainModel : MainModel) {
        self.label.text = mainModel.year
        self.detailLabel.text = mainModel.text
    }
    
    private func configure() {
        setUpTexts(with: viewModel.datas!)

    }
    
 
}
