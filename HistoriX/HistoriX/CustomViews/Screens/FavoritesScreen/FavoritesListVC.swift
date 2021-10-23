//
//  FavoritesListVC.swift
//  HistoriX
//
//  Created by Furkan Hanci on 10/17/21.
//

import UIKit

class FavoritesListVC: UIViewController {

 
    public var viewModel = FavoritesListViewModel() {
        didSet {
         configure()
        }
    }
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
        self.title = viewModel.title
        self.view.backgroundColor = viewModel.viewBackground
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
    
    
    @objc private func refresh(_ sender : UIRefreshControl) {
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
        
        return cell
      }
}

extension FavoritesListVC : UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete") { action, view, handler in
            let eventRemove = self.events![indexPath.row]
            self.context.delete(eventRemove)
            
            do {
                 try self.context.save()
            } catch {
                AlertManager.showAlert(title: Constants.Text.Error.oops, message: HistoryError.coreDataDeleteErr.rawValue, alertAction: nil, viewController: self)
                
            }
            
            self.fetchEvents()
        }
        
        return UISwipeActionsConfiguration(actions: [action])
    }
}

