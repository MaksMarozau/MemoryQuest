import UIKit

//MARK: - Protocol for expansion SettingsScreenRouter to move to another screen

protocol SettingsScreenRouterInputProtocol {
    
}



//MARK: - Final class SettingsScreenRouter

final class SettingsScreenRouter {
    
    let navigationController: UINavigationController
    let window: UIWindow
    
    
    //MARK: - Initialization of properties
    
    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
        
        
        //MARK: - Making of dependencies
        
        let view = SettingsScreenView()
        let presenter = SettingsScreenPresenter(router: self)
        view.presenter = presenter
        
        navigationController.pushViewController(view, animated: true)
    }
}



//MARK: - Implemendation of the SettingsScreenRouterInputProtocol

extension SettingsScreenRouter: SettingsScreenRouterInputProtocol {
    
    func moveToMenuScreen() {
        navigationController.popToRootViewController(animated: false)
        let clearNavigationController = UINavigationController()
        window.rootViewController = clearNavigationController
        let _ =
    }
}

