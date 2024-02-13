protocol LoadingScreenPresenterProtocol {
    
    
}



final class LoadingScreenPresenter {
    
    let router: LoadingScreenRouterInputProtocol
    
    init(router: LoadingScreenRouterInputProtocol) {
        self.router = router
    }
}


extension LoadingScreenPresenter: LoadingScreenPresenterProtocol{
    
    
}
