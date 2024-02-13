import UIKit

//MARK: - Protocol for expansion MenuScreenPresenter to move to another screen

protocol MenuScreenRouterInputProtocol {
    
    func moveToGameScreen()
    func moveToPrivacyPolicyScreen()
}



//MARK: - Final class

final class MenuScreenRouter {
    
    
//MARK: - Properties of class
    
    let navigationController: UINavigationController
    let window: UIWindow
    
    
//MARK: - Initialization of properties
    
    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
        
        
        //MARK: - Making of dependencies
        
        let view = MenuScreenView()
        let presenter = MenuScreenPresenter(router: self)
        view.presenter = presenter
        
        navigationController.pushViewController(view, animated: true)
    }
}



//MARK: - Implemendation of the MenuScreenRouterInputProtocol

extension MenuScreenRouter: MenuScreenRouterInputProtocol {
    
    func moveToPrivacyPolicyScreen() {
        
    }
    
    
    func moveToGameScreen() {
        
        let _ = GamePlayScreenRouter(navigationController: navigationController, window: window)
    }
}
