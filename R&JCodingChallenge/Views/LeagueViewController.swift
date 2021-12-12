//
//  LeagueViewController.swift
//  R&JCodingChallenge
//
//  Created by  Decagon on 09/12/2021.
//

import UIKit
import CoreData

class LeagueViewController: UIViewController {
    
    
    
    var items: [LeagueModel] = []
    var returnCount: [Team] = []
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    private let topBackArrowButton: UIButton = {
      let button = UIButton()
      button.addTarget(self, action: #selector(didTapTopBackArrowButton), for: .touchUpInside)
      button.translatesAutoresizingMaskIntoConstraints = false
      button.setBackgroundImage(UIImage(systemName: "arrow.backward"), for: .normal)
        button.tintColor = .white
      return button
    }()
    
    private let titleLabel: UILabel = {
      let label = UILabel()
      label.text = "Premiership"
      label.numberOfLines = 2
      label.font = UIFont(name: "Helvetica", size: 20)
        label.textColor = .white
      label.textAlignment = .center
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    
    private var leagueCollectionView: UICollectionView?
    
    
    var returnArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGreen
        setupCollectionView()
        setConstraint()
        getAllItems()
        NetworkService.shared.getPl { [weak self] result in
            switch result {
                
            case .success(let data):
                
                self?.returnCount = data.teams
                for index in data.teams {
                    self?.createItem(with: index)
                    DispatchQueue.main.async {
                        self?.leagueCollectionView?.reloadData()
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
    
    func getAllItems() {
        do {
            items = try context.fetch(LeagueModel.fetchRequest())
                DispatchQueue.main.async {
                    self.leagueCollectionView?.reloadData()
                }
            
        }
        catch {
            
        }
       
    }
    
    func createItem(with Model: Team) {
        let newItem = LeagueModel(context: context)
        newItem.imageUrl = Model.crestURL
        
        do {
            try context.save()
            getAllItems()
        }
        catch {
            
        }
    }
    
    
    func setupCollectionView() {
       
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 15
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: (view.frame.size.width/3)-4,
                                 height: (view.frame.size.width/3)-4)
        leagueCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collectionView = leagueCollectionView else {
            return
        }
        collectionView.register(LeagueCollectionViewCell.self, forCellWithReuseIdentifier: LeagueCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
    }
    
    func setConstraint() {
        view.addSubview(topBackArrowButton)
        view.addSubview(titleLabel)
        
        guard let collectionView = leagueCollectionView else {
            return
        }
        collectionView.anchorWithConstantsToTop(top: view.safeAreaLayoutGuide.topAnchor,
                                                left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 60, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
        
        NSLayoutConstraint.activate([
            topBackArrowButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            topBackArrowButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
    }
    
    @objc func didTapTopBackArrowButton() {
        navigationController?.popViewController(animated: true)
    }
    
    
    
    

}
