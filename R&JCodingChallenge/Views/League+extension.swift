//
//  League+extension.swift
//  R&JCodingChallenge
//
//  Created by  Decagon on 10/12/2021.
//

import UIKit

extension LeagueViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return returnCount.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items[indexPath.row]
        let usedItem = returnCount[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LeagueCollectionViewCell.identifier, for: indexPath) as! LeagueCollectionViewCell
        cell.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.00)
        let detailViewcontroller = DetailsViewController()
        detailViewcontroller.toUseId = usedItem.id
        UserDefaults.standard.set(detailViewcontroller.toUseId, forKey: "query")
        if ((item.imageUrl?.contains("svg")) != nil) {
            cell.configure(with: DisplayLeagueViewModel(with: item))
        } else {
            cell.setUp(with: DisplayLeagueViewModel(with: item))
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Hello")
        let newVc = DetailsViewController()
        navigationController?.pushViewController(newVc, animated: true)
    }
}
