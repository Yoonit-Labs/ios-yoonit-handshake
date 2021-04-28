# ios-yoonit-handshake

A iOS Cocoa project written in Swift implementing dynamic SSL pinning.

* [About](#about)
* [Installation](#installation)
* [Usage](#usage)
* [API](#api)
  * [Method](#method)
  * [Event](#event)
  * [Handshake Result](#handshake-result)
* [To contribute and make it better](#to-contribute-and-make-it-better)

## About

The SSL pinning is a technique mitigating man-in-the-middle attacks against the secure HTTP communication, but has a drawback, the certificate's expiration date. This resolve this problem, implementing dynamic SSL pinning, providing easy to use fingerprint validation on the TLS handshake. The remote server must be the responsible to update the certificate(s).

## Installation

```
target '<Your Target App>' do
  pod 'YoonitHandshake'
end
```

> ### Special thanks and credits...
> The current version of the library depends on `[Wultra SSL Pinning]`(https://github.com/wultra/ssl-pinning-ios)

## Usage

First, in the `Development.xcconfig`, insert the `SERVICE_URL` and `PUBLIC_KEY` values. 

```swift
import UIKit
import YoonitHandshake

class HandshakeViewController: HandshakeListener {
                        
    private var handshake = Handshake()
                        
    func updateFingerprints() {
        self.handshake.handshakeListener = self
        self.handshake.updateFingerprints(
            "YOUR PUBLIC KEY",
            "YOUR SERVICE URL"
        )
    }
        
    func onResult(_ result: HandshakeResult) {
        switch result {
        case HandshakeResult.OK:
            // - Everything is OK;
            // - No Action is required;

        case HandshakeResult.STORE_IS_EMPTY:
            // - The update request succeeded;
            // - Result is still an empty list of certificates;
            // - May loading & validating of remote data succeeded;
            // - All loaded certificates are already expired;"

        case HandshakeResult.NETWORK_ERROR:
            // - The update request failed on a network communication.

        case HandshakeResult.INVALID_DATA:
            // The update request returned the data which did not pass the signature validation.

        case HandshakeResult.INVALID_SIGNATURE:
            // The update request returned the data which did not pass the signature validation.
            
        case HandshakeResult.INVALID_URL_SERVICE:
            // The url service does not exist or is invalid.
        }
    }
}
```

## API

### Method

| Function                | Parameters                                             | Description
| -                            | -                                                               | -
| updateFingerprint | `publicKey: String, serviceUrl`  | Update the list of fingerprints from the remote server. The method is asynchronous. Response can get in the `HandshakeListener` interface.

### Event

| Event      | Parameters                                 | Description
| -              | -                                                  | -
| onResult | `result: HandshakeResult` | The update fingerprint request result.

### Handshake Result

| HandshakeResult            | Description
| -                                       | -
| OK                                   | <ul><li>Everything is OK;</li><li>No Action is required;</li></ul>
| STORE_IS_EMPTY         | <ul><li>The update request succeeded;</li><li>Result is still an empty list of certificates;</li><li>May loading & validating of remote data succeeded;</li><li>All loaded certificates are already expired;</li><li>All loaded certificates are already expired;</li></ul>
| NETWORK_ERROR        | The update request failed on a network communication. 
| INVALID_DATA                | The update request returned the data which did not pass the signature validation.
| INVALID_SIGNATURE     | The update request returned the data which did not pass the signature validation.
| INVALID_URL_SERVICE | The url service does not exist or is invalid.

## To contribute and make it better

Clone the repo, change what you want and send PR.

For commit messages we use <a href="https://www.conventionalcommits.org/">Conventional Commits</a>.

Contributions are always welcome!

<a href="https://github.com/Yoonit-Labs/ios-yoonit-handshake/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=Yoonit-Labs/ios-yoonit-handshake" />
</a>

---

Code with ❤ by the [**Cyberlabs AI**](https://cyberlabs.ai/) Front-End Team
