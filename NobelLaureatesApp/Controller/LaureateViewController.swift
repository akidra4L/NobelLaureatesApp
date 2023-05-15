//
//  LaureateViewController.swift
//  NobelLaureatesApp
//
//  Created by Alikhan Gubayev on 15.05.2023.
//

import UIKit

class LaureateViewController: UIViewController {
    
    public var laureate: LaureateElement? {
        didSet {
            self.navigationItem.title = "Laureate"
            laureateLabel.text = laureate?.fullName.en
            categoryLabel.text = laureate?.nobelPrizes[0].category.en
        }
    }
    
    // MARK: - Properties
    private let laureateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .regular)
        return label
    } ()
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 12)
        return label
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        [laureateLabel, categoryLabel].forEach { self.view.addSubview($0) }
        
        setConstraints()
    }
    
    // MARK: - Methods
    private func setConstraints() {
        laureateLabel.anchor(top: self.view.topAnchor, left: self.view.leftAnchor, paddingTop: 128, paddingLeft: 16)
        categoryLabel.anchor(top: laureateLabel.bottomAnchor, left: self.view.leftAnchor, paddingTop: 4, paddingLeft: 16)
    }
}
