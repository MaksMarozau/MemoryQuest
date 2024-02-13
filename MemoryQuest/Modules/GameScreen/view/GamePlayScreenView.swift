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
    private let mediumModeImageView = UIImageView()
    private let scoreLabel = UILabel()
    private let mediumModeLabel = UILabel()
    private let settingButton = UIButton()
    
    private let ballButtonsContainerView = UIView()
    private let topBallButton = UIButton()
    private let leftBallButton = UIButton()
    private let bottomBallButton = UIButton()
    private let rightBallButton = UIButton()
    
    
    
//MARK: - Lifecycle of controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        setConstraintes()
        configureUI()
        setButtonsTargets()
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
            centerContainerView.addSubviews(for: ballImageView, ballButtonsContainerView)
            centerContainerView.insertSubview(ballButtonsContainerView, at: 1)
            
            topContainerView.addSubviews(for: scoresContainerView, settingButton)
            scoresContainerView.addSubviews(for: scoreImageView, mediumModeImageView)
            
            scoreImageView.addSubview(scoreLabel)
            mediumModeImageView.addSubview(mediumModeLabel)
            
            ballButtonsContainerView.addSubviews(for: topBallButton, leftBallButton, bottomBallButton, rightBallButton)
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
        topContainerView.leadingAnchor.constraint(equalTo: mainContainerView.leadingAnchor, constant: 12).isActive = true
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
        
        mediumModeImageView.translatesAutoresizingMaskIntoConstraints = false
        mediumModeImageView.leadingAnchor.constraint(equalTo: scoresContainerView.leadingAnchor).isActive = true
        mediumModeImageView.heightAnchor.constraint(equalTo: scoresContainerView.heightAnchor).isActive = true
        mediumModeImageView.widthAnchor.constraint(equalTo: scoresContainerView.widthAnchor, multiplier: 0.45).isActive = true
        
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.centerYAnchor.constraint(equalTo: scoreImageView.centerYAnchor).isActive = true
        scoreLabel.heightAnchor.constraint(equalTo: scoreImageView.heightAnchor, multiplier: 0.8).isActive = true
        scoreLabel.trailingAnchor.constraint(equalTo: scoreImageView.trailingAnchor, constant: -22).isActive = true
        
        mediumModeLabel.translatesAutoresizingMaskIntoConstraints = false
        mediumModeLabel.centerYAnchor.constraint(equalTo: mediumModeImageView.centerYAnchor).isActive = true
        mediumModeLabel.heightAnchor.constraint(equalTo: mediumModeImageView.heightAnchor, multiplier: 0.8).isActive = true
        mediumModeLabel.trailingAnchor.constraint(equalTo: mediumModeImageView.trailingAnchor, constant: -22).isActive = true
        
        settingButton.translatesAutoresizingMaskIntoConstraints = false
        settingButton.leadingAnchor.constraint(equalTo: topContainerView.leadingAnchor).isActive = true
        settingButton.heightAnchor.constraint(equalTo: topContainerView.heightAnchor).isActive = true
        settingButton.widthAnchor.constraint(equalTo: settingButton.heightAnchor).isActive = true
        
        ballButtonsContainerView.translatesAutoresizingMaskIntoConstraints = false
        ballButtonsContainerView.centerXAnchor.constraint(equalTo: ballImageView.centerXAnchor).isActive = true
        ballButtonsContainerView.centerYAnchor.constraint(equalTo: ballImageView.centerYAnchor).isActive = true
        ballButtonsContainerView.heightAnchor.constraint(equalTo: ballImageView.heightAnchor, multiplier: 0.9).isActive = true
        ballButtonsContainerView.widthAnchor.constraint(equalTo: ballImageView.widthAnchor, multiplier: 0.9).isActive = true
        
        topBallButton.translatesAutoresizingMaskIntoConstraints = false
        topBallButton.centerXAnchor.constraint(equalTo: ballButtonsContainerView.centerXAnchor, constant: -14).isActive = true
        topBallButton.topAnchor.constraint(equalTo: ballButtonsContainerView.topAnchor).isActive = true
        topBallButton.heightAnchor.constraint(equalTo: ballButtonsContainerView.heightAnchor, multiplier: 0.35).isActive = true
        topBallButton.widthAnchor.constraint(equalTo: ballButtonsContainerView.widthAnchor, multiplier: 0.35).isActive = true
        
        leftBallButton.translatesAutoresizingMaskIntoConstraints = false
        leftBallButton.centerYAnchor.constraint(equalTo: ballButtonsContainerView.centerYAnchor, constant: 12).isActive = true
        leftBallButton.leadingAnchor.constraint(equalTo: ballButtonsContainerView.leadingAnchor).isActive = true
        leftBallButton.heightAnchor.constraint(equalTo: ballButtonsContainerView.heightAnchor, multiplier: 0.35).isActive = true
        leftBallButton.widthAnchor.constraint(equalTo: ballButtonsContainerView.widthAnchor, multiplier: 0.35).isActive = true
        
        bottomBallButton.translatesAutoresizingMaskIntoConstraints = false
        bottomBallButton.centerXAnchor.constraint(equalTo: ballButtonsContainerView.centerXAnchor, constant: 12).isActive = true
        bottomBallButton.bottomAnchor.constraint(equalTo: ballButtonsContainerView.bottomAnchor).isActive = true
        bottomBallButton.heightAnchor.constraint(equalTo: ballButtonsContainerView.heightAnchor, multiplier: 0.35).isActive = true
        bottomBallButton.widthAnchor.constraint(equalTo: ballButtonsContainerView.widthAnchor, multiplier: 0.35).isActive = true
        
        rightBallButton.translatesAutoresizingMaskIntoConstraints = false
        rightBallButton.centerYAnchor.constraint(equalTo: ballButtonsContainerView.centerYAnchor, constant: -14).isActive = true
        rightBallButton.trailingAnchor.constraint(equalTo: ballButtonsContainerView.trailingAnchor).isActive = true
        rightBallButton.heightAnchor.constraint(equalTo: ballButtonsContainerView.heightAnchor, multiplier: 0.35).isActive = true
        rightBallButton.widthAnchor.constraint(equalTo: ballButtonsContainerView.widthAnchor, multiplier: 0.35).isActive = true
    }
    
    
    
//MARK: - Configuration of User Interface
    
    private func configureUI() {
        
        backgroundImageView.image = UIImage(named: "backgroundGamePlay")
        backgroundImageView.contentMode = .scaleAspectFill
        
        ballImageView.image = UIImage(named: "ballOff")
        ballImageView.contentMode = .scaleAspectFit
        
        scoreImageView.image = UIImage(named: "scoreTitleImage")
        scoreImageView.contentMode = .scaleAspectFit
        
        mediumModeImageView.image = UIImage(named: "mediumModeTitleImage")
        mediumModeImageView.contentMode = .scaleAspectFit
        
        scoreLabel.text = "63"
        
        mediumModeLabel.text = "1"
        
        settingButton.setBackgroundImage(UIImage(named: "settingButtonImage"), for: .normal)
        settingButton.contentMode = .scaleAspectFit
    }
    
    
    
//MARK: - Setting of targets for buttons
    
    private func setButtonsTargets() {
        
        topBallButton.addTarget(self, action: #selector(<#T##@objc method#>), for: .touchUpInside)
        leftBallButton.addTarget(self, action: #selector(<#T##@objc method#>), for: .touchUpInside)
        bottomBallButton.addTarget(self, action: #selector(<#T##@objc method#>), for: .touchUpInside)
        rightBallButton.addTarget(self, action: #selector(<#T##@objc method#>), for: .touchUpInside)

        settingButton.addTarget(self, action: #selector(<#T##@objc method#>), for: .touchUpInside)
    }
    
    
    
//MARK: - Actions
    
    
}



//MARK: - Implemendation of AddNewInfoInterractorInputProtocol protocol for AddNewInfoInterractor class

