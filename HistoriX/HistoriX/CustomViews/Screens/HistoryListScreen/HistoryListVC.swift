//
//  HistoryListVC.swift
//  HistoriX
//
//  Created by Furkan Hanci on 9/5/21.
//

import UIKit

class HistoryListVC : LoadViewController {
    
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
        configureUI()
        refreshTableView()
        NotificationHelper.shared.requestForPermission()

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
        loadingView()
        viewModel.getDatas { [weak self] in
            self?.HistoryTableView.reloadData()
            self?.dismissLoading()
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
        self.HistoryTableView.removeCells()
        self.view.backgroundColor = viewModel.viewBackground
        self.title = viewModel.title
    }
    
    private func refreshTableView() {
        self.HistoryTableView.refreshControl = UIRefreshControl()
        
        if let refreshControl = HistoryTableView.refreshControl {
            refreshControl.tintColor = .gray
            refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)

        }
    }
    
    @objc private func refresh(_ sender : Any) {
        self.HistoryTableView.refreshControl?.beginRefreshing()
        viewModel.getDatas { [weak self] in
            self?.HistoryTableView.refreshControl?.endRefreshing()
            self?.HistoryTableView.reloadData()
        } errorContent: { [weak self] error in
            self?.HistoryTableView.refreshControl?.endRefreshing()
            AlertManager.showAlert(message: error.rawValue, viewController: self)
        }

    }

}

// MARK: - UITableViewDataSource

extension HistoryListVC :  UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = HistoryTableView.dequeueReusableCell(withIdentifier: Constants.Cell.cellId, for: indexPath) as! HistoryTableViewCell
        let events = viewModel.datas?[indexPath.row]
        
        cell.set(data: events!)

        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.datas?.count ?? 0
    }

}


extension HistoryListVC : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let datas = viewModel.datas?[indexPath.row]
        let historyDetailViewController = HistoryDetailViewController(mainModel: datas!)
        navigationController?.pushViewController(historyDetailViewController, animated: true)

    }
}
