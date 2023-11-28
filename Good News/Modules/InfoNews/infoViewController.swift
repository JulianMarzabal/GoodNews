//
//  infoViewController.swift
//  Good News
//
//  Created by Julian Marzabal on 10/10/2022.
//
import SDWebImage
import UIKit

protocol InfoViewControllerDelegate: AnyObject {
    func onView()
    func onSelect(model: FavouriteNewsModel, isSelectected: Bool)
}
class InfoViewController: UIViewController {
    weak var delegate: InfoViewControllerDelegate?
    var viewModel: InfoViewModel
    init(viewModel: InfoViewModel) {
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
        label.font = .monospacedDigitSystemFont(ofSize: 16, weight: .light)
        label.backgroundColor = .systemGray6
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
    lazy var favouriteButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "star.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
        button.setImage(image, for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(saveNews), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    lazy var favouriteLabel: UILabel = {
        let label = UILabel()
        label.text = "Save this news:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.backgroundColor = .systemGray6
        label.contentMode = .scaleAspectFit
        label.textColor = .black
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setContraints()
    }
    func setupUI() {
        setImage()
        view.backgroundColor = .systemGray6
        view.addSubview(label)
        view.addSubview(titleNews)
        view.addSubview(imageView)
        view.addSubview(favouriteLabel)
        view.addSubview(favouriteButton)
    }
    @objc func saveNews() {
        let newsFavourite = viewModel.news
        viewModel.isSelected.toggle()
        favouriteButton.tintColor = viewModel.isSelected ? .systemYellow : .black
        if viewModel.isSelected {
            viewModel.saveNews(news: newsFavourite)
        } else {
            print("eliminar new de core Data")
        }
    }
    private func setContraints() {
        NSLayoutConstraint.activate([
            titleNews.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            titleNews.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            titleNews.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: titleNews.bottomAnchor, constant: 70),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.widthAnchor.constraint(equalToConstant: 150),
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            favouriteLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            favouriteLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            favouriteButton.leadingAnchor.constraint(equalTo: favouriteLabel.trailingAnchor, constant: 5),
            favouriteButton.centerYAnchor.constraint(equalTo: favouriteLabel.centerYAnchor)
        ])
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.setInitialSelectedState()
        viewModel.onSuccessfulUpdateReaction = { [weak self] in
            DispatchQueue.main.async {
                self?.setupUI()
            }
        }
    }
    func setImage() {
        guard let url = URL(string: viewModel.news.urlToImage ?? "") else {return}
        imageView.sd_setImage(with: url)
    }
}
