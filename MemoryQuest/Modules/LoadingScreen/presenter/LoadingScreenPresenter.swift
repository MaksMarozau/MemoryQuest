//MARK: - Protocol for expansion LoadingScreenPresenter. Will be worked out when the loading process will be finished

protocol LoadingScreenPresenterProtocol {
    
    func loadingFinished()
}



//MARK: - Final class LoadingScreenPresenter

final class LoadingScreenPresenter {
    

//MARK: - Properties and init of class
    
    let router: LoadingScreenRouterInputProtocol
    
    init(router: LoadingScreenRouterInputProtocol) {
        self.router = router
    }
}



//MARK: - Implemendation of the LoadingScreenPresenterProtocol

extension LoadingScreenPresenter: LoadingScreenPresenterProtocol {
    
    func loadingFinished() {
        router.moveToMenuScreen()
    }
}
