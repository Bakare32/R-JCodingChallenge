//
//  LeagueCollectionViewCell.swift
//  R&JCodingChallenge
//
//  Created by  Decagon on 10/12/2021.
//

import UIKit

class LeagueCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "LeagueCollectionViewCell"
 
    private let imageView: UIImageView = {
       let imageView = UIImageView()
//        imageView.backgroundColor = .red
        imageView.image = UIImage(systemName: "house")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = CGRect(x: 5,
                               y: 0,
                               width: contentView.frame.size.width-10,
                                 height: contentView.frame.size.height)
    }
    
}
