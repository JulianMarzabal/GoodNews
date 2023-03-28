//
//  infoViewController.swift
//  Good News
//
//  Created by Julian Marzabal on 10/10/2022.
//
import SDWebImage
import UIKit


protocol infoViewControllerDelegate: AnyObject {
    func onView()
}

class infoViewController: UIViewController {
    weak var delegate: infoViewControllerDelegate?
    
    var viewModel: InfoViewModel
    
    init(viewModel: InfoViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

   
    
    private lazy var titleNews: UILabel = {
        let label = UILabel()
        label.text = viewModel.news.title
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = viewModel.news.description
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .monospacedDigitSystemFont(ofSize: 18, weight: .light)
        label.backgroundColor = .systemGray3
        label.contentMode = .scaleAspectFit
        label.textColor = .black
        
        return label
    }()
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "BBCNews")
        imageView.image = image
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setContraints()
    

    }
    
    func setupUI(){
        setImage()
        view.backgroundColor = .systemGray6
        view.addSubview(label)
        view.addSubview(titleNews)
 
        view.addSubview(imageView)
        
    }

 
    
    
    private func setContraints(){
        NSLayoutConstraint.activate([
          
            titleNews.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            titleNews.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 5),
            titleNews.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            imageView.topAnchor.constraint(equalTo: titleNews.bottomAnchor,constant: 70),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.widthAnchor.constraint(equalToConstant: 150),
            
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            
            
            
        
        
        ])
    }
    
    func setImage() {
        guard let url = URL(string: viewModel.news.urlToImage ?? "") else {return}
        imageView.sd_setImage(with: url)
    }
    


}
