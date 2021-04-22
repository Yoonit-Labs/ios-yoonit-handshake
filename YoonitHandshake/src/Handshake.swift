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

public class Handshake {    
    
    private var publicKey: String
    private var serviceURL: String
    private var handshakeListener: HandshakeListener
    
    public init(
        publicKey: String,
        serviceURL: String,
        handshakeListener: HandshakeListener
    ) {
        self.publicKey = publicKey
        self.serviceURL = serviceURL
        self.handshakeListener = handshakeListener
    }
        
    @objc
    public func updateFingerprints() {
        let configuration = CertStoreConfiguration(
            serviceUrl: URL(string: self.serviceURL)!,
            publicKey: self.publicKey
        )
        
        let certStore = CertStore.powerAuthCertStore(configuration: configuration)
        
        certStore.update { (result, error) in
            if result == .ok {
                self.handshakeListener.continueExecution()
                return
            }
                                              
            self.handshakeListener.handleFailedUpdate(
                result,
                error.debugDescription
            )
        }
    }
}
