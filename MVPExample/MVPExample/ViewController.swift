//
//  ViewController.swift
//  MVPExample
//
//  Created by OLEKSANDR ISAIEV on 20.01.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func showNext(_ sender: Any) {
        createHomeViewController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    private func createHomeViewController() {
        let viewModel = HomeViewModel(home: "Hooray! You have a home! 🥂")
        let presenter = HomePresenter(viewModel: viewModel)
        let controller = HomeViewController()

        controller.presenter = presenter
        present(controller, animated: true)
    }


}

