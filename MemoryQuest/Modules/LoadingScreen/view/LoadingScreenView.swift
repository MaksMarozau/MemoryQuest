import UIKit

//MARK: - Final class MainListView

final class LoadingScreenView: UIViewController {

    
//MARK: - Properties of class
    
    var presenter: LoadingScreenPresenterProtocol!

    private let mainContainerView = UIView()
    private let screenImageView = UIImageView()
    private let ballImageView = UIImageView()
    private let loadingImageView = UIImageView()
    
    
    
//MARK: - Lifecycles of controller

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(mainContainerView)
        mainContainerView.addSubviews(with: screenImageView, ballImageView, loadingImageView)
        
        setConstraintes()
        configureUI()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureNavBar()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        loadingAnimation()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
            self.presenter.loadingFinished()
        }
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
        
        ballImageView.translatesAutoresizingMaskIntoConstraints = false
        ballImageView.centerXAnchor.constraint(equalTo: mainContainerView.centerXAnchor).isActive = true
        ballImageView.centerYAnchor.constraint(equalTo: mainContainerView.centerYAnchor).isActive = true
        ballImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        ballImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        loadingImageView.translatesAutoresizingMaskIntoConstraints = false
        loadingImageView.topAnchor.constraint(equalTo: ballImageView.bottomAnchor, constant: 40).isActive = true
        loadingImageView.centerXAnchor.constraint(equalTo: mainContainerView.centerXAnchor).isActive = true
        loadingImageView.widthAnchor.constraint(equalTo: mainContainerView.widthAnchor, multiplier: 0.5).isActive = true
        loadingImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    
    
//MARK: - Configuration of User Interface
    
    private func configureUI() {
        
        screenImageView.image = UIImage(named: "backgroundLoading")
        screenImageView.contentMode = .scaleAspectFill
        
        ballImageView.image = UIImage(named: "ballImage")
        ballImageView.contentMode = .scaleAspectFit
        
        loadingImageView.image = UIImage(named: "loadingImage")
        loadingImageView.contentMode = .scaleAspectFit
    }
    
    
    
//MARK: - Animations
    
    private func loadingAnimation() {
        
        UIView.animate(withDuration: 1.5, delay: 0, options: [.autoreverse, .repeat]) {
            self.ballImageView.bounds.size = CGSize(width: 150, height: 150)
        }
    }
}
