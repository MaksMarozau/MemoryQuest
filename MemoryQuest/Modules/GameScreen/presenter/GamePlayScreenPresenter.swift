import UIKit

//MARK: - Protocol for expansion GamePlayScreenPresenter. Opening of other screens

protocol GamePlayScreenPresenterRoutingProtocol {
    
    func endOfTheGame()
    func openSettings()
}



//MARK: -

protocol GamePlayScreenPresenterHandlerProtocol {
    
    func addingExercise()
    func userWillAnswer()
    func tappRegister(by imageName: String)
}



//MARK: - Final class GamePlayScreenPresenter

final class GamePlayScreenPresenter {
    
    
//MARK: - Properties and init of class
    
    let router: GamePlayScreenRouterInputProtocol
    unowned let view: GamePlayScreenInputProtocol
    
    let model: GameModel
    
    private var score = 0
    
    
    init(router: GamePlayScreenRouterInputProtocol, view: GamePlayScreenInputProtocol, model: GameModel) {
        self.router = router
        self.view = view
        self.model = model
    }
}



//MARK: - Implemendation of the GamePlayScreenPresenterRoutingProtocol

extension GamePlayScreenPresenter: GamePlayScreenPresenterRoutingProtocol {
    
    func openSettings() {
        router.moveToSettingsScreen()
    }
    
    func endOfTheGame() {
        router.moveToWinScreen(with: score)
    }
}



//MARK: - Implemendation of the GamePlayScreenPresenterHandlerProtocol

extension GamePlayScreenPresenter: GamePlayScreenPresenterHandlerProtocol {
    
    func tappRegister(by imageName: String) {
        
        model.usersTapps.append(imageName)
        
        let isButton = model.checkButtonTapps()
        if isButton == false {
            model.lightingButtonsArray = []
            endOfTheGame()
        } else {
            score = score + 1
            view.updateScoreLabel(with: "\(score)")
        }
        
        let isCount = model.checkCountTapps()
        if isCount == true {
            model.nextRound()
            view.preparationForExersice(score)
            model.usersTapps = []
        }
    }
 
    
    func userWillAnswer() {
        model.usersTapps = []
    }
    
    
    func addingExercise() {
        model.lighting()
        let lightningButtonsImageNameArray = model.lightingButtonsArray
        self.view.lightning(with: lightningButtonsImageNameArray)
    }
}
