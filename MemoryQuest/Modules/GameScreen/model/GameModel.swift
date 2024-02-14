
final class GameModel {
    
    private var round = 1
    private var count: Int = 0

    private var lightingButton: LightingButtons = .none
    
    var lightingButtonsArray: [String] = []
    var usersTapps: [String] = []

    func lighting() {
        if count < round {
            let randomNumber = Int.random(in: 1...4)
            switch randomNumber {
            case 1:
                lightingButton = .top
                lightingButtonsArray.append(lightingButton.rawValue)
                count = lightingButtonsArray.count
            case 2:
                lightingButton = .left
                lightingButtonsArray.append(lightingButton.rawValue)
                count = lightingButtonsArray.count
            case 3:
                lightingButton = .bot
                lightingButtonsArray.append(lightingButton.rawValue)
                count = lightingButtonsArray.count
            case 4:
                lightingButton = .right
                lightingButtonsArray.append(lightingButton.rawValue)
                count = lightingButtonsArray.count
            default:
                break
            }
        }
    }
    
    
    func checkButtonTapps() -> Bool {
        var isEquill: Bool = true
        let index = usersTapps.count - 1
        if usersTapps.last == lightingButtonsArray[index] {
            isEquill = true
        } else {
            isEquill = false
        }
        return isEquill
    }
    
    
    func checkCountTapps() -> Bool {
        var isEquill: Bool = false
        if usersTapps.count < lightingButtonsArray.count {
            isEquill = false
        } else {
            isEquill = true
        }
        return isEquill
    }
    
    
    func nextRound() {
        round = round + 1
    }
}



extension GameModel {
    
    private enum LightingButtons: String {
        case none = "ballOff"
        case all = "ballFull"
        case top = "ballTop"
        case left = "ballLeft"
        case bot = "ballBot"
        case right = "ballRight"
    }
}
