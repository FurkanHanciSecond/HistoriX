//
//  HistoryListVC.swift
//  HistoriX
//
//  Created by Furkan Hanci on 9/5/21.
//

import UIKit


    
class HistoryListVC : UIViewController {
    
    public var viewModel : HistoryListViewModel {
        didSet {
         configureUI()
        }
    }
    
    private func getDatas() {
        viewModel.getDatas { [weak self] in
            self?.HistoryTableView.reloadDataMainThread()
        } errorContent: { err in
            AlertManager.showAlert(message: err.rawValue, viewController: self)
        }

    }
    
    private lazy var HistoryTableView : UITableView = {
       let table = UITableView()
        table.backgroundColor = UIColor.mainBackground
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "HistoriX"
        configureUI()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        AlertManager.showAlert(title: "Memory Warning", message: "Please restart the app", alertAction: nil , viewController: self)
    }


    private func configureUI() {
        view.addSubview(HistoryTableView)
        self.HistoryTableView.delegate = self
        self.HistoryTableView.dataSource = self
        self.HistoryTableView.rowHeight = 90
       self.HistoryTableView.layer.cornerRadius = 15
        self.view.backgroundColor = viewModel.viewBackground
        self.HistoryTableView.register(HTableViewCell.self, forCellReuseIdentifier: Constants.Cell.cellId)
        self.HistoryTableView.configConstraints(to: view)
    }

}


extension HistoryListVC : UITableViewDelegate , UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let HCell = HistoryTableView.dequeueReusableCell(withIdentifier: Constants.Cell.cellId) as! HTableViewCell
        return HCell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

}
