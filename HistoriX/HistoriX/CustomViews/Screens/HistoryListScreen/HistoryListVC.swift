//
//  HistoryListVC.swift
//  HistoriX
//
//  Created by Furkan Hanci on 9/5/21.
//

import UIKit

class HistoryListVC : UIViewController {
    
    public var viewModel = HistoryListViewModel() {
        didSet {
         configureUI()
        }
    }

    
    private lazy var HistoryTableView : UITableView = {
       let table = UITableView()
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "HistoriX"
        configureUI()
    }
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getDatas()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        AlertManager.showAlert(title: "Memory Warning", message: "Please restart the app", alertAction: nil , viewController: self)
    }

    
    
// MARK: - Configures
    
    private func getDatas() {
        viewModel.getDatas { [weak self] in
            self?.HistoryTableView.reloadData()
        } errorContent: { err in
            AlertManager.showAlert(message: err.rawValue, viewController: self)
        }

    }
    
    private func configureUI() {
        view.addSubview(HistoryTableView)
        self.HistoryTableView.dataSource = self
        self.HistoryTableView.delegate = self
        self.HistoryTableView.rowHeight = 90
        self.HistoryTableView.separatorStyle = .none
        self.view.backgroundColor = viewModel.viewBackground
        self.HistoryTableView.register(HistoryTableViewCell.self, forCellReuseIdentifier: Constants.Cell.cellId)
        self.HistoryTableView.configConstraints(to: view)
        self.view.backgroundColor = viewModel.viewBackground
        self.title = viewModel.title
    }

}

// MARK: - UITableViewDataSource

extension HistoryListVC :  UITableViewDataSource , UITableViewDelegate {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = HistoryTableView.dequeueReusableCell(withIdentifier: Constants.Cell.cellId, for: indexPath)
//        let historyDatas = viewModel.datas?[indexPath.row]
//        cell.textLabel?.attributedText = viewModel.title(for: historyDatas)
//        cell.textLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
//        cell.selectionStyle = .none
//        return cell
        
        let cell = HistoryTableView.dequeueReusableCell(withIdentifier: Constants.Cell.cellId, for: indexPath) as! HistoryTableViewCell
        let events = viewModel.datas?[indexPath.row]
        
        cell.set(data: events!)

        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.datas?.count ?? 0
    }

}
