//
//  HomeViewController.swift
//  Good News
//
//  Created by Julian Marzabal on 09/10/2022.
//

import UIKit

class HomeViewController: UIViewController {
    private let image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "News")
        image.contentMode = .scaleAspectFit
        
        image.translatesAutoresizingMaskIntoConstraints = false
        
        
       
        
        
        return image
    }()
    private let sublabel: UILabel = {
        let label = UILabel()
        label.font = .italicSystemFont(ofSize: 18)
        label.text = "Read the latest world News instantly"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemGray6
        label.font = .monospacedDigitSystemFont(ofSize: 26, weight: .semibold)
        label.text = "Welcome to Good News"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let button: UIButton = {
        let button = UIButton(type: .system)
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Read the News"
        button.configuration = configuration
        button.addTarget(self, action: #selector(showNews), for: .touchUpInside)
        
        
        button.configuration?.baseBackgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray6
        view.addSubview(label)
        view.addSubview(sublabel)
        view.addSubview(button)
        view.addSubview(image)
        setConstraints()
        
        
    }
    private func setConstraints() {
        let labelContraints = [
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 40),
    
       
        ]
        let subLabelConstraints = [
            sublabel.topAnchor.constraint(equalTo: label.bottomAnchor,constant: 60),
            sublabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 70)
        ]
        let buttonConstraints = [
            button.topAnchor.constraint(equalTo: sublabel.bottomAnchor, constant: 60),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        let imageConstraints = [
            image.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20),
            image.centerXAnchor.constraint(equalTo: button.centerXAnchor),
            image.widthAnchor.constraint(equalToConstant: 300),
            image.heightAnchor.constraint(equalToConstant: 300)
            
        
        ]
        
        NSLayoutConstraint.activate(labelContraints)
        NSLayoutConstraint.activate(subLabelConstraints)
        NSLayoutConstraint.activate(buttonConstraints)
        NSLayoutConstraint.activate(imageConstraints)
       
      
        
        
    }
    @objc func showNews(){
        let newsVC = NewsViewController()
        newsVC.modalPresentationStyle = .overFullScreen
        newsVC.modalTransitionStyle = .flipHorizontal
            present(newsVC, animated: true)
        
    }
    
    

}
