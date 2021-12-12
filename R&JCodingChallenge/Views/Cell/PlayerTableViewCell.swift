//
//  PlayerTableViewCell.swift
//  R&JCodingChallenge
//
//  Created by  Decagon on 11/12/2021.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {
   
    static let identifier = "PlayerTableViewCell"

    var titleLabel: UILabel = {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    var messageLabel: UILabel = {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        return messageLabel
    }()
    var firstImage: UIImageView = {
        let firstImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        firstImage.contentMode = .scaleAspectFit
        firstImage.translatesAutoresizingMaskIntoConstraints = false
        return firstImage
    }()
    var countryLabel: UILabel = {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        titleLabel.textColor = .systemGreen
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    var dateOfbirthLabel: UILabel = {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        return messageLabel
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(titleLabel)
        addSubview(messageLabel)
        addSubview(firstImage)
        addSubview(countryLabel)
        addSubview(dateOfbirthLabel)
        setConstriant()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setConstriant() {
        NSLayoutConstraint.activate([
            firstImage.topAnchor.constraint(equalTo: topAnchor),
            firstImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            firstImage.heightAnchor.constraint(equalToConstant: 55),
            titleLabel.leadingAnchor.constraint(equalTo: firstImage.trailingAnchor, constant: 30),
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            messageLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            countryLabel.topAnchor.constraint(equalTo: topAnchor),
            countryLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            dateOfbirthLabel.topAnchor.constraint(equalTo: countryLabel.bottomAnchor, constant: 10),
            dateOfbirthLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        ])
    }
}
