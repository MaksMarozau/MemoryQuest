import UIKit

//MARK: - Final class MainListView

final class LoadingScreenView: UIViewController {

    
//MARK: - Properties of class
    
    var presenter: LoadingScreenPresenterProtocol!

    private let mainContainerView = UIView()
    private let screenImageView = UIImageView()
    private let ballImageView = UIImageView()
    private let loadingImageView = UIImageView()
    
    
    
//MARK: - Lifecycle of controller

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(mainContainerView)
        mainContainerView.addSubviews(with: screenImageView)
        
        configureNavBar()
        setConstraintes()
        configureUI()
    }

    
    
//MARK: - Configurations of Navigation bar
    
    private func configureNavBar() {
        
        navigationController?.tabBarController?.tabBar.isHidden = true
    }
    
    
    
//MARK: - Setting of constraintes
    
    private func setConstraintes() {
        
        mainContainerView.translatesAutoresizingMaskIntoConstraints = false
        mainContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mainContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        screenImageView.translatesAutoresizingMaskIntoConstraints = false
        screenImageView.topAnchor.constraint(equalTo: mainContainerView.topAnchor).isActive = true
        screenImageView.leadingAnchor.constraint(equalTo: mainContainerView.leadingAnchor).isActive = true
        screenImageView.trailingAnchor.constraint(equalTo: mainContainerView.trailingAnchor).isActive = true
        screenImageView.bottomAnchor.constraint(equalTo: mainContainerView.bottomAnchor).isActive = true
        
    }
    
    
    
//MARK: - Configuration of User Interface
    
    private func configureUI() {
        
        screenImageView.backgroundColor = .orange
    }
}



//MARK: - Implemendation of AddNewInfoInterractorInputProtocol protocol for AddNewInfoInterractor class
