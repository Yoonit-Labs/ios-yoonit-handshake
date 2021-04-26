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
public enum HandshakeResult: Int {
    /**
     Update succeeded
     */
    case OK = 0
    
    /**
     The update request succeeded, but the result is still an empty list of certificates.
     This may happen when the loading & validating of remote data succeeded, but all loaded
     certificates are already expired.
     */
    case STORE_IS_EMPTY = 1
    
    /**
     The update request failed on a network communication.
     */
    case NETWORK_ERROR = 2
    
    /**
     The update request returned an invalid data from the server.
     */
    case INVALID_DATA = 3
    
    /**
     The update request returned the data which did not pass the signature validation.
    */
    case INVALID_SIGNATURE = 4
    
    /**
     The url service does not exist or is invalid.
     */
    case INVALID_URL_SERVICE = 5
}
