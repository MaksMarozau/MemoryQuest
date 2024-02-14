import UIKit
import AVFoundation

final class SoundManager {
    
    static let instance = SoundManager(); private init() { }
    
    private var player = AVAudioPlayer()
    
    
    func sound(by status: Bool) {
        if status {
            guard let musicPath = Bundle.main.url(forResource: "backgroundSound", withExtension: "mp3") else { return }
            player = try! AVAudioPlayer(contentsOf: musicPath, fileTypeHint: nil)
            player.currentTime = 0
            player.numberOfLoops = -1
            player.volume = 0.5
            player.play()
        } else {
            player.stop()
        }
    }
}
