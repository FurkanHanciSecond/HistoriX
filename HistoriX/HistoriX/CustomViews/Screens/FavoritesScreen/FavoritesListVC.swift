//
//  FavoritesListVC.swift
//  HistoriX
//
//  Created by Furkan Hanci on 10/17/21.
//

import UIKit

class FavoritesListVC: UIViewController {

    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    private var events : [Events]?
    private lazy var FavoritesTableView : UITableView = {
       let table = UITableView()
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.FavoritesTableView.register(FavoritesTableViewCell.self, forCellReuseIdentifier: Constants.Cell.favoritesCell)
        configure()
        refreshTableView()
      }

    private func configure() {
        self.view.addSubview(FavoritesTableView)
        self.FavoritesTableView.dataSource = self
        self.FavoritesTableView.delegate = self
        self.FavoritesTableView.rowHeight = 200
        self.FavoritesTableView.separatorStyle = .none
        self.FavoritesTableView.configConstraints(to: view)
        self.title = Constants.Text.Bar.favorites
        self.view.backgroundColor = Constants.Style.Color.systembackground
        self.FavoritesTableView.configConstraints(to: view)
        fetchEvents()
    }
    
    private func refreshTableView() {
        self.FavoritesTableView.refreshControl = UIRefreshControl()
        
        if let refreshControl = FavoritesTableView.refreshControl {
            refreshControl.tintColor = .gray
            refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)

        }
    }
    
    
    @objc private func refresh(_ sender : Any) {
        self.FavoritesTableView.refreshControl?.beginRefreshing()
        self.FavoritesTableView.refreshControl?.endRefreshing()
        self.FavoritesTableView.reloadData()
        self.fetchEvents()

    }
    
    
    private func fetchEvents() {
        do {
            self.events = try context.fetch(Events.fetchRequest())
            DispatchQueue.main.async {
                self.FavoritesTableView.reloadData()
            }
        } catch  {
            AlertManager.showAlert(message: HistoryError.coreDataErr.rawValue, viewController: self)
        }
    }
    
}

extension FavoritesListVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.events?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = FavoritesTableView.dequeueReusableCell(withIdentifier: Constants.Cell.favoritesCell , for: indexPath) as! FavoritesTableViewCell
        
        let event = self.events![indexPath.row]
        
        cell.set(data: event)
        
       // cell.textLabel?.text = event.event
        return cell
      }
}

extension FavoritesListVC : UITableViewDelegate {
    
}

