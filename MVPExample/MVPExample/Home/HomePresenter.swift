//
//  HomePresenter.swift
//  MVPExample
//
//  Created by OLEKSANDR ISAIEV on 21.01.2024.
//

import UIKit

enum HomeError: Error {
    case homeless
}

protocol HomePresenterType {
    func setupViewModel(with viewModel: HomeViewModel)
}

final class HomePresenter: HomePresenterType {

    
    private(set) var viewModel: HomeViewModel?

    weak var view: HomeViewControllerType?

    init(viewModel: HomeViewModel? = nil) {
        self.viewModel = viewModel
    }
    
    private func loadScreen(on viewController: HomeViewControllerType) {
        do {
            let homeViewModel = try self.homeViewModel()
            viewController.update(with: homeViewModel)
        } catch let error as HomeError {
            switch error {
            case .homeless:
                viewController.update(with:HomeViewModel(home: "You are homeless 😨"))
            }
        } catch {
            viewController.update(with:HomeViewModel(home: "Unknown error"))
        }
    }

    private func homeViewModel() throws -> HomeViewModel {
        guard let viewModel else { throw HomeError.homeless }
        return viewModel
    }
    
    func setupViewModel(with viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
}

extension HomePresenter: HomeViewControllerDelegate {
    func viewControllerDidLoad(_ viewController: HomeViewController) {
        loadScreen(on: viewController)
    }
}
