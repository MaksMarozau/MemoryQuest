import Foundation

final class UserDefaultsManager {
    
    static let instance = UserDefaultsManager(); private init() { }
    
    
    func saveScore(with value: Int) {
        UserDefaults.standard.set(value, forKey: "bestScore")
    }
    
    func loadScore() -> Int {
        let result = UserDefaults.standard.integer(forKey: "bestScore")
        return result
    }
    
    func saveSoundStatus(_ status: Bool) {
        UserDefaults.standard.set(status, forKey: "soundStatus")
    }
    
    func loadSoundStatus() -> Bool {
        let result = UserDefaults.standard.bool(forKey: "soundStatus")
        return result
    }
    
    func saveVibroStatus(_ status: Bool) {
        UserDefaults.standard.set(status, forKey: "vibroStatus")
    }
    
    func loadVibroStatus() -> Bool {
        let result = UserDefaults.standard.bool(forKey: "vibroStatus")
        return result
    }
    
    func saveAppFlag() {
        UserDefaults.standard.set(1, forKey: "appFlag")
    }
    
    func loadAppFlag() -> Int {
        let result = UserDefaults.standard.integer(forKey: "appFlag")
        return result
    }
}
