//MARK: - Protocol for expansion GamePlayScreenPresenter.

protocol GamePlayScreenPresenterProtocol {
    
    func endOfTheGame()
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
    
    func endOfTheGame() {
        router.moveToWinScreen()
    }
}
