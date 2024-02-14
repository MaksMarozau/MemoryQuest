import UIKit

//MARK: - Protocol for expansion YouWinScreenRouter to move to other screens

protocol YouWinScreenRouterInputProtocol {
    
    func moveToSettingsScreen()
    func moveToMenuScreen()
    func moveToGameScreen()
}



//MARK: - Final class YouWinScreenRouter

final class YouWinScreenRouter {
    
    let navigationController: UINavigationController
    let window: UIWindow
    
    let score: Int
    
    
//MARK: - Initialization of properties
    
    init(navigationController: UINavigationController, window: UIWindow, score: Int) {
        self.navigationController = navigationController
        self.window = window
        self.score = score
        
        
        //MARK: - Setting of dependencies
        
        let view = YouWinScreenView()
        let presenter = YouWinScreenPresenter(router: self, view: view, score: self.score)
        view.presenter = presenter
        
        navigationController.pushViewController(view, animated: true)
    }
}



//MARK: - Implemendation of the GamePlayScreenRouterInputProtocol

extension YouWinScreenRouter: YouWinScreenRouterInputProtocol {
    
    func moveToMenuScreen() {
        navigationController.popToRootViewController(animated: false)
        let clearNavigationController = UINavigationController()
        window.rootViewController = clearNavigationController
        let _ = MenuScreenRouter(navigationController: clearNavigationController, window: window)
    }
    
    func moveToGameScreen() {
        navigationController.popToRootViewController(animated: false)
        let clearNavigationController = UINavigationController()
        window.rootViewController = clearNavigationController
        let _ = GamePlayScreenRouter(navigationController: clearNavigationController, window: window)
    }
    
    func moveToSettingsScreen() {
        let _ = SettingsScreenRouter(navigationController: navigationController, window: window)
    }
}
