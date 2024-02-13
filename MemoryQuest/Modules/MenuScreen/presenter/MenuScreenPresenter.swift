//MARK: - Protocol for expansion MenuScreenPresenter. Will be worked out when the loading process will be finished

protocol MenuScreenPresenterProtocol {
    
    
}



//MARK: - Final class MenuScreenPresenter

final class MenuScreenPresenter {
    
    
    //MARK: - Properties and init of class
    
    let router: MenuScreenRouterInputProtocol
    
    init(router: MenuScreenRouterInputProtocol) {
        self.router = router
    }
}



//MARK: - Implemendation of the LoadingScreenPresenterProtocol

extension MenuScreenPresenter: MenuScreenPresenterProtocol {
    
    
}

