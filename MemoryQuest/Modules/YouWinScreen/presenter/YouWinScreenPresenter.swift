//MARK: - Protocol for expansion YouWinScreenPresenter. Methods of moving to other screens

protocol YouWinScreenPresenterProtocol {
    
    func openSettings()
    func openMenu()
    func restartTheGame()
}



//MARK: - Final class YouWinScreenPresenter

final class YouWinScreenPresenter {
    
    
//MARK: - Properties and init of class
    
    let router: YouWinScreenRouterInputProtocol
    
    init(router: YouWinScreenRouterInputProtocol) {
        self.router = router
    }
}



//MARK: - Implemendation of the YouWinScreenPresenterProtocol

extension YouWinScreenPresenter: YouWinScreenPresenterProtocol {
    
    func openMenu() {
        router.moveToMenuScreen()
    }
    
    func restartTheGame() {
        router.moveToGameScreen()
    }
    
    func openSettings() {
        router.moveToSettingsScreen()
    }
}
