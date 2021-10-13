//
//  HistoryDetailViewController.swift
//  HistoriX
//
//  Created by Furkan Hanci on 9/25/21.
//

import UIKit

class HistoryDetailViewController: UIViewController {
    private let padding : CGFloat = 100
    public var viewModel : HistoryDetailViewModel {
        didSet {
            setUp()
        }
    }

    private lazy var detailView = HistoryDetailView()
    private lazy var wikiButton = HistoryButton()
    
    init(mainModel : MainModel) {
        self.viewModel = HistoryDetailViewModel(mainModel: mainModel)
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        detailView.setupTexts(with: viewModel.datas!)
        getDetailInfo()
    }
    
    
    private func getDetailInfo() {
        viewModel.getData {
           // print(self.viewModel.datas)
        } errorContent: { err in
            AlertManager.showAlert(message: err.rawValue, viewController: self)
        }

    }
    
    private func setUp() {
        view.backgroundColor = viewModel.viewBackground
        setUpDetailView()
    }
    
    
    private func setUpDetailView() {
        let viewHeight : CGFloat = 250
        detailView.shadow()
        view.addSubview(detailView)
        
        detailView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            detailView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            detailView.heightAnchor.constraint(equalToConstant: viewHeight),
            detailView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            detailView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
        ])
    }

}
