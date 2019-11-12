//
//  RedSquareArenaController.swift
//  rvc29_p3
//
//  Created by Rafael Chaves on 10/10/19.
//  Copyright © 2019 Rafael Chaves. All rights reserved.
//

import UIKit

class RedSquareArenaController: UIViewController {
    
    var nameLabel: UILabel! = UILabel()
    var arenaNameTextField: UITextField! = UITextField()
    var arenaName: String
    weak var delegate: ChangeArenaNameDelegate?
    
    init(arenaName: String) {
        self.arenaName = arenaName
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Arena Name:"
        view.addSubview(nameLabel)
        
        arenaNameTextField.translatesAutoresizingMaskIntoConstraints = false
        arenaNameTextField.text = arenaName
        arenaNameTextField.borderStyle = .roundedRect
        view.addSubview(arenaNameTextField)
        
        let saveButton = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveAndExit))
        self.navigationItem.rightBarButtonItem  = saveButton
        
        setupConstraints()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let redSquare: UIView! = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        redSquare.backgroundColor = .red
        redSquare.center = touches.first!.location(in: view)
        view.addSubview(redSquare)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60),
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
        ])
        
        NSLayoutConstraint.activate([
            arenaNameTextField.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 20),
            arenaNameTextField.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
        ])
    }
    
    @objc func saveAndExit() {
        if let text = arenaNameTextField.text, text != "" {
            delegate?.changeRedSquareArenaName(to: text)
        }
        navigationController?.popViewController(animated: true)
    }
}
