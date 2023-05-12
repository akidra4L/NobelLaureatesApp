//
//  ViewController.swift
//  NobelLaureatesApp
//
//  Created by Alikhan Gubayev on 11.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private var laureatesData: [LaureateElement] = []
    
    private var tableView: UITableView = {
        var tableView = UITableView()
        tableView.separatorStyle = .none
        return tableView
    } ()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        [tableView].forEach { self.view.addSubview($0) }
        
        setConstraints()
        initalizeTableView()
        getAllLaureates()
    }
    
    private func setConstraints() {
        tableView.anchor(top: view.topAnchor, right: view.rightAnchor, bottom: view.bottomAnchor, left: view.leftAnchor, paddingRight: 16, paddingBottom: 100, paddingLeft: 16)
    }
    
    private func initalizeTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(LaureateCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func getAllLaureates() {
        APIManager.shared.getLaureates { [weak self] data in
            DispatchQueue.main.async {
                guard let self else { return }
                self.laureatesData = data
                self.tableView.reloadData()
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return laureatesData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                as? LaureateCell else { return UITableViewCell() }
        let laureate = laureatesData[indexPath.row]
        cell.configureView(laureate: laureate)
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
}
