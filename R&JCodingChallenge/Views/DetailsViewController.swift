//
//  DetailsViewController.swift
//  R&JCodingChallenge
//
//  Created by  Decagon on 10/12/2021.
//

import UIKit

class DetailsViewController: UIViewController {

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
      label.text = "Teams Name"
      label.numberOfLines = 2
      label.font = UIFont(name: "Helvetica", size: 20)
        label.textColor = .white
      label.textAlignment = .center
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    
    private let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "house")
        return imageView
    }()
    
    private let clubLabel: UILabel = {
      let label = UILabel()
      label.text = "Club Details"
      label.numberOfLines = 1
      label.font = UIFont(name: "Helvetica", size: 20)
        label.textColor = .systemGreen
//      label.textAlignment = .center
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    
    let productDetailsView: UIView = {
      let view = UIView()
      view.backgroundColor = .red
      view.layer.cornerRadius = 15
      view.isUserInteractionEnabled = true
      view.translatesAutoresizingMaskIntoConstraints = false
      return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        setUpConstraint()
    }
    
    
    func setUpConstraint() {
        view.addSubview(topBackArrowButton)
        view.addSubview(titleLabel)
        view.addSubview(imageView)
        view.addSubview(clubLabel)
        view.addSubview(productDetailsView)
        
        NSLayoutConstraint.activate([
            topBackArrowButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            topBackArrowButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            clubLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            clubLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 15),
            productDetailsView.topAnchor.constraint(equalTo: clubLabel.bottomAnchor, constant: 10),
            productDetailsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            productDetailsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            productDetailsView.heightAnchor.constraint(equalToConstant: 200),
            
        ])
    }

    @objc func didTapTopBackArrowButton() {
        navigationController?.popViewController(animated: true)
    }
}
