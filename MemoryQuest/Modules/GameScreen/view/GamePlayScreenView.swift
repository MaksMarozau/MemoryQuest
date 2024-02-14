import UIKit

//MARK: - Protocol for expansion GamePlayScreenPresenter. The logical methods of the game

protocol GamePlayScreenInputProtocol: AnyObject {
    
    func lightning(with imageNameArray: [String])
    func preparationForExersice(_ counter: Int)
    func updateScoreLabel(with data: String)
}



//MARK: - Final class GamePlayScreenView

final class GamePlayScreenView: UIViewController {
    
    
//MARK: - Properties of class
    
    var presenterRouting: GamePlayScreenPresenterRoutingProtocol!
    var presenterHandler: GamePlayScreenPresenterHandlerProtocol!
    
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
    @objc private let settingButton = UIButton()
    
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
        startGame()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureNavBar()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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
        
        scoreLabel.text = "0"
        scoreLabel.textColor = .white
        
        mediumModeLabel.text = "0"
        mediumModeLabel.textColor = .white
        
        settingButton.setBackgroundImage(UIImage(named: "settingsButtonImage"), for: .normal)
        settingButton.contentMode = .scaleAspectFit
    }
    
    
    
//MARK: - Setting of targets for buttons
    
    private func setButtonsTargets() {
        
        topBallButton.addTarget(self, action: #selector(topBallButtonTouchDown), for: .touchDown)
        topBallButton.addTarget(self, action: #selector(topBallButtonTouchUp), for: .touchUpInside)
        
        leftBallButton.addTarget(self, action: #selector(leftBallButtonTouchDown), for: .touchDown)
        leftBallButton.addTarget(self, action: #selector(leftBallButtonTouchUp), for: .touchUpInside)
        
        bottomBallButton.addTarget(self, action: #selector(bottomBallButtonTouchDown), for: .touchDown)
        bottomBallButton.addTarget(self, action: #selector(bottomBallButtonTouchUp), for: .touchUpInside)
        
        rightBallButton.addTarget(self, action: #selector(rightBallButtonTouchDown), for: .touchDown)
        rightBallButton.addTarget(self, action: #selector(rightBallButtonTouchUp), for: .touchUpInside)
        
        settingButton.addTarget(self, action: #selector(settingButtonTapped), for: .touchUpInside)
    }
    
    
    
//MARK: - Actions
    
    @objc private func topBallButtonTouchDown() {
        ballImageView.image = UIImage(named: "ballTop")
        VibrationManager.instance.vibro()
    }
    
    @objc private func topBallButtonTouchUp() {
        ballImageView.image = UIImage(named: "ballOff")
        presenterHandler.tappRegister(by: "ballTop")
    }
    
    
    @objc private func leftBallButtonTouchDown() {
        ballImageView.image = UIImage(named: "ballLeft")
        VibrationManager.instance.vibro()
    }
    
    @objc private func leftBallButtonTouchUp() {
        ballImageView.image = UIImage(named: "ballOff")
        presenterHandler.tappRegister(by: "ballLeft")
    }
    
    
    @objc private func bottomBallButtonTouchDown() {
        ballImageView.image = UIImage(named: "ballBot")
        VibrationManager.instance.vibro()
    }
    
    @objc private func bottomBallButtonTouchUp() {
        ballImageView.image = UIImage(named: "ballOff")
        presenterHandler.tappRegister(by: "ballBot")
    }
    
    
    @objc private func rightBallButtonTouchDown() {
        ballImageView.image = UIImage(named: "ballRight")
        VibrationManager.instance.vibro()
    }
    
    @objc private func rightBallButtonTouchUp() {
        ballImageView.image = UIImage(named: "ballOff")
        presenterHandler.tappRegister(by: "ballRight")
    }
    
    
    @objc private func settingButtonTapped() {
        presenterRouting.openSettings()
        VibrationManager.instance.vibro()
    }
    
    
    
//MARK: - Private gameplay methods
    
    private func startGame() {
        let alert = UIAlertController(title: "", message: "Try to remember the button combination", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { _ in
            self.presenterHandler.addingExercise()
        }))
        present(alert, animated: true)
    }
    
    
    private func preparationForUsersAnswer(_ counter: Int) {
        if counter <= 1 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                let alert = UIAlertController(title: "", message: "Try to repeate the button combination", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
                self.present(alert, animated: true)
            }
            presenterHandler.userWillAnswer()
        } else {
            presenterHandler.userWillAnswer()
        }
    }
}
    
    

//MARK: - Implemendation of GamePlayScreenInputProtocol protocol for GamePlayScreenView class
    
extension GamePlayScreenView: GamePlayScreenInputProtocol {
 
    func lightning(with imageNameArray: [String]) {

        var currentIndex = 0
        
        func setImageWithAnimation() {
            if currentIndex < imageNameArray.count {
                UIView.animate(withDuration: 0.5) {
                    self.ballImageView.image = UIImage(named: imageNameArray[currentIndex])
                } completion: { _ in
                    currentIndex += 1
                    sleep(1)
                    setImageWithoutAnimation()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        setImageWithAnimation()
                    }
                }
            } else {
                preparationForUsersAnswer(currentIndex)
                currentIndex = 0
            }
        }
        
        func setImageWithoutAnimation() {
            UIView.animate(withDuration: 0.4) {
                self.ballImageView.image = UIImage(named: "ballOff")
            }
        }
        setImageWithAnimation()
    }
    
    
    func preparationForExersice(_ counter: Int) {
        if counter < 1 {
            let alert = UIAlertController(title: "", message: "Try to remember the button combination", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { _ in
                self.presenterHandler.addingExercise()
            }))
            present(alert, animated: true)
        } else {
            let alert = UIAlertController(title: "Great!", message: "Try again!", preferredStyle: .alert)
            self.present(alert, animated: false)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                alert.dismiss(animated: false)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.presenterHandler.addingExercise()
                }
            }
        }
    }
    
    
    func updateScoreLabel(with data: String) {
        scoreLabel.text = data
    }
}
