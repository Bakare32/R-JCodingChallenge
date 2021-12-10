//
//  LeagueViewController.swift
//  R&JCodingChallenge
//
//  Created by  Decagon on 09/12/2021.
//

import UIKit

class LeagueViewController: UIViewController {
    
    
    
    var items: [Team] = []
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
        NetworkService.shared.getPl { [weak self] result in
            switch result {
                
            case .success(let data):
//                print("the data is \(data.teams)")
                self?.items = data.teams
//                let used = User()
                for index in data.teams {
//                    print("the index is \(index.crestURL)")
                    self?.usedId = index.crestURL
                    print("The used url is \(self?.usedId ?? "")")
                    let defaults = UserDefaults.standard
                    defaults.setValue(self?.usedId, forKey: "url")
                    self?.leagueCollectionView?.reloadData()
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
    
    
    

}
