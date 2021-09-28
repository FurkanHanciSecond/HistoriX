//
//  HistoryDetailViewController.swift
//  HistoriX
//
//  Created by Furkan Hanci on 9/25/21.
//

import UIKit

class HistoryDetailViewController: UIViewController {
    private let detailLabel = HistoryLabel(fontSize: 17, fontWeight: .medium)
    public var viewModel : HistoryDetailViewModel {
        didSet {
            setup()
        }
    }
    
    init(mainModel : MainModel) {
        self.viewModel = HistoryDetailViewModel(mainModel: mainModel)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
        print(viewModel.datas)
    }
    
    private func getUserInfo() {
        viewModel.getData {
        print("Datas parsed")
       } errorContent: { error in
         AlertManager.showAlert(message: error.rawValue, viewController: self)
       }
     }
    
    private func setup() {

    }
 
 
 
}
