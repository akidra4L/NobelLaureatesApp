//
//  ViewController.swift
//  NobelLaureatesApp
//
//  Created by Alikhan Gubayev on 11.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private var tableView: UITableView = {
        var tableView = UITableView()
        return tableView
    } ()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        
        [tableView].forEach { self.view.addSubview($0) }
        
        setConstraints()
    }
    
    private func setConstraints() {
        tableView.anchor(top: view.bottomAnchor, right: view.rightAnchor, bottom: view.bottomAnchor, left: view.leftAnchor, paddingRight: 16, paddingLeft: 16)
    }
    
    private func initalizeTableView() {
        tableView.dataSource = self
        tableView.register(UITableView.self, forCellReuseIdentifier: "cell")
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                as? LaureateCell else { return UITableViewCell() }
        return cell
    }
    
    
}
