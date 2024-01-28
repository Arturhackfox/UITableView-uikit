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
        table.dataSource = self
        table.translatesAutoresizingMaskIntoConstraints = false
        
        return table
    }()
    
    // MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setup
    
    private func setupHierarchy() {
        view.backgroundColor = .systemOrange
        view.addSubview(tableView)
        title = "List"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        

    }

}

