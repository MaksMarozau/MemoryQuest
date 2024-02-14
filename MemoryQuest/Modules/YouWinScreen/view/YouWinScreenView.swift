import UIKit

//MARK: - Final class YouWinScreenView

final class YouWinScreenView: UIViewController {
    
    
//MARK: - Properties of class
    
    var presenter: YouWinScreenPresenterProtocol!
    
    private let mainContainerView = UIView()
    private let backgroundImageView = UIImageView()
    
    private let centerContainerView = UIView()
    private let centerButtonsView = UIView()
    private let scoreFrameImageView = UIImageView()
    private let greetingImageView = UIImageView()
    private let menuButton = UIButton()
    private let restartButton = UIButton()
    private let centerScoreLabel = UILabel()
    private let centerBestScoreLabel = UILabel()
    
    private let topContainerView = UIView()
    private let scoresContainerView = UIView()
    private let scoreImageView = UIImageView()
    private let mediumModeImageView = UIImageView()
    private let scoreLabel = UILabel()
    private let mediumModeLabel = UILabel()
    private let settingButton = UIButton()
    

   
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
    }
    
    
    
//MARK: - Adding of subviews
        
        private func addSubviews() {
            
            view.addSubview(mainContainerView)
            mainContainerView.addSubviews(for: backgroundImageView, centerContainerView, topContainerView)
            centerContainerView.addSubviews(for: centerButtonsView, scoreFrameImageView, greetingImageView)
            centerButtonsView.addSubviews(for: menuButton, restartButton)
            scoreFrameImageView.addSubviews(for: centerScoreLabel, centerBestScoreLabel)
            
            topContainerView.addSubviews(for: scoresContainerView, settingButton)
            scoresContainerView.addSubviews(for: scoreImageView, mediumModeImageView)
            
            scoreImageView.addSubview(scoreLabel)
            mediumModeImageView.addSubview(mediumModeLabel)
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
        
        centerButtonsView.translatesAutoresizingMaskIntoConstraints = false
        centerButtonsView.centerXAnchor.constraint(equalTo: centerContainerView.centerXAnchor).isActive = true
        centerButtonsView.widthAnchor.constraint(equalTo: centerContainerView.widthAnchor, multiplier: 0.68).isActive = true
        centerButtonsView.bottomAnchor.constraint(equalTo: centerContainerView.bottomAnchor).isActive = true
        centerButtonsView.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
        scoreFrameImageView.translatesAutoresizingMaskIntoConstraints = false
        scoreFrameImageView.centerXAnchor.constraint(equalTo: centerContainerView.centerXAnchor).isActive = true
        scoreFrameImageView.widthAnchor.constraint(equalTo: centerContainerView.widthAnchor, multiplier: 0.68).isActive = true
        scoreFrameImageView.bottomAnchor.constraint(equalTo: centerButtonsView.topAnchor, constant: -3).isActive = true
        scoreFrameImageView.heightAnchor.constraint(equalTo: centerContainerView.heightAnchor, multiplier: 0.38).isActive = true
        
        greetingImageView.translatesAutoresizingMaskIntoConstraints = false
        greetingImageView.leadingAnchor.constraint(equalTo: centerContainerView.leadingAnchor).isActive = true
        greetingImageView.trailingAnchor.constraint(equalTo: centerContainerView.trailingAnchor).isActive = true
        greetingImageView.topAnchor.constraint(equalTo: centerContainerView.topAnchor).isActive = true
        greetingImageView.heightAnchor.constraint(equalTo: centerContainerView.heightAnchor, multiplier: 0.63).isActive = true
        
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        menuButton.trailingAnchor.constraint(equalTo: centerButtonsView.trailingAnchor).isActive = true
        menuButton.heightAnchor.constraint(equalTo: centerButtonsView.heightAnchor).isActive = true
        menuButton.widthAnchor.constraint(equalTo: centerButtonsView.widthAnchor, multiplier: 0.37).isActive = true
        
        restartButton.translatesAutoresizingMaskIntoConstraints = false
        restartButton.leadingAnchor.constraint(equalTo: centerButtonsView.leadingAnchor).isActive = true
        restartButton.heightAnchor.constraint(equalTo: centerButtonsView.heightAnchor).isActive = true
        restartButton.widthAnchor.constraint(equalTo: centerButtonsView.widthAnchor, multiplier: 0.52).isActive = true

        centerScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        centerScoreLabel.centerYAnchor.constraint(equalTo: scoreFrameImageView.centerYAnchor, constant: -7).isActive = true
        centerScoreLabel.trailingAnchor.constraint(equalTo: scoreFrameImageView.trailingAnchor, constant: -45).isActive = true
        centerScoreLabel.widthAnchor.constraint(equalToConstant: 30).isActive = true
        centerScoreLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        centerBestScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        centerBestScoreLabel.topAnchor.constraint(equalTo: centerScoreLabel.bottomAnchor, constant:  10).isActive = true
        centerBestScoreLabel.trailingAnchor.constraint(equalTo: scoreFrameImageView.trailingAnchor, constant: -45).isActive = true
        centerBestScoreLabel.widthAnchor.constraint(equalToConstant: 30).isActive = true
        centerBestScoreLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        
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
    }
    
    
    
//MARK: - Configuration of User Interface
    
    private func configureUI() {
        
        backgroundImageView.image = UIImage(named: "backgroundGamePlay")
        backgroundImageView.contentMode = .scaleAspectFill
        
        scoreImageView.image = UIImage(named: "scoreTitleImage")
        scoreImageView.contentMode = .scaleAspectFit
        
        mediumModeImageView.image = UIImage(named: "mediumModeTitleImage")
        mediumModeImageView.contentMode = .scaleAspectFit
        
        scoreLabel.text = "5"
        scoreLabel.textColor = .white
        
        mediumModeLabel.text = "3"
        mediumModeLabel.textColor = .white
        
        settingButton.setBackgroundImage(UIImage(named: "settingsButtonImage"), for: .normal)
        settingButton.contentMode = .scaleAspectFit
        
        scoreFrameImageView.image = UIImage(named: "scoreFrame")
        scoreFrameImageView.contentMode = .scaleAspectFill
        
        greetingImageView.image = UIImage(named: "youWinImage")
        greetingImageView.contentMode = .scaleAspectFit
        
        menuButton.setBackgroundImage(UIImage(named: "menuImage"), for: .normal)
        menuButton.contentMode = .scaleAspectFit
        
        restartButton.setBackgroundImage(UIImage(named: "restartImage"), for: .normal)
        restartButton.contentMode = .scaleAspectFit
        
        centerScoreLabel.text = "15"
        centerScoreLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        centerScoreLabel.textColor = .customeYellow
        centerScoreLabel.textAlignment = .center
        
        centerBestScoreLabel.text = "15"
        centerBestScoreLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        centerBestScoreLabel.textColor = .customeYellow
        centerBestScoreLabel.textAlignment = .center
    }
    
    
    
//MARK: - Setting of targets for buttons
    
    private func setButtonsTargets() {
        
        settingButton.addTarget(self, action: #selector(settingButtonTapped), for: .touchUpInside)
        menuButton.addTarget(self, action: #selector(menuButtonTapped), for: .touchUpInside)
        restartButton.addTarget(self, action: #selector(restartButtonTapped), for: .touchUpInside)
    }
    
    
    
//MARK: - Actions

    @objc private func settingButtonTapped() {
        presenter.openSettings()
    }
    
    @objc private func menuButtonTapped() {
        presenter.openMenu()
    }
    
    
    @objc private func restartButtonTapped() {
        presenter.restartTheGame()
    }
}
