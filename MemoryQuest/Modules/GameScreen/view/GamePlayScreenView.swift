import UIKit

//MARK: - Final class GamePlayScreenView

final class GamePlayScreenView: UIViewController {
    
    
//MARK: - Properties of class
    
    var presenter: GamePlayScreenPresenterProtocol!
    
    private let mainContainerView = UIView()
    private let backgroundImageView = UIImageView()
    private let centerContainerView = UIView()
    private let ballImageView = UIImageView()
    
    private let topContainerView = UIView()
    private let scoresContainerView = UIView()
    private let scoreImageView = UIImageView()
    private let recordImageView = UIImageView()
    
    
    
    
//MARK: - Lifecycle of controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        setConstraintes()
        configureUI()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureNavBar()
    }
    
    
    
//MARK: - Configurations of Navigation bar
    
    private func configureNavBar() {
        
        navigationController?.tabBarController?.tabBar.isHidden = true
        navigationController?.topViewController?.navigationItem.hidesBackButton = true
    }
    
    
    
//MARK: - Adding of subviews
        
        private func addSubviews() {
            
            view.addSubview(mainContainerView)
            mainContainerView.addSubviews(for: backgroundImageView, centerContainerView, topContainerView)
            centerContainerView.addSubview(ballImageView)
            topContainerView.addSubviews(for: scoresContainerView)
            scoresContainerView.addSubviews(for: scoreImageView, recordImageView)
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
        
        centerContainerView.translatesAutoresizingMaskIntoConstraints = false
        centerContainerView.centerXAnchor.constraint(equalTo: mainContainerView.centerXAnchor).isActive = true
        centerContainerView.centerYAnchor.constraint(equalTo: mainContainerView.centerYAnchor).isActive = true
        centerContainerView.heightAnchor.constraint(equalTo: mainContainerView.heightAnchor, multiplier: 0.5).isActive = true
        centerContainerView.widthAnchor.constraint(equalTo: mainContainerView.widthAnchor, multiplier: 0.9).isActive = true
        
        ballImageView.translatesAutoresizingMaskIntoConstraints = false
        ballImageView.topAnchor.constraint(equalTo: centerContainerView.topAnchor).isActive = true
        ballImageView.centerXAnchor.constraint(equalTo: centerContainerView.centerXAnchor).isActive = true
        ballImageView.heightAnchor.constraint(equalTo: centerContainerView.heightAnchor, multiplier: 0.8).isActive = true
        ballImageView.widthAnchor.constraint(equalTo: ballImageView.heightAnchor).isActive = true
        
        topContainerView.translatesAutoresizingMaskIntoConstraints = false
        topContainerView.topAnchor.constraint(equalTo: mainContainerView.safeAreaLayoutGuide.topAnchor).isActive = true
        topContainerView.leadingAnchor.constraint(equalTo: mainContainerView.leadingAnchor, constant: 21).isActive = true
        topContainerView.trailingAnchor.constraint(equalTo: mainContainerView.trailingAnchor, constant: -21).isActive = true
        topContainerView.heightAnchor.constraint(equalToConstant: 55).isActive = true

        scoresContainerView.translatesAutoresizingMaskIntoConstraints = false
        scoresContainerView.trailingAnchor.constraint(equalTo: topContainerView.trailingAnchor).isActive = true
        scoresContainerView.heightAnchor.constraint(equalTo: topContainerView.heightAnchor).isActive = true
        scoresContainerView.widthAnchor.constraint(equalTo: topContainerView.widthAnchor, multiplier: 0.7).isActive = true
        
        scoreImageView.translatesAutoresizingMaskIntoConstraints = false
        scoreImageView.trailingAnchor.constraint(equalTo: scoresContainerView.trailingAnchor).isActive = true
        scoreImageView.heightAnchor.constraint(equalTo: scoresContainerView.heightAnchor).isActive = true
        scoreImageView.widthAnchor.constraint(equalTo: scoresContainerView.widthAnchor, multiplier: 0.45).isActive = true
        
        recordImageView.translatesAutoresizingMaskIntoConstraints = false
        recordImageView.leadingAnchor.constraint(equalTo: scoresContainerView.leadingAnchor).isActive = true
        recordImageView.heightAnchor.constraint(equalTo: scoresContainerView.heightAnchor).isActive = true
        recordImageView.widthAnchor.constraint(equalTo: scoresContainerView.widthAnchor, multiplier: 0.45).isActive = true
    }
    
    
    
//MARK: - Configuration of User Interface
    
    private func configureUI() {
        
        backgroundImageView.image = UIImage(named: "backgroundGamePlay")
        backgroundImageView.contentMode = .scaleAspectFill
        
        ballImageView.image = UIImage(named: "ballOff")
        ballImageView.contentMode = .scaleAspectFit
        
        scoreImageView.image = UIImage(named: "scoreTitleImage")
        scoreImageView.contentMode = .scaleAspectFit
        
        recordImageView.image = UIImage(named: "recordTitleImage")
        recordImageView.contentMode = .scaleAspectFit
    }
}



//MARK: - Implemendation of AddNewInfoInterractorInputProtocol protocol for AddNewInfoInterractor class

