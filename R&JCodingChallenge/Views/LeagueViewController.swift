//
//  LeagueViewController.swift
//  R&JCodingChallenge
//
//  Created by  Decagon on 09/12/2021.
//

import UIKit
import CoreData

class LeagueViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
//    var teamsName: LeagueViewModel?
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var items: [LeagueModel] = []
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
    
    var usedId = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGreen
        setupCollectionView()
        setConstraint()
        getAllItems()
        NetworkService.shared.getPl { [weak self] result in
            switch result {
                
            case .success(let data):
                for index in data.teams {
                    self?.createItem(with: index)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
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
//        collectionView.frame = CGRect(x: 10, y: view.frame.size.height-50, width: view.frame.size.width-10, height: 50)
    }
    
    func setConstraint() {
        view.addSubview(topBackArrowButton)
        view.addSubview(titleLabel)
        
        guard let collectionView = leagueCollectionView else {
            return
        }
        collectionView.anchorWithConstantsToTop(top: view.safeAreaLayoutGuide.topAnchor,
                                                left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 80, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
        
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
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items [indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LeagueCollectionViewCell.identifier, for: indexPath) as! LeagueCollectionViewCell
        cell.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.00)
        if ((item.imageUrl?.contains("svg")) != nil) {
            cell.configure(with: item.imageUrl ?? "")
        } else {
            cell.setUp(with: item.imageUrl ?? "")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == leagueCollectionView {
            print("Hello")
            let newVc = DetailsViewController()
            navigationController?.pushViewController(newVc, animated: true)
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
    
}
