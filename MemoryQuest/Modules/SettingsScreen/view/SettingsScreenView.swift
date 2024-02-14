import UIKit

//MARK: - Protocol for expansion SettingsScreenView to update data

protocol SettingsScreenViewInputProtocol: AnyObject {
    
    func updateData(with data: [Bool])
}



//MARK: - Final class SettingsScreenView

final class SettingsScreenView: UIViewController {
    
    
//MARK: - Properties of class
    
    var presenter: SettingsScreenPresenterProtocol!
    
    private let mainContainerView = UIView()
    private let backgroundImageView = UIImageView()
    private let backButton = UIButton()
    private let settingsFrameImageView = UIImageView()
    private let settingTitleImageView = UIImageView()
    
    private let settingButtonsContainerView = UIView()
    private let soundButton = UIButton()
    private let vibroButton = UIButton()
    
    
    
//MARK: - Lifecycle of controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        setConstraintes()
        configureUI()
        setTargets()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureNavBar()
        presenter.loadSettings()
    }
    
    
    
//MARK: - Configurations of Navigation bar
    
    private func configureNavBar() {
        
        navigationController?.tabBarController?.tabBar.isHidden = true
        navigationController?.topViewController?.navigationItem.hidesBackButton = true
    }
    
    
    
//MARK: - Adding of subviews
                
    private func addSubviews() {
        
        view.addSubview(mainContainerView)
        mainContainerView.addSubviews(for: backgroundImageView, backButton, settingsFrameImageView, settingTitleImageView, settingButtonsContainerView)
        
        mainContainerView.insertSubview(settingTitleImageView, aboveSubview: settingsFrameImageView)
        mainContainerView.bringSubviewToFront(settingButtonsContainerView)
        
        settingButtonsContainerView.addSubviews(for: soundButton, vibroButton)
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
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: mainContainerView.safeAreaLayoutGuide.topAnchor).isActive = true
        backButton.leadingAnchor.constraint(equalTo: mainContainerView.leadingAnchor, constant: 12).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 55).isActive = true
        
        settingsFrameImageView.translatesAutoresizingMaskIntoConstraints = false
        settingsFrameImageView.centerXAnchor.constraint(equalTo: mainContainerView.centerXAnchor).isActive = true
        settingsFrameImageView.centerYAnchor.constraint(equalTo: mainContainerView.centerYAnchor).isActive = true
        settingsFrameImageView.heightAnchor.constraint(equalTo: mainContainerView.heightAnchor, multiplier: 0.3).isActive = true
        settingsFrameImageView.widthAnchor.constraint(equalTo: mainContainerView.widthAnchor, multiplier: 0.8).isActive = true
        
        settingTitleImageView.translatesAutoresizingMaskIntoConstraints = false
        settingTitleImageView.topAnchor.constraint(equalTo: settingsFrameImageView.topAnchor).isActive = true
        settingTitleImageView.centerXAnchor.constraint(equalTo: mainContainerView.centerXAnchor).isActive = true
        settingTitleImageView.heightAnchor.constraint(equalTo: mainContainerView.heightAnchor, multiplier: 0.1).isActive = true
        settingTitleImageView.widthAnchor.constraint(equalTo: mainContainerView.widthAnchor, multiplier: 0.7).isActive = true
        
        settingButtonsContainerView.translatesAutoresizingMaskIntoConstraints = false
        settingButtonsContainerView.centerXAnchor.constraint(equalTo: mainContainerView.centerXAnchor).isActive = true
        settingButtonsContainerView.centerYAnchor.constraint(equalTo: mainContainerView.centerYAnchor).isActive = true
        settingButtonsContainerView.topAnchor.constraint(equalTo: settingTitleImageView.bottomAnchor).isActive = true
        settingButtonsContainerView.widthAnchor.constraint(equalTo: mainContainerView.widthAnchor, multiplier: 0.5).isActive = true
        
        soundButton.translatesAutoresizingMaskIntoConstraints = false
        soundButton.leadingAnchor.constraint(equalTo: settingButtonsContainerView.leadingAnchor).isActive = true
        soundButton.heightAnchor.constraint(equalTo: settingButtonsContainerView.heightAnchor).isActive = true
        soundButton.widthAnchor.constraint(equalTo: soundButton.heightAnchor).isActive = true
        
        vibroButton.translatesAutoresizingMaskIntoConstraints = false
        vibroButton.trailingAnchor.constraint(equalTo: settingButtonsContainerView.trailingAnchor).isActive = true
        vibroButton.heightAnchor.constraint(equalTo: settingButtonsContainerView.heightAnchor).isActive = true
        vibroButton.widthAnchor.constraint(equalTo: soundButton.heightAnchor).isActive = true
    }
    
    
    
//MARK: - Configuration of User Interface
    
    private func configureUI() {
        
        backgroundImageView.image = UIImage(named: "backgroundSettings")
        backgroundImageView.contentMode = .scaleAspectFill
        
        backButton.setBackgroundImage(UIImage(named: "backButtonImage"), for: .normal)
        backButton.contentMode = .scaleAspectFit
        
        settingsFrameImageView.image = UIImage(named: "settingsFrame")
        settingsFrameImageView.contentMode = .scaleAspectFit
        
        settingTitleImageView.image = UIImage(named: "settingsLabel")
        settingTitleImageView.contentMode = .scaleAspectFit
        
        soundButton.setBackgroundImage(UIImage(named: "soundOn"), for: .normal)
        soundButton.contentMode = .scaleAspectFit
        
        vibroButton.setBackgroundImage(UIImage(named: "vibroOn"), for: .normal)
        vibroButton.contentMode = .scaleAspectFit
    }
    
    
    
//MARK: - Setting buttons targets

    private func setTargets() {
        
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        soundButton.addTarget(self, action: #selector(soundButtonTapped), for: .touchUpInside)
        vibroButton.addTarget(self, action: #selector(vibroButtonTapped), for: .touchUpInside)
    }
    
    
    
//MARK: - Actions
    
    @objc private func backButtonTapped() {
        presenter.back()
    }
    
    @objc private func soundButtonTapped() {
        soundButton.isSelected.toggle()
        if soundButton.isSelected {
            soundButton.setBackgroundImage(UIImage(named: "soundOff"), for: .normal)
            presenter.musicOff()
        } else {
            soundButton.setBackgroundImage(UIImage(named: "soundOn"), for: .normal)
            presenter.musicON()
        }
    }
    
    @objc private func vibroButtonTapped() {
        vibroButton.isSelected.toggle()
        if vibroButton.isSelected {
            vibroButton.setBackgroundImage(UIImage(named: "vibroOff"), for: .normal)
            presenter.vibroOff()
        } else {
            vibroButton.setBackgroundImage(UIImage(named: "vibroOn"), for: .normal)
            presenter.vibroOn()
        }
    }
}



//MARK: - Implemendation of SettingsScreenViewInputProtocol protocol for GamePlayScreenView class

extension SettingsScreenView: SettingsScreenViewInputProtocol {
    
    func updateData(with data: [Bool]) {
        let soundStatus = data.first
        let vibroStatus = data.last
        
        if soundStatus == false {
            soundButton.isSelected = true
            soundButton.setBackgroundImage(UIImage(named: "soundOff"), for: .normal)
        }
        
        if vibroStatus == false {
            vibroButton.isSelected = true
            vibroButton.setBackgroundImage(UIImage(named: "vibroOff"), for: .normal)
        }
    }
}
