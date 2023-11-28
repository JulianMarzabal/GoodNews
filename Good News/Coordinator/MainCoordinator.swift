//
//  MainCoordinator.swift
//  Good News
//
//  Created by Julian Marzabal on 04/01/2023.
//

import Foundation
import UIKit
class MainCoordinator {
    var navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func onNewsView() {
        let viewModel = NewsViewModel()
        viewModel.delegate = self
        let newsVC = NewsViewController(viewmodel: viewModel)
        navigationController.pushViewController(newsVC, animated: true)
    }
    func onInfoView(news: News) {
        let infoVC = InfoViewController(viewModel: .init(news: news))
        navigationController.pushViewController(infoVC, animated: true)
    }
    func onNewsTabBar() {
        let tab = TabBarViewController()
        tab.neswVCDelegate = self
        navigationController.pushViewController(tab, animated: true)
    }
}
extension MainCoordinator: NewsViewDelegate {
    func showInfoNews(news: News) {
        onInfoView(news: news)
    }
}
