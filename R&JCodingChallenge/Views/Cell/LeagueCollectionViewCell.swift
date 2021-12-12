//
//  LeagueCollectionViewCell.swift
//  R&JCodingChallenge
//
//  Created by  Decagon on 10/12/2021.
//

import UIKit
import SVGKit
import Kingfisher

class LeagueCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "LeagueCollectionViewCell"
 
    private let imageView: UIImageView = {
       let imageView = UIImageView()
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
    
    
    func setUp(with model: DisplayLeagueViewModel) {
        let image = try? model.imageURL.asUrl
        imageView.kf.setImage(with: image)
    }
    
    
    public func configure(with viewModel: DisplayLeagueViewModel) {
        
        let urlString = viewModel.imageURL
        let url = URL(string: urlString)
        if urlString.contains("svg"){
            URLSession.shared.dataTask(with: url!) { data, _, error in
                guard let data = data, error == nil else { return}
                viewModel.imageData = data
                DispatchQueue.main.async {
                    guard let image: SVGKImage = SVGKImage(contentsOf: url) else {
                        return
                    }
                    self.imageView.image = image.uiImage
                    guard let img  = UIImage(data: data) else { return }
                    self.imageView.image = img
                }
            }.resume()
        } else {
            URLSession.shared.dataTask(with: url!) { data, _, error in
                guard let data = data, error == nil else { return}
                viewModel.imageData = data
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: data)
                }
            }.resume()
        }
    }

    
    
}
