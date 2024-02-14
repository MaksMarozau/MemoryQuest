import UIKit

//MARK: - Final class MenuScreenView

final class MenuScreenView: UIViewController {
    
    
//MARK: - Properties of class
    
    var presenter: MenuScreenPresenterProtocol!
   
    private let mainContainerView = UIView()
    private let backgroundImageView = UIImageView()
    private let centerContainerView = UIView()
    private let ballImageView = UIImageView()
    private let playNowButton = UIButton()
    private let privacyPolicyButton = UIButton()
    
    
    
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
    }
    
    
    
//MARK: - Adding of subviews
    
    private func addSubviews() {
        
        view.addSubview(mainContainerView)
        mainContainerView.addSubviews(for: backgroundImageView, centerContainerView, privacyPolicyButton)
        centerContainerView.addSubviews(for: ballImageView, playNowButton)
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
        
        playNowButton.translatesAutoresizingMaskIntoConstraints = false
        playNowButton.topAnchor.constraint(equalTo: ballImageView.bottomAnchor, constant: -10).isActive = true
        playNowButton.bottomAnchor.constraint(equalTo: centerContainerView.bottomAnchor).isActive = true
        playNowButton.leadingAnchor.constraint(equalTo: centerContainerView.leadingAnchor).isActive = true
        playNowButton.trailingAnchor.constraint(equalTo: centerContainerView.trailingAnchor).isActive = true

        privacyPolicyButton.translatesAutoresizingMaskIntoConstraints = false
        privacyPolicyButton.topAnchor.constraint(equalTo: mainContainerView.safeAreaLayoutGuide.topAnchor).isActive = true
        privacyPolicyButton.trailingAnchor.constraint(equalTo: ballImageView.trailingAnchor).isActive = true
        privacyPolicyButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        privacyPolicyButton.widthAnchor.constraint(equalToConstant: 55).isActive = true
    }
    
    
    
//MARK: - Configuration of User Interface
    
    private func configureUI() {
        
        backgroundImageView.image = UIImage(named: "backgroundMenu")
        backgroundImageView.contentMode = .scaleAspectFill
        
        ballImageView.image = UIImage(named: "ballLargeImage")
        ballImageView.contentMode = .scaleAspectFit
        
        playNowButton.setBackgroundImage(UIImage(named: "playNowImage"), for: .normal)
        playNowButton.contentMode = .scaleAspectFit
        playNowButton.addTarget(self, action: #selector(playNowButtonTapped), for: .touchUpInside)
        
        privacyPolicyButton.setBackgroundImage(UIImage(named: "privacyPolicyImage"), for: .normal)
        privacyPolicyButton.contentMode = .scaleAspectFit
        privacyPolicyButton.addTarget(self, action: #selector(privacyPolicyButtonTapped), for: .touchUpInside)
    }
    
    
    
//MARK: - Actions

    @objc private func playNowButtonTapped() {
        presenter.playNow()
    }
    
    
    @objc private func privacyPolicyButtonTapped() {
        presenter.openPrivacyPolicy()
    }
}
