//
//  BlueCircleArenaController.swift
//  rvc29_p3
//
//  Created by Rafael Chaves on 10/10/19.
//  Copyright © 2019 Rafael Chaves. All rights reserved.
//

import UIKit

class BlueCircleArenaController: UIViewController {
    
    var backButton: UIButton! = UIButton()
    var saveButton: UIButton! = UIButton()
    var nameLabel: UILabel! = UILabel()
    var arenaNameTextField: UITextField!
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
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(.blue, for: .normal)
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        view.addSubview(backButton)
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.blue, for: .normal)
        saveButton.addTarget(self, action: #selector(saveAndExit), for: .touchUpInside)
        view.addSubview(saveButton)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Arena Name:"
        view.addSubview(nameLabel)
        
        arenaNameTextField = UITextField()
        arenaNameTextField.translatesAutoresizingMaskIntoConstraints = false
        arenaNameTextField.text = arenaName
        arenaNameTextField.borderStyle = .roundedRect
        
        view.addSubview(arenaNameTextField)
        
        
        setupConstraints()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let blueCircle: UIView! = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        blueCircle.layer.cornerRadius = 25
        blueCircle.backgroundColor = .blue
        blueCircle.center = touches.first!.location(in: view)
        view.addSubview(blueCircle)
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            backButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15)
        ])
        
        NSLayoutConstraint.activate([
            saveButton.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            saveButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60),
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
        ])
        
        NSLayoutConstraint.activate([
            arenaNameTextField.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 20),
            arenaNameTextField.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
        ])
    }
    
    @objc func goBack() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func saveAndExit() {
        if let text = arenaNameTextField.text, text != "" {
            delegate?.changeBlueCircleArenaName(to: text)
        }
        dismiss(animated: true, completion: nil)
    }
}
