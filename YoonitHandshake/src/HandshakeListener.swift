//
// +-+-+-+-+-+-+
// |y|o|o|n|i|t|
// +-+-+-+-+-+-+
//
// +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
// | Yoonit Handshake lib for iOS applications                       |
// | Haroldo Teruya @ Yoonit-Labs 2021                               |
// +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
//

import Foundation

@objc
public protocol HandshakeListener {

    func continueExecution()

    func handleFailedUpdate(
        _ type: Int,
        _ error: String
    )
}
