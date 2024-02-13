//MARK: - Protocol for expansion MenuScreenPresenter. Processing click logic

protocol MenuScreenPresenterProtocol {
    
    func playNow()
    func openPrivacyPolicy()
}



//MARK: - Final class MenuScreenPresenter

final class MenuScreenPresenter {
    
    
    //MARK: - Properties and init of class
    
    let router: MenuScreenRouterInputProtocol
    
    init(router: MenuScreenRouterInputProtocol) {
        self.router = router
    }
}



//MARK: - Implemendation of the MenuScreenPresenterProtocol

extension MenuScreenPresenter: MenuScreenPresenterProtocol {
    
    func playNow() {
        router.moveToGameScreen()
    }
    
    
    func openPrivacyPolicy() {
        router.moveToPrivacyPolicyScreen()
    }
}
