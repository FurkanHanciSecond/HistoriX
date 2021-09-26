//
//  HistoryDetailViewController.swift
//  HistoriX
//
//  Created by Furkan Hanci on 9/25/21.
//

import UIKit

class HistoryDetailViewController: UIViewController {


    
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
        
    }
    
    private func configure() {
        
    }
    
 
 
}
