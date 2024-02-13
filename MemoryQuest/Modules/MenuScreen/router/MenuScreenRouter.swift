import UIKit

protocol MenuScreenRouterInputProtocol {
    
    func moveToGameScreen()
}



final class MenuScreenRouter {
    
    let navigationController: UINavigationController
    let window: UIWindow
    
    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
        
        let view = MenuScreenView()
        let presenter = MenuScreenPresenter(router: self)
        view.presenter = presenter
        
        navigationController.pushViewController(view, animated: true)
    }
}



extension MenuScreenRouter: MenuScreenRouterInputProtocol {
    
    func moveToGameScreen() {
        
    }
}

