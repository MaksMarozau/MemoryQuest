import Foundation

//MARK: - Protocol for expansion YouWinScreenPresenter. Methods of moving to other screens

protocol YouWinScreenPresenterProtocol {
    
    func openSettings()
    func openMenu()
    func restartTheGame()
    
    func loadData()
}



//MARK: - Final class YouWinScreenPresenter

final class YouWinScreenPresenter {
    
    
//MARK: - Properties and init of class
    
    let router: YouWinScreenRouterInputProtocol
    let view: YouWinScreenViewInputProtocol
    
    let currentScore: Int
    private var bestScore = 0
    
    init(router: YouWinScreenRouterInputProtocol, view: YouWinScreenViewInputProtocol, score: Int) {
        self.router = router
        self.view = view
        self.currentScore = score
    }
    
    private func loadingData() {
        let result: Int = UserDefaultsManager.instance.loadScore()
        bestScore = result
    }
    
    private func saveScore() {
        if currentScore > bestScore {
            UserDefaultsManager.instance.saveScore(with: currentScore)
        }
    }
    
    private func updateData() {
        view.updateScore(with: ["\(currentScore)", "\(bestScore)"])
    }
}



//MARK: - Implemendation of the YouWinScreenPresenterProtocol

extension YouWinScreenPresenter: YouWinScreenPresenterProtocol {
    
    func loadData() {
        loadingData()
        saveScore()
        updateData()
    }
    
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
