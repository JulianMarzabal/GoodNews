//
//  infoViewController.swift
//  Good News
//
//  Created by Julian Marzabal on 10/10/2022.
//

import UIKit

class infoViewController: UIViewController {
    
    private let homeButton: UIButton = {
        let button = UIButton(type: .system)
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Go home"
        
        configuration.baseBackgroundColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = configuration
        button.addTarget(self, action: #selector(goHome), for: .touchUpInside)
        return button
    }()
    private let button : UIButton = {
        
        let button = UIButton(type: .system)
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Go back"
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(comeBack), for: .touchUpInside)
        
       return button
    }()
    public var titleNews: UILabel = {
        let label = UILabel()
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    public var label: UILabel = {
        let label = UILabel()
        label.text = "njvrnvjnrfjvnrvnrjvnrjvrjnjrv"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .monospacedDigitSystemFont(ofSize: 18, weight: .light)
        label.backgroundColor = .systemGray3
        label.contentMode = .scaleAspectFit
        label.textColor = .black
        
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        view.addSubview(label)
        view.addSubview(titleNews)
        view.addSubview(button)
        view.addSubview(homeButton)
        setContraints()
    

    }
    @objc func comeBack (){
        let newsVC = NewsViewController()
        present(newsVC, animated: true)
    }
    @objc func goHome() {
        let homeVC = HomeViewController()
        homeVC.modalPresentationStyle = .overFullScreen
        present(homeVC, animated: true)
    }
    
    
    private func setContraints(){
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: titleNews.bottomAnchor, constant: 150),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            
            titleNews.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            titleNews.leadingAnchor.constraint(equalTo: label.leadingAnchor),
            titleNews.rightAnchor.constraint(equalTo: label.rightAnchor),
            
            button.topAnchor.constraint(equalTo: label.bottomAnchor,constant: 50),
            button.leadingAnchor.constraint(equalTo: titleNews.leadingAnchor),
            button.rightAnchor.constraint(equalTo: titleNews.rightAnchor),
            
            homeButton.topAnchor.constraint(equalTo: button.bottomAnchor,constant: 30),
            homeButton.leadingAnchor.constraint(equalTo: button.leadingAnchor),
            homeButton.rightAnchor.constraint(equalTo: button.rightAnchor)
            
        
        
        ])
    }
    


}
