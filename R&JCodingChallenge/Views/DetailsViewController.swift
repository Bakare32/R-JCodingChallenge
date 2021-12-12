//
//  DetailsViewController.swift
//  R&JCodingChallenge
//
//  Created by  Decagon on 10/12/2021.
//

import UIKit

class DetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    let data: [ContactData] = {
        let firstContact = ContactData(firstImageName: "phone", title: "Phone", message: "+01 234567890",country: "Country" , dateOfBirth: "Date of Birth")
        let secondContact = ContactData(firstImageName: "email", title: "Email", message: "support@relax.io",country: "Country" , dateOfBirth: "Date of Birth" )
        let thirdContact = ContactData(firstImageName: "message", title: "App Chat", message: "Average waiting time: 5min",country: "Country" , dateOfBirth: "Date of Birth" )
        return [firstContact, secondContact, thirdContact]
    }()

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
        label.textColor = .systemGreen
//      label.textAlignment = .center
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    
    private let foundedDateLabel: UILabel = {
      let label = UILabel()
      label.text = "01 May 1986"
      label.numberOfLines = 1
      label.font = UIFont(name: "Helvetica", size: 20)
        label.textColor = .systemGreen
//      label.textAlignment = .center
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    
    private let nicknameLabel: UILabel = {
      let label = UILabel()
      label.text = "NickName:"
      label.numberOfLines = 1
      label.font = UIFont(name: "Helvetica", size: 20)
        label.textColor = .systemGreen
//      label.textAlignment = .center
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    
    private let nickLabel: UILabel = {
      let label = UILabel()
      label.text = "Gunners"
      label.numberOfLines = 1
      label.font = UIFont(name: "Helvetica", size: 20)
        label.textColor = .systemGreen
//      label.textAlignment = .center
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    
    
    private let addressLabel: UILabel = {
      let label = UILabel()
      label.text = "Address"
      label.numberOfLines = 1
      label.font = UIFont(name: "Helvetica", size: 20)
        label.textColor = .systemGreen
//      label.textAlignment = .center
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    
    private let addressNameLabel: UILabel = {
      let label = UILabel()
      label.text = "No3, jakan street, agbowo"
      label.numberOfLines = 4
      label.font = UIFont(name: "Helvetica", size: 20)
        label.textColor = .systemCyan
//      label.textAlignment = .center
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    
    private let phoneLabel: UILabel = {
      let label = UILabel()
      label.text = "Phone Number:"
      label.numberOfLines = 1
      label.font = UIFont(name: "Helvetica", size: 20)
        label.textColor = .systemGreen
//      label.textAlignment = .center
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    
    private let phoneNumberLabel: UILabel = {
      let label = UILabel()
      label.text = "+44-289056389"
      label.numberOfLines = 1
      label.font = UIFont(name: "Helvetica", size: 20)
        label.textColor = .systemGreen
//      label.textAlignment = .center
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    
    private let websiteLabel: UILabel = {
      let label = UILabel()
      label.text = "Website:"
      label.numberOfLines = 1
      label.font = UIFont(name: "Helvetica", size: 20)
        label.textColor = .systemGreen
//      label.textAlignment = .center
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    
    private let websiteNameLabel: UILabel = {
      let label = UILabel()
      label.text = "https://arsenal.com"
      label.numberOfLines = 1
      label.font = UIFont(name: "Helvetica", size: 20)
        label.textColor = .systemGreen
//      label.textAlignment = .center
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    
    private let emailLabel: UILabel = {
      let label = UILabel()
      label.text = "Email Address:"
      label.numberOfLines = 1
      label.font = UIFont(name: "Helvetica", size: 20)
        label.textColor = .systemGreen
//      label.textAlignment = .center
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    
    private let emailAddressLabel: UILabel = {
      let label = UILabel()
      label.text = "info@borussia.com"
      label.numberOfLines = 1
      label.font = UIFont(name: "Helvetica", size: 20)
        label.textColor = .systemGreen
//      label.textAlignment = .center
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
//      label.textAlignment = .center
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
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGreen
        configureTableView()
        setUpConstraint()
        NetworkService.shared.getTeam { [weak self] result in
            switch result {
                
            case .success(let data):
                print(data.name)
                print(data.founded)
                print(data.shortName)
                print(data.website)
                print(data.email)
                print(data.address)
                print(data.phone)
                DispatchQueue.main.async {
                    self?.titleLabel.text = data.shortName
                    self?.emailAddressLabel.text = data.email
                    self?.websiteNameLabel.text = data.website
                    self?.foundedDateLabel.text = "\(data.founded)"
                    self?.phoneNumberLabel.text = data.phone
                    self?.addressNameLabel.text = data.address
                    self?.nicknameLabel.text = data.name
                }
            case .failure(let error):
                print("The error is: \(error.localizedDescription)")
            }
        }
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
          let image = UIImage(data: data)
            self?.imageView.image = image!
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
            foundedDateLabel.trailingAnchor.constraint(equalTo: productDetailsView.trailingAnchor, constant: -30),
            nicknameLabel.topAnchor.constraint(equalTo: foundedLabel.bottomAnchor, constant: 20),
            nicknameLabel.leadingAnchor.constraint(equalTo: productDetailsView.leadingAnchor, constant: 10),
            nickLabel.topAnchor.constraint(equalTo: foundedDateLabel.bottomAnchor, constant: 20),
            nickLabel.trailingAnchor.constraint(equalTo: productDetailsView.trailingAnchor, constant: -50),
            addressLabel.topAnchor.constraint(equalTo: nicknameLabel.bottomAnchor, constant: 20),
            addressLabel.leadingAnchor.constraint(equalTo: productDetailsView.leadingAnchor, constant: 10),
            addressNameLabel.topAnchor.constraint(equalTo: nickLabel.bottomAnchor, constant: 20),
            addressNameLabel.leadingAnchor.constraint(equalTo: productDetailsView.leadingAnchor, constant: 40),
//            addressNameLabel.trailingAnchor.constraint(equalTo: productDetailsView.trailingAnchor, constant: 0),
            phoneLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 20),
            phoneLabel.leadingAnchor.constraint(equalTo: productDetailsView.leadingAnchor, constant: 10),
            phoneNumberLabel.topAnchor.constraint(equalTo: addressNameLabel.bottomAnchor, constant: 20),
            phoneNumberLabel.trailingAnchor.constraint(equalTo: productDetailsView.trailingAnchor, constant: -20),
            websiteLabel.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 20),
            websiteLabel.leadingAnchor.constraint(equalTo: productDetailsView.leadingAnchor, constant: 10),
            websiteNameLabel.topAnchor.constraint(equalTo: phoneNumberLabel.bottomAnchor, constant: 20),
            websiteNameLabel.trailingAnchor.constraint(equalTo: productDetailsView.trailingAnchor, constant: -20),
            emailLabel.topAnchor.constraint(equalTo: websiteLabel.bottomAnchor, constant: 20),
            emailLabel.leadingAnchor.constraint(equalTo: productDetailsView.leadingAnchor, constant: 10),
            emailAddressLabel.topAnchor.constraint(equalTo: websiteNameLabel.bottomAnchor, constant: 20),
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
        cell.titleLabel.text = model.title
        cell.messageLabel.text = model.message
        cell.firstImage.image = UIImage(named: model.firstImageName)
        cell.countryLabel.text = model.country
        cell.dateOfbirthLabel.text = model.dateOfBirth
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}
