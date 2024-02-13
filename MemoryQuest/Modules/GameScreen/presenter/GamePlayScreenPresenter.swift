//MARK: - Protocol for expansion GamePlayScreenPresenter.

protocol GamePlayScreenPresenterProtocol {
    
    func endOfTheGame()
    func openSettings()
}



//MARK: - Final class GamePlayScreenPresenter

final class GamePlayScreenPresenter {
    
    
//MARK: - Properties and init of class
    
    let router: GamePlayScreenRouterInputProtocol
    
    init(router: GamePlayScreenRouterInputProtocol) {
        self.router = router
    }
}



//MARK: - Implemendation of the GamePlayScreenPresenterProtocol

extension GamePlayScreenPresenter: GamePlayScreenPresenterProtocol {
    
    func openSettings() {
        router.moveToSettingsScreen()
    }
    
    
    func endOfTheGame() {
        router.moveToWinScreen()
    }
}
