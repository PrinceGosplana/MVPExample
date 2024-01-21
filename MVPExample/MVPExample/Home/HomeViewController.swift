//
//  HomeViewController.swift
//  MVPExample
//
//  Created by OLEKSANDR ISAIEV on 21.01.2024.
//

import UIKit

protocol HomeViewControllerType: AnyObject {
    func update(with viewModel: HomeViewModel)
}

protocol HomeViewControllerDelegate: AnyObject {
    func viewControllerDidLoad(_ viewController: HomeViewController)
}


final class HomeViewController: UIViewController {

    private var viewModel: HomeViewModel?
    var presenter: HomeViewControllerDelegate?

    private var label: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: UIScreen.main.bounds.height/2, width: UIScreen.main.bounds.width, height: 50))
        label.textAlignment = .center
        label.text = "No Storyboard!"
        return label
      }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addUIElements()
        presenter?.viewControllerDidLoad(self)
    }

    private func addUIElements() {
        view.backgroundColor = .systemBackground
        view.addSubview(label)
    }
}

extension HomeViewController: HomeViewControllerType {
    func update(with viewModel: HomeViewModel) {
        label.text = viewModel.home
    }
}
