//
//  ViewController.swift
//  rvc29_p3
//
//  Created by Rafael Chaves on 10/10/19.
//  Copyright © 2019 Rafael Chaves. All rights reserved.
//

import UIKit

protocol ChangeArenaNameDelegate: class {
    func changeRedSquareArenaName(to newString: String)
    func changeBlueCircleArenaName(to newString: String)
}

class ViewController: UIViewController {

    var redSquareArenaButton: UIButton!
    var blueCircleArenaButton: UIButton!
    var redSquareArenaText: String = "Red Square Arena"
    var blueCircleArenaText: String = "Blue Circle Arena"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Drawing Arenas"
        
        redSquareArenaButton = UIButton()
        redSquareArenaButton.translatesAutoresizingMaskIntoConstraints = false
        redSquareArenaButton.setTitle(redSquareArenaText, for: .normal)
        redSquareArenaButton.setTitleColor(.red, for: .normal)
        redSquareArenaButton.addTarget(self, action: #selector(showRedSquareArena), for: .touchUpInside)
        view.addSubview(redSquareArenaButton)
        
        blueCircleArenaButton = UIButton()
        blueCircleArenaButton.translatesAutoresizingMaskIntoConstraints = false
        blueCircleArenaButton.setTitle(blueCircleArenaText, for: .normal)
        blueCircleArenaButton.setTitleColor(.blue, for: .normal)
        blueCircleArenaButton.addTarget(self, action: #selector(showBlueCircleArena), for: .touchUpInside)
        view.addSubview(blueCircleArenaButton)
        
        setupConstraints()
    }
    func setupConstraints(){
        NSLayoutConstraint.activate([
            redSquareArenaButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            redSquareArenaButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        NSLayoutConstraint.activate([
            blueCircleArenaButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            blueCircleArenaButton.topAnchor.constraint(equalTo: redSquareArenaButton.bottomAnchor, constant: 20)
        ])
    }
    
    @objc func showRedSquareArena() {
        let viewController = RedSquareArenaController(arenaName: redSquareArenaButton.title(for: .normal)!)
        viewController.delegate = self
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func showBlueCircleArena() {
        let viewController = BlueCircleArenaController(arenaName: blueCircleArenaButton.title(for: .normal)!)
        viewController.delegate = self
        present(viewController, animated: true, completion: nil)
    }


}

extension ViewController: ChangeArenaNameDelegate {
    func changeRedSquareArenaName(to newString: String) {
        redSquareArenaButton.setTitle(newString, for: .normal)
    }
    func changeBlueCircleArenaName(to newString: String) {
        blueCircleArenaButton.setTitle(newString, for: .normal)
    }
}

