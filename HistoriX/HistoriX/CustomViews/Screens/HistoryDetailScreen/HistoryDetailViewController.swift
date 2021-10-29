//
//  HistoryDetailViewController.swift
//  HistoriX
//
//  Created by Furkan Hanci on 9/25/21.
//

import UIKit
import CoreData
class HistoryDetailViewController: UIViewController {
    private let padding : CGFloat = 100
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    private var events : [Events]?
    private let pulse = CASpringAnimation(keyPath: "transform.scale")
    
    public var viewModel : HistoryDetailViewModel {
        didSet {
            setUp()
        }
    }
    private lazy var detailView = HistoryDetailView()
    private lazy var favoritesButton = HistoryButton()
    
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
        setupFavoriteButton()
    }
    
    
    private func setUpDetailView() {
        let viewHeight : CGFloat = 270
        detailView.shadow()
        view.addSubview(detailView)
        
        detailView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            detailView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            detailView.heightAnchor.constraint(equalToConstant: viewHeight),
            detailView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            detailView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
        ])
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(shareEvent))
        gestureRecognizer.numberOfTapsRequired = 2
        view.addGestureRecognizer(gestureRecognizer)
        
    }
    
    @objc func shareEvent() {
        let appURl = NSURL(string:"https://github.com/Furkanus/HistoriX-1")
        let text = "Hey! I like \(viewModel.datas!.text + " ")this event today in history, check this out! "
        let textToShare = [text , appURl ?? ""] as [Any]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook ]
        
        self.present(activityViewController, animated: true, completion: nil)
        
    }
    
    
    private func setupFavoriteButton() {
        let buttonHeight: CGFloat = 50
        view.addSubview(favoritesButton)
        
        NSLayoutConstraint.activate([
            favoritesButton.topAnchor.constraint(equalTo: detailView.bottomAnchor, constant: padding),
            favoritesButton.heightAnchor.constraint(equalToConstant: buttonHeight),
            favoritesButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            favoritesButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
        ])
        
        favoritesButton.set(backgroundColor: viewModel.favoriteButtonBackground, title: viewModel.favoriteButtonTitle)
        favoritesButton.addTarget(self, action: #selector(addFavorites), for: .touchUpInside)
    }
    
    @objc private func addFavorites() {
        pulse.duration = 0.5
        pulse.fromValue = 1.0
        pulse.toValue = 1.12
        pulse.autoreverses = true
        pulse.repeatCount = .nan
        pulse.initialVelocity = 0.5
        pulse.damping = 1.3
        favoritesButton.layer.add(pulse , forKey: nil)
        let newEvent = Events(context: self.context)
        newEvent.event = viewModel.datas?.text
        newEvent.year = viewModel.datas?.year
        do {
            try self.context.save()
            AlertManager.showAlert(title: "Yay 🎉", message: "The Event Saved To Favorites", alertAction: nil, viewController: self)
        } catch  {
            AlertManager.showAlert(message: HistoryError.coreDataErr.rawValue, viewController: self)
        }
        
    }
    
    
}
