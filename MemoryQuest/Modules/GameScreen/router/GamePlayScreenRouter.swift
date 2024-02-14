import UIKit

//MARK: - Protocol for expansion GamePlayScreenRouter to move to another screen

protocol GamePlayScreenRouterInputProtocol {
    
    func moveToWinScreen(with score: Int)
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
        let model = GameModel()
        let presenter = GamePlayScreenPresenter(router: self, view: view, model: model)
        view.presenterRouting = presenter
        view.presenterHandler = presenter
        
        navigationController.pushViewController(view, animated: true)
    }
}



//MARK: - Implemendation of the GamePlayScreenRouterInputProtocol

extension GamePlayScreenRouter: GamePlayScreenRouterInputProtocol {
    
    func moveToSettingsScreen() {
        let _ = SettingsScreenRouter(navigationController: navigationController, window: window)
    }
    
    
    func moveToWinScreen(with score: Int) {
        navigationController.popToRootViewController(animated: false)
        let clearNavigationController = UINavigationController()
        window.rootViewController = clearNavigationController
        let _ = YouWinScreenRouter(navigationController: clearNavigationController, window: window, score: score)
    }
}

