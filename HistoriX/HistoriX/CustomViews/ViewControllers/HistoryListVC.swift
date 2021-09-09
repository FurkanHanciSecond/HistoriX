//
//  HistoryListVC.swift
//  HistoriX
//
//  Created by Furkan Hanci on 9/5/21.
//

import UIKit

protocol HistoryListModelProtocol {
    var datas : [Welcome] { get set }
    func getDatas(content: @escaping () -> Void, errorContent: @escaping (HistoryError) -> Void)

}

class HistoryListVC: UIViewController , HistoryListModelProtocol {
    
  
    var datas: [Welcome] = []
    private let service : HistoryServiceDelegate = HistoryService()
    
    func getDatas(content: @escaping () -> Void, errorContent: @escaping (HistoryError) -> Void) {
        service.HistoryRequest(router: WelcomeRouter.getDatFromWelcome, decodingType: [Link.self]) { result in
            
        }
    }
    
//    private lazy var HistoryTableView : UITableView = {
//       let table = UITableView()
//        table.backgroundColor = UIColor.mainBackground
//        return table
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        title = "HistoriX"
//        configureUI()
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        AlertManager.showAlert(title: "Memory Warning", message: "Please restart the app", alertAction: nil , viewController: self)
//    }
//
//
//    private func configureUI() {
//        view.addSubview(HistoryTableView)
//        self.HistoryTableView.delegate = self
//        self.HistoryTableView.dataSource = self
//        self.HistoryTableView.rowHeight = 90
//        self.HistoryTableView.layer.cornerRadius = 15
//        self.HistoryTableView.register(HTableViewCell.self, forCellReuseIdentifier: Constants.Cell.cellId)
//        self.HistoryTableView.configConstraints(to: view)
//    }
//
//}
//
//
//extension HistoryListVC : UITableViewDelegate , UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let HCell = HistoryTableView.dequeueReusableCell(withIdentifier: Constants.Cell.cellId) as! HTableViewCell
//        return HCell
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 10
//    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        
    }
}
