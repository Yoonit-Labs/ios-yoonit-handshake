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
import YoonitHandshake

class HandshakeViewController: UIViewController, HandshakeListener {
            
    @IBOutlet var updateFingerprintLabel: UILabel!
    
    private let publicKey: String = ""
    
    private let serviceUrl: String = ""
        
    override func viewDidLoad() {
        self.updateFingerprintLabel.sizeToFit()         
    }
    
    @IBAction func onUpdateFingerprint(_ sender: UIButton) {
        Handshake(
            publicKey: self.publicKey,
            serviceUrl: self.serviceUrl,
            handshakeListener: self
        ).updateFingerprints()
    }
    
    @IBAction func onUpdateFingeprintWithInvalidPublicKey(_ sender: UIButton) {
        Handshake(
            publicKey: self.publicKey,
            serviceUrl: self.serviceUrl,
            handshakeListener: self
        ).updateFingerprints()
    }
    
    func onResult(_ result: HandshakeResult) {
        switch result {
        case HandshakeResult.OK:
            self.updateFingerprintLabel.text = "- Everything is OK;\n- No Action is required."

        case HandshakeResult.STORE_IS_EMPTY:
            self.updateFingerprintLabel.text = "- The update request succeeded;\n- Result is still an empty list of certificates;\n- May loading & validating of remote data succeeded;\n- All loaded certificates are already expired;"

        case HandshakeResult.NETWORK_ERROR:
            self.updateFingerprintLabel.text = "- The update request failed on a network communication."

        case HandshakeResult.INVALID_DATA:
            self.updateFingerprintLabel.text = "The update request returned the data which did not pass the sifnature validation."

        case HandshakeResult.INVALID_SIGNATURE:
            self.updateFingerprintLabel.text = "The update request returned the data which did not pass the signature validation."
            
        case HandshakeResult.INVALID_URL_SERVICE:
            self.updateFingerprintLabel.text = "The url service does not exist or is invalid."
        }
    }
}
