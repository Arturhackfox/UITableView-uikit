//
//  ViewController.swift
//  UITableView
//
//  Created by Arthur Sh on 28.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var listNames = ["Arthur", "Nick", "Anthony", "Vlad", "Jacob", "Mike", "Edward", "Zeus", "Markeloff", "Senia"]
    
    var listImages = ["globe", "star", "pencil", "scribble.variable", "square.and.pencil.circle.fill", "pencil.tip.crop.circle.badge.minus", "globe.asia.australia.fill", "suit.spade", "star.circle.fill", "shield.fill"]
    
    // MARK: - UI
    
    private lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.dataSource = self // Назначает текущий объект (тот, в котором содержится этот код) в качестве источника данных для таблицы.
        table.translatesAutoresizingMaskIntoConstraints = false
        
        return table
    }()
    
    private lazy var textField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Type here.."
        tf.layer.cornerRadius = 17
        tf.layer.masksToBounds = true
        tf.backgroundColor = .systemGray6
        let padding: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 15))
        tf.leftView = padding
        tf.leftViewMode = .always
        tf.translatesAutoresizingMaskIntoConstraints = false
        
        return tf
    }()
    
    private lazy var addToListButton: UIButton = {
        var config = UIButton.Configuration.bordered()
        config.title = "Add to list"
        config.baseForegroundColor = .white
        config.baseBackgroundColor = .systemOrange
        config.cornerStyle = .capsule
        
        let button = UIButton(configuration: config)
        button.addTarget(self, action: #selector(addToListButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        view.addSubview(textField)
        view.addSubview(addToListButton)
        title = "List"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: addToListButton.bottomAnchor, constant: 10),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            textField.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 170),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            textField.heightAnchor.constraint(equalToConstant: 40),
            
            addToListButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 15),
            addToListButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            addToListButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            addToListButton.heightAnchor.constraint(equalToConstant: 40)
            
        ])
    }
    
    // MARK: - Actions
    
    @objc
    private func addToListButtonTapped() {
        guard textField.text != "" else {
            addAlert()
            return
        }
        
        listNames.append(textField.text!)
        tableView.reloadData()
        print("added new name to list array")
    }
    
    func addAlert() {
        let alert = UIAlertController(title: "Error!", message: "empty textfield!", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .cancel, handler: { _ in  })
        alert.addAction(alertAction)
        
        present(alert, animated: true)
    }
    
}

