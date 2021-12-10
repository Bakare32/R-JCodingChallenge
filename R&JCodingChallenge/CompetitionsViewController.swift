//
//  ViewController.swift
//  R&JCodingChallenge
//
//  Created by  Decagon on 09/12/2021.
//

import UIKit
import CoreData

class CompetitionsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    private var collectionView: UICollectionView?
    
    var listOfCompletition: [CompetitionModel] = []
    var list: LeagueViewModel?
    let pageTitleLabel: UILabel = {
      let label = UILabel()
      label.text = "Competitions"
      label.numberOfLines = 2
      label.font = UIFont(name: "Helvetica", size: 30)
        label.textColor = .white
      label.textAlignment = .center
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
//        navigationController?.navigationBar.backgroundColor = .systemGreen
//        title = "Competitions"
        
        navigationController?.navigationBar.isHidden = true
        setupCollectionView()
        setUpConstraint()
        getAllItems()
        
        NetworkService.shared.getAllCompetitions { [weak self] result in
            switch result {
                
            case .success(let data):
//                print("The data is \(data.competitions)")
//                self?.listOfCompletition = data.competitions
//                self?.collectionView?.reloadData()
                for index in data.competitions {
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
        layout.minimumLineSpacing = 25
        layout.minimumInteritemSpacing = 8
        layout.itemSize = CGSize(width: (view.frame.size.width/2)-4,
                                 height: (view.frame.size.width/2)-4)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collectionView = collectionView else {
            return
        }
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
//        collectionView.frame = CGRect(x: 10, y: view.frame.size.height-50, width: view.frame.size.width-10, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listOfCompletition.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = listOfCompletition[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
        cell.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.00)
        cell.configure(with: LeagueViewModel(with: item) )
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collectionView {
            print("Hello")
            let newVc = LeagueViewController()
            navigationController?.pushViewController(newVc, animated: true)
        }
    }
    
    func setUpConstraint() {
        view.addSubview(pageTitleLabel)
        guard let collectionView = collectionView else {
            return
        }
        collectionView.anchorWithConstantsToTop(top: view.safeAreaLayoutGuide.topAnchor,
                                                left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 80, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
        
        NSLayoutConstraint.activate([
            pageTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            pageTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
    
    func getAllItems() {
        do {
            listOfCompletition = try context.fetch(CompetitionModel.fetchRequest())
                DispatchQueue.main.async {
                    self.collectionView?.reloadData()
                }
            
        }
        catch {
            
        }
       
    }
    
    func createItem(with Model: Compete) {
        let newItem = CompetitionModel(context: context)
        newItem.name = Model.name
        newItem.country = Model.area.name
        newItem.date = Model.currentSeason?.startDate
        
        do {
            try context.save()
            getAllItems()
        }
        catch {
            
        }
    }
    

}


extension UIView {
    func anchorToTop(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil) {
        anchorWithConstantsToTop(top: top, left: left, bottom: bottom, right: right, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
    }
    func anchorWithConstantsToTop(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil,
                                  bottom: NSLayoutYAxisAnchor? = nil,
                                  right: NSLayoutXAxisAnchor? = nil,
                                  topConstant: CGFloat = 0,
                                  leftConstant: CGFloat = 0,
                                  bottomConstant: CGFloat = 0, rightConstant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: topConstant).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant).isActive = true
        }
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: leftConstant).isActive = true
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -rightConstant).isActive = true
        }
    }
}
