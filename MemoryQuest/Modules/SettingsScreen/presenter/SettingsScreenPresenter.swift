//MARK: - Protocol for expansion SettingsScreenPresenter.

protocol SettingsScreenPresenterProtocol {
    
    func back()
}



//MARK: - Final class SettingsScreenPresenter

final class SettingsScreenPresenter {
    
    
    //MARK: - Properties and init of class
    
    let router: SettingsScreenRouterInputProtocol
    
    init(router: SettingsScreenRouterInputProtocol) {
        self.router = router
    }
}



//MARK: - Implemendation of the LoadingScreenPresenterProtocol

extension SettingsScreenPresenter: SettingsScreenPresenterProtocol {
    
    func back() {
        router.moveBack()
    }
    
    
    
}

