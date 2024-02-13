import UIKit

//MARK: - Final class MenuScreenView

final class MenuScreenView: UIViewController {
    
    
    //MARK: - Properties of class
    
    var presenter: MenuScreenPresenterProtocol!
   
    private let mainContainerView = UIView()
    private let backgroundImageView = UIImageView()
    
    
    
    //MARK: - Lifecycle of controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        setConstraintes()
        configureUI()
    }
    
    
    
    //MARK: - Configurations of Navigation bar
    
    private func configureNavBar() {
        
        navigationController?.tabBarController?.tabBar.isHidden = true
    }
    
    
    
//MARK: - Adding of subviews
    
    private func addSubviews() {
        
        view.addSubview(mainContainerView)
        mainContainerView.addSubviews(for: backgroundImageView)
    }
    
    
    
    //MARK: - Setting of constraintes
    
    private func setConstraintes() {
        
        mainContainerView.translatesAutoresizingMaskIntoConstraints = false
        mainContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mainContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.topAnchor.constraint(equalTo: mainContainerView.topAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: mainContainerView.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: mainContainerView.trailingAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: mainContainerView.bottomAnchor).isActive = true
    }
    
    
    
    //MARK: - Configuration of User Interface
    
    private func configureUI() {
        
        backgroundImageView.image = UIImage(named: "backgroundMenu")
        backgroundImageView.contentMode = .scaleAspectFill
    }
}



//MARK: - Implemendation of AddNewInfoInterractorInputProtocol protocol for AddNewInfoInterractor class

