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
//        imageView.backgroundColor = .red
        imageView.image = UIImage(systemName: "house")
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
//        setUp()
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
    
    
    func setUp(with model: String) {
        let image = try? model.asUrl
        imageView.kf.setImage(with: image)
    }
    
    func configure(with urlString: String){
      guard let url = URL(string: urlString) else {
        return
        
      }
      URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
        guard let data = data , error == nil else {
          return
        }
        DispatchQueue.main.async {
          print(data)
          
          guard let image: SVGKImage = SVGKImage(contentsOf: url) else {
            return
          }
          self?.imageView.image = image.uiImage
          guard let img  = UIImage(data: data) else { return }
          self?.imageView.image = img
          
        }
      }.resume()
    }
    
}
