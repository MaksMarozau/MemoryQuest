import UIKit

final class VibrationManager {
    
    static let instance = VibrationManager(); private init() { }
    
    private var status: Bool = UserDefaultsManager.instance.loadVibroStatus()
    private let vibrationGenerator = UINotificationFeedbackGenerator()

    
    func changeVibrationStatus(status: Bool) {
        if status {
            self.status = true
        } else {
            self.status = false
        }
    }
    
    func vibro() {
        if self.status {
            vibrationGenerator.notificationOccurred(.success)
        }
    }
}
