//
//  CustomCollectionViewCell.swift
//  R&JCodingChallenge
//
//  Created by  Decagon on 09/12/2021.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CustomCollectionViewCell"
    
    func configure(with model: LeagueViewModel) {
        myLabel1.text = model.league
        myLabel2.text = model.country
        myLabel4.text = model.date
    }
    
    private let myLabel1: UILabel = {
        let label = UILabel()
        label.text = "Premier League"
        label.font = UIFont(name: "Helvetica-bold", size: 15)
        label.textAlignment = .center
        return label
    }()
    
    private let myLabel2: UILabel = {
        let label = UILabel()
        label.text = "Country"
        label.font = UIFont(name: "Helvetica-regular", size: 15)
        label.textAlignment = .center
        return label
    }()
    
    private let myLabel3: UILabel = {
        let label = UILabel()
        label.text = "Start Date:"
        return label
    }()
    
    private let myLabel4: UILabel = {
        let label = UILabel()
        label.text = "02-10-2020"
        label.font = UIFont(name: "Helvetica-thin", size: 15)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(myLabel1)
        contentView.addSubview(myLabel2)
        contentView.addSubview(myLabel3)
        contentView.addSubview(myLabel4)
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        myLabel1.frame = CGRect(x: 5,
                               y: contentView.frame.size.height-158,
                               width: contentView.frame.size.width,
                               height: 20)
        
        myLabel2.frame = CGRect(x: 5,
                               y: contentView.frame.size.height-100,
                               width: contentView.frame.size.width-10,
                                   height: 20)
        myLabel3.frame = CGRect(x: 2,
                                y: contentView.frame.size.height-40,
                                width: contentView.frame.size.width-100,
                                height: 20)
        myLabel4.frame = CGRect(x:contentView.frame.size.width-95 ,
                                y: contentView.frame.size.height-40,
                                width: contentView.frame.size.width-80,
                                height: 20)
    }
}
