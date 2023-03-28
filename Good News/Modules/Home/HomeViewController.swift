//
//  HomeViewController.swift
//  Good News
//
//  Created by Julian Marzabal on 09/10/2022.
//

import UIKit
protocol HomeViewProtocol:AnyObject {
    func onSuccess()
}

class HomeViewController: UIViewController {
    weak var delegate: HomeViewProtocol?
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
    lazy var sublabel: UILabel = {
        let label = UILabel()
        label.font = .italicSystemFont(ofSize: 22)
        label.textColor = .black
        label.numberOfLines = 1
        label.text = "Read the latest world News instantly"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
  lazy var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
      label.textColor = .black
        label.font = .monospacedDigitSystemFont(ofSize: 28, weight: .bold)
        label.text = "Good News"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var button: UIButton = {
        let button = UIButton(type: .system)
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Read the News"
        button.configuration = configuration
        button.addTarget(self, action: #selector(showNews), for: .touchUpInside)
        
        
        button.configuration?.baseBackgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray6
 
        view.addSubview(label)
        view.addSubview(sublabel)
        view.addSubview(button)
    
        setConstraints()

        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.setHidesBackButton(true, animated: true)
        
    }
    private func setConstraints() {
        let labelContraints = [
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 40),
    
       
        ]
        let subLabelConstraints = [
            sublabel.topAnchor.constraint(equalTo: label.bottomAnchor,constant: 60),
            sublabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20)
        ]
        let buttonConstraints = [
            button.topAnchor.constraint(equalTo: sublabel.bottomAnchor, constant: 60),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
     

        
        NSLayoutConstraint.activate(labelContraints)
        NSLayoutConstraint.activate(subLabelConstraints)
        NSLayoutConstraint.activate(buttonConstraints)
       
      
        
        
    }
    @objc func showNews(){
        delegate?.onSuccess()
        
    }
    
    

}
