//
//  TabBarController.swift
//  Good News
//
//  Created by Julian Marzabal on 10/10/2023.
//


import UIKit

class TabBarViewController: UITabBarController{
    weak var neswVCDelegate: NewsViewDelegate?
   

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.tabBar.barTintColor = .systemGray3
        self.tabBar.unselectedItemTintColor = .systemGray
        let newsViewModel = NewsViewModel()
        newsViewModel.delegate = self
        let vc1 = NewsViewController(viewmodel: newsViewModel)
        let vm2 = FavouriteViewModel()
        let vc2 = FavouriteViewController(viewmodel: vm2)
        let vm3 = SearchResultViewModel()
        let vc3 = SearchResultsViewController(viewModel: vm3)
        
       
        vc1.navigationItem.largeTitleDisplayMode = .always
        vc2.navigationItem.largeTitleDisplayMode = .always
        vc3.navigationItem.largeTitleDisplayMode = .always
        
        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        let nav3 = UINavigationController(rootViewController: vc3)
        
        nav1.tabBarItem = UITabBarItem(title: "News", image: UIImage(systemName: "newspaper"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Favourites", image: UIImage(systemName: "star.fill"), tag: 1)
        nav3.tabBarItem = UITabBarItem(title: "Search", image:UIImage(systemName:"magnifyingglass"), tag: 1)
        
        nav1.navigationBar.prefersLargeTitles = true
        nav2.navigationBar.prefersLargeTitles = true
        nav3.navigationBar.prefersLargeTitles = true
        
        setViewControllers([nav1,nav2,nav3], animated: false)
      
        

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.setHidesBackButton(true, animated: true)
       
        
        
        
    }
    


}
    
extension TabBarViewController: NewsViewDelegate {
    func showInfoNews(news: News) {
        self.neswVCDelegate?.showInfoNews(news: news)
    }
    
    
}

