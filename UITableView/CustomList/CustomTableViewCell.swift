//
//  TableViewCell.swift
//  UITableView
//
//  Created by Arthur Sh on 28.01.2024.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    // MARK: - Variables
    
    var person: Person? {
        didSet {
            portrait.image = person?.portrait
            country.image = person?.countryImage
            name.text = person?.name
            job.text = person?.proffesion.rawValue
        }
    }
    
    // MARK: - UI
    private lazy var portrait: UIImageView = {
        let iw = UIImageView()
        iw.translatesAutoresizingMaskIntoConstraints = false
        iw.contentMode = .scaleAspectFit
        iw.layer.cornerRadius = 30
        iw.layer.masksToBounds = true
        
        return iw
    }()
    
    private lazy var country: UIImageView = {
        let iw = UIImageView()
        iw.translatesAutoresizingMaskIntoConstraints = false
        iw.contentMode = .scaleAspectFit
        iw.layer.cornerRadius = 6
        iw.layer.masksToBounds = true
        
        return iw
    }()
    
    private lazy var imageContainer: UIView = {
        let uv = UIView()
        uv.translatesAutoresizingMaskIntoConstraints = false
        
        return uv
    }()
    
    private lazy var vStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 3
        stack.distribution = .equalSpacing
        stack.alignment = .leading
        
        return stack
    }()
    
    private lazy var name: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .bold)
        
        return label
    }()
    
    private lazy var job: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 10, weight: .light)
        
        return label
    }()
    
    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        imageContainer.addSubview(portrait)
        imageContainer.addSubview(country)
        vStack.addArrangedSubview(name)
        vStack.addArrangedSubview(job)
        addSubview(imageContainer)
        addSubview(vStack)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            imageContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            imageContainer.heightAnchor.constraint(equalToConstant: 60),
            imageContainer.widthAnchor.constraint(equalToConstant: 60),
            imageContainer.centerYAnchor.constraint(equalTo: centerYAnchor), // center by [y] up and down.
            
            portrait.leadingAnchor.constraint(equalTo: imageContainer.leadingAnchor),
            portrait.topAnchor.constraint(equalTo: imageContainer.topAnchor),
            portrait.trailingAnchor.constraint(equalTo: imageContainer.trailingAnchor),
            portrait.bottomAnchor.constraint(equalTo: imageContainer.bottomAnchor),
            
            country.trailingAnchor.constraint(equalTo: imageContainer.trailingAnchor, constant: -5),
            country.bottomAnchor.constraint(equalTo: imageContainer.bottomAnchor),
            country.widthAnchor.constraint(equalToConstant: 15),
            country.heightAnchor.constraint(equalToConstant: 15),
            
            vStack.leadingAnchor.constraint(equalTo: imageContainer.trailingAnchor, constant: 30),
            vStack.topAnchor.constraint(equalTo: imageContainer.topAnchor, constant: 10)
        ])
    }
    
}
