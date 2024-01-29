//
//  DetailViewController.swift
//  UITableView
//
//  Created by Arthur Sh on 29.01.2024.
//

import UIKit

class DetailViewController: UIViewController {
    
    var person: Person? {
        didSet {
            personImage.image = person?.portrait
            nameLabel.text = person?.name
            jobDescription.text = (person?.proffesion.rawValue ?? " ") + " " + "from"
            countryImage.image = person?.countryImage
        }
    }
    
    // MARK: - Ui
    
    private lazy var personImage: UIImageView = {
        let iw = UIImageView()
        iw.translatesAutoresizingMaskIntoConstraints = false
        iw.contentMode = .scaleAspectFit
        iw.layer.cornerRadius = 150
        iw.layer.masksToBounds = true
        iw.layer.borderWidth = 2
        iw.layer.borderColor = UIColor.black.cgColor
        
        return iw
    }()
    
    private lazy var countryImage: UIImageView = {
        let iw = UIImageView()
        iw.translatesAutoresizingMaskIntoConstraints = false
        iw.contentMode = .scaleAspectFit
        iw.layer.cornerRadius = 6
        iw.layer.masksToBounds = true
        
        return iw
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 35, weight: .bold)
        
        return label
    }()
    
    private lazy var jobDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .regular)
        
        return label
    }()
    
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        view.addSubview(personImage)
        view.addSubview(nameLabel)
        view.addSubview(jobDescription)
        view.addSubview(countryImage)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            personImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            personImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            personImage.heightAnchor.constraint(equalToConstant: 300),
            personImage.widthAnchor.constraint(equalToConstant: 300),
            
            nameLabel.topAnchor.constraint(equalTo: personImage.bottomAnchor, constant: 10),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            jobDescription.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            jobDescription.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -10),
            
            countryImage.leadingAnchor.constraint(equalTo: jobDescription.trailingAnchor, constant: 5),
            countryImage.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 15),
            countryImage.heightAnchor.constraint(equalToConstant: 10),
            countryImage.widthAnchor.constraint(equalToConstant: 10),
            
        ])
    }
    
    
}
