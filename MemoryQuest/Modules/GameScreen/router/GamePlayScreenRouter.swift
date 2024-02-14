import UIKit

//MARK: - Protocol for expansion GamePlayScreenRouter to move to another screen

protocol GamePlayScreenRouterInputProtocol {
    
    func moveToWinScreen()
    func moveToSettingsScreen()
}



//MARK: - Final class GamePlayScreenRouter

final class GamePlayScreenRouter {
    
    let navigationController: UINavigationController
    let window: UIWindow
    
    
    //MARK: - Initialization of properties
    
    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
        
        
        //MARK: - Making of dependencies
        
        let view = GamePlayScreenView()
        let presenter = GamePlayScreenPresenter(router: self)
        view.presenter = presenter
        
        navigationController.pushViewController(view, animated: true)
    }
}



//MARK: - Implemendation of the GamePlayScreenRouterInputProtocol

extension GamePlayScreenRouter: GamePlayScreenRouterInputProtocol {
    
    func moveToSettingsScreen() {
        let _ = SettingsScreenRouter(navigationController: navigationController, window: window)
    }
    
    
    func moveToWinScreen() {
        navigationController.popToRootViewController(animated: false)
        let clearNavigationController = UINavigationController()
        window.rootViewController = clearNavigationController
        let _ = YouWinScreenRouter(navigationController: clearNavigationController, window: window)
    }
}

