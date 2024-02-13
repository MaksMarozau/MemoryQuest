import UIKit

protocol LoadingScreenRouterInputProtocol {
    
}



final class LoadingScreenRouter {
    
    let navigationController: UINavigationController
    let window: UIWindow
    
    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
        
        let view = LoadingScreenView()
        let presenter = LoadingScreenPresenter(router: self)
        view.presenter = presenter
        
        navigationController.pushViewController(view, animated: true)
    }
    
    
}



extension LoadingScreenRouter: LoadingScreenRouterInputProtocol {
    
    
}
