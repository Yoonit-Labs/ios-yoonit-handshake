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

import UIKit
import WultraSSLPinning

@objc
public class Handshake: NSObject {
    
    @objc
    public var handshakeListener: HandshakeListener?
            
    @objc
    public func updateFingerprints(
        _ publicKey: String,
        _ serviceUrl: String
    ) {
        var certStore: CertStore? = nil
        
        if let url = URL(string: serviceUrl) {
            let configuration = CertStoreConfiguration(
                serviceUrl: url,
                publicKey: publicKey
            )

            certStore = CertStore.powerAuthCertStore(configuration: configuration)
        } else {
            self.handshakeListener?.onResult(HandshakeResult.INVALID_URL_SERVICE)
        }
        
        certStore?.update { (result, error) in
            switch result {
            case .ok:
                self.handshakeListener?.onResult(HandshakeResult.OK)
                
            case .storeIsEmpty:
                self.handshakeListener?.onResult(HandshakeResult.STORE_IS_EMPTY)
                
            case .networkError:
                self.handshakeListener?.onResult(HandshakeResult.NETWORK_ERROR)
                
            case .invalidData:
                self.handshakeListener?.onResult(HandshakeResult.INVALID_DATA)
                
            case .invalidSignature:
                self.handshakeListener?.onResult(HandshakeResult.INVALID_SIGNATURE)            
            }
        }
    }
}
