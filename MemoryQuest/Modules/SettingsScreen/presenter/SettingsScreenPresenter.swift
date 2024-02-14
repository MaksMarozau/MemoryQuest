//MARK: - Protocol for expansion SettingsScreenPresenter.

protocol SettingsScreenPresenterProtocol {
    
    func back()
    
    func musicOff()
    func musicON()
    func vibroOff()
    func vibroOn()
    
    func loadSettings()
}



//MARK: - Final class SettingsScreenPresenter

final class SettingsScreenPresenter {
    
    
    //MARK: - Properties and init of class
    
    let router: SettingsScreenRouterInputProtocol
    unowned let view: SettingsScreenViewInputProtocol
    
    init(router: SettingsScreenRouterInputProtocol, view: SettingsScreenViewInputProtocol) {
        self.router = router
        self.view = view
    }
}



//MARK: - Implemendation of the LoadingScreenPresenterProtocol

extension SettingsScreenPresenter: SettingsScreenPresenterProtocol {
    
    func loadSettings() {
        let soundStatusResult = UserDefaultsManager.instance.loadSoundStatus()
        let vibroStatusResult = UserDefaultsManager.instance.loadVibroStatus()
        view.updateData(with: [soundStatusResult, vibroStatusResult])
    }
    
    func musicOff() {
        SoundManager.instance.sound(by: false)
        UserDefaultsManager.instance.saveSoundStatus(false)
    }
    
    func musicON() {
        SoundManager.instance.sound(by: true)
        UserDefaultsManager.instance.saveSoundStatus(true)
    }
    
    func vibroOff() {
        VibrationManager.instance.changeVibrationStatus(status: false)
        UserDefaultsManager.instance.saveVibroStatus(false)
    }
    
    func vibroOn() {
        VibrationManager.instance.changeVibrationStatus(status: true)
        UserDefaultsManager.instance.saveVibroStatus(true)
    }
    
    
    func back() {
        router.moveBack()
    }
}
