//
//  DetailsViewController.swift
//  R&JCodingChallenge
//
//  Created by  Decagon on 10/12/2021.
//

import UIKit
import Kingfisher
import SVGKit

class DetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    var data: [Squad] = []

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
//      label.textAlignment = .white
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    
    private let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.backgroundColor = .systemFill
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
        label.backgroundColor = .white
//      label.textAlignment = .center
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    
    let productDetailsView: UIView = {
      let view = UIView()
      view.backgroundColor = .white
      view.layer.cornerRadius = 15
      view.isUserInteractionEnabled = true
      view.translatesAutoresizingMaskIntoConstraints = false
      return view
    }()
    
    private let foundedLabel: UILabel = {
      let label = UILabel()
      label.text = "Founded:"
      label.numberOfLines = 1
      label.font = UIFont(name: "Helvetica", size: 20)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    
    private let foundedDateLabel: UILabel = {
      let label = UILabel()
      label.text = "01 May 1986"
      label.numberOfLines = 1
      label.font = UIFont(name: "Helvetica", size: 20)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    
    private let nicknameLabel: UILabel = {
      let label = UILabel()
      label.text = "NickName:"
      label.numberOfLines = 1
      label.font = UIFont(name: "Helvetica", size: 20)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    
    private let nickLabel: UILabel = {
      let label = UILabel()
      label.text = "Gunners"
      label.numberOfLines = 1
      label.font = UIFont(name: "Helvetica", size: 20)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    
    
    private let addressLabel: UILabel = {
      let label = UILabel()
      label.text = "Address"
      label.numberOfLines = 1
      label.font = UIFont(name: "Helvetica", size: 20)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    
    private let addressNameLabel: UILabel = {
      let label = UILabel()
      label.text = "No3, jakan street, agbowo"
      label.numberOfLines = 4
      label.font = UIFont(name: "Helvetica", size: 20)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    
    private let phoneLabel: UILabel = {
      let label = UILabel()
      label.text = "Phone Number:"
      label.numberOfLines = 1
      label.font = UIFont(name: "Helvetica", size: 20)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    
    private let phoneNumberLabel: UILabel = {
      let label = UILabel()
      label.text = "+44-289056389"
      label.numberOfLines = 1
      label.font = UIFont(name: "Helvetica", size: 20)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    
    private let websiteLabel: UILabel = {
      let label = UILabel()
      label.text = "Website:"
      label.numberOfLines = 1
      label.font = UIFont(name: "Helvetica", size: 20)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    
    private let websiteNameLabel: UILabel = {
      let label = UILabel()
      label.text = "https://arsenal.com"
      label.numberOfLines = 1
      label.font = UIFont(name: "Helvetica", size: 20)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    
    private let emailLabel: UILabel = {
      let label = UILabel()
      label.text = "Email Address:"
      label.numberOfLines = 1
      label.font = UIFont(name: "Helvetica", size: 20)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    
    private let emailAddressLabel: UILabel = {
      let label = UILabel()
      label.text = "info@borussia.com"
      label.numberOfLines = 1
      label.font = UIFont(name: "Helvetica", size: 20)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    
    private let teamPlayerLabel: UILabel = {
      let label = UILabel()
      label.text = "Team Player"
      label.numberOfLines = 1
      label.font = UIFont(name: "Helvetica", size: 20)
        label.textColor = .systemGreen
        label.backgroundColor = .white
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    var tableView = UITableView()
    func configureTableView() {
        view.addSubview(tableView)
        tableView.rowHeight = 100
        tableView.register(PlayerTableViewCell.self, forCellReuseIdentifier: PlayerTableViewCell.identifier)

        tableView.separatorStyle = .singleLine
        tableView.dataSource = self
        tableView.delegate = self
    }

    var toUseId = 0
    var used = ""
    var returnArray: [Any] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGreen
        configureTableView()
        setUpConstraint()
        NetworkService.shared.getTeam { [weak self] result in
            switch result {
                
            case .success(let data):
                print(data.squad)
                self?.data = data.squad
                self?.tableView.reloadData()
                UserDefaults.standard.set(data.crestURL, forKey: "used")
                UserDefaults.standard.set(data.website, forKey: "website")
                UserDefaults.standard.set(data.shortName, forKey: "title")
                UserDefaults.standard.set(data.email, forKey: "email")
                UserDefaults.standard.set(data.founded, forKey: "founded")
                UserDefaults.standard.set(data.phone, forKey: "phone")
                UserDefaults.standard.set(data.address, forKey: "address")
                UserDefaults.standard.set(data.name, forKey: "nick")
                DispatchQueue.main.async {
                    self?.titleLabel.text = data.shortName
                    self?.emailAddressLabel.text = data.email
                    self?.websiteNameLabel.text = data.website
                    self?.foundedDateLabel.text = "\(data.founded)"
                    self?.phoneNumberLabel.text = data.phone
                    self?.addressNameLabel.text = data.address
                    self?.nickLabel.text = data.name
//                    self?.used = data.crestURL
                }
            case .failure(let error):
                self?.userDefaul()
                self?.setUp()
                self?.configure()
                self?.tableView.reloadData()
                print("The error is: \(error.localizedDescription)")
                
            }
        }
        configure()
        setUp()
        userDefaul()
    }
    
    func userDefaul() {
            self.websiteNameLabel.text = UserDefaults.standard.string(forKey: "website")
            self.titleLabel.text = UserDefaults.standard.string(forKey: "title")
            self.emailAddressLabel.text = UserDefaults.standard.string(forKey: "email")
            self.foundedDateLabel.text = "\(UserDefaults.standard.integer(forKey: "founded"))"
            self.phoneNumberLabel.text = UserDefaults.standard.string(forKey: "phone")
            self.addressNameLabel.text = UserDefaults.standard.string(forKey: "address")
        self.nickLabel.text = UserDefaults.standard.string(forKey: "nick")
    }
    
    func setUp() {
        let image = try? UserDefaults.standard.string(forKey: "used")?.asUrl
        print(image)
        imageView.kf.setImage(with: image)
    }
    
    func configure(){
        let urlString = UserDefaults.standard.string(forKey: "used")
        print(urlString)
        guard let url = URL(string: urlString ?? "") else {
        return
      }
      URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
        guard let data = data , error == nil else {
          return
        }
          print(data)
        DispatchQueue.main.async {
            guard let image: SVGKImage = SVGKImage(contentsOf: url) else {
              return
            }
            self?.imageView.image = image.uiImage
            guard let img  = UIImage(data: data) else { return }
            self?.imageView.image = img
        }
      }.resume()
    }
    
    func setUpConstraint() {
        view.addSubview(topBackArrowButton)
        view.addSubview(titleLabel)
        view.addSubview(imageView)
        view.addSubview(clubLabel)
        view.addSubview(productDetailsView)
        view.addSubview(teamPlayerLabel)
        view.addSubview(tableView)
        productDetailsView.addSubview(foundedLabel)
        productDetailsView.addSubview(foundedDateLabel)
        productDetailsView.addSubview(nickLabel)
        productDetailsView.addSubview(nicknameLabel)
        productDetailsView.addSubview(addressLabel)
        productDetailsView.addSubview(addressNameLabel)
        productDetailsView.addSubview(phoneLabel)
        productDetailsView.addSubview(phoneNumberLabel)
        productDetailsView.addSubview(websiteLabel)
        productDetailsView.addSubview(websiteNameLabel)
        productDetailsView.addSubview(emailLabel)
        productDetailsView.addSubview(emailAddressLabel)
        
        tableView.anchorWithConstantsToTop(top: teamPlayerLabel.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 10, leftConstant: 5, bottomConstant: 0, rightConstant: 10)
        
        
        NSLayoutConstraint.activate([
            topBackArrowButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            topBackArrowButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            clubLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            clubLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 15),
            productDetailsView.topAnchor.constraint(equalTo: clubLabel.bottomAnchor, constant: 10),
            productDetailsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            productDetailsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            productDetailsView.heightAnchor.constraint(equalToConstant: 300),
            teamPlayerLabel.topAnchor.constraint(equalTo: productDetailsView.bottomAnchor, constant: 10),
            teamPlayerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            foundedLabel.topAnchor.constraint(equalTo: productDetailsView.topAnchor, constant: 20),
            foundedLabel.leadingAnchor.constraint(equalTo: productDetailsView.leadingAnchor, constant: 10),
            foundedDateLabel.topAnchor.constraint(equalTo: productDetailsView.topAnchor, constant: 20),
            foundedDateLabel.trailingAnchor.constraint(equalTo: productDetailsView.trailingAnchor, constant: -50),
            nicknameLabel.topAnchor.constraint(equalTo: foundedLabel.bottomAnchor, constant: 20),
            nicknameLabel.leadingAnchor.constraint(equalTo: productDetailsView.leadingAnchor, constant: 10),
            nickLabel.topAnchor.constraint(equalTo: foundedDateLabel.bottomAnchor, constant: 20),
            nickLabel.trailingAnchor.constraint(equalTo: productDetailsView.trailingAnchor, constant: -50),
            addressLabel.topAnchor.constraint(equalTo: nicknameLabel.bottomAnchor, constant: 20),
            addressLabel.leadingAnchor.constraint(equalTo: productDetailsView.leadingAnchor, constant: 10),
            addressNameLabel.topAnchor.constraint(equalTo: nickLabel.bottomAnchor, constant: 20),
            addressNameLabel.leadingAnchor.constraint(equalTo: productDetailsView.leadingAnchor, constant: 100),
            addressNameLabel.trailingAnchor.constraint(equalTo: productDetailsView.trailingAnchor, constant: -5),
            phoneLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 35),
            phoneLabel.leadingAnchor.constraint(equalTo: productDetailsView.leadingAnchor, constant: 10),
            phoneNumberLabel.topAnchor.constraint(equalTo: addressNameLabel.bottomAnchor, constant: 12),
            phoneNumberLabel.trailingAnchor.constraint(equalTo: productDetailsView.trailingAnchor, constant: -20),
            websiteLabel.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 25),
            websiteLabel.leadingAnchor.constraint(equalTo: productDetailsView.leadingAnchor, constant: 10),
            websiteNameLabel.topAnchor.constraint(equalTo: phoneNumberLabel.bottomAnchor, constant: 25),
            websiteNameLabel.trailingAnchor.constraint(equalTo: productDetailsView.trailingAnchor, constant: -20),
            emailLabel.topAnchor.constraint(equalTo: websiteLabel.bottomAnchor, constant: 25),
            emailLabel.leadingAnchor.constraint(equalTo: productDetailsView.leadingAnchor, constant: 10),
            emailAddressLabel.topAnchor.constraint(equalTo: websiteNameLabel.bottomAnchor, constant: 25),
            emailAddressLabel.trailingAnchor.constraint(equalTo: productDetailsView.trailingAnchor, constant: -20),
            
        ])
    }

    @objc func didTapTopBackArrowButton() {
        navigationController?.popViewController(animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = data[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PlayerTableViewCell.identifier, for: indexPath) as? PlayerTableViewCell else { return UITableViewCell() }
        cell.layer.borderColor = UIColor.gray.cgColor
                
        cell.layer.borderWidth = 1
                cell.layer.cornerRadius = 8
                cell.clipsToBounds = true
        cell.titleLabel.text = model.name
//        cell.titleLabel.text = model.name
        cell.messageLabel.text = model.position
////        cell.firstImage.image = UIImage(named: model.firstImageName)
        cell.countryLabel.text = model.nationality
        cell.dateOfbirthLabel.text = "\(String(describing: model.dateOfBirth))"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}
