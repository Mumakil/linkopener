//
//  SafariExtensionHandler.swift
//  Extension
//
//  Created by Otto Vehvilainen on 25/04/2017.
//  Copyright © 2017 Otto Vehvilainen. All rights reserved.
//

import SafariServices
import Cocoa

class SafariExtensionHandler: SFSafariExtensionHandler {
    
    override func messageReceived(withName messageName: String, from page: SFSafariPage, userInfo: [String : Any]?) {
        if (messageName == "linkClicked") {
            openURLWithUserInfo(userInfo: userInfo);
        }
    }
    
    override func contextMenuItemSelected(withCommand command: String,
                                          in page: SFSafariPage, userInfo: [String : Any]? = [:]) {
        if (command == "DefaultBrowser") {
            openURLWithUserInfo(userInfo: userInfo);
        }
    }

    
    override func popoverViewController() -> SFSafariExtensionViewController {
        return SafariExtensionViewController.shared
    }

    func openURLWithUserInfo(userInfo: [String : Any]?) {
        switch userInfo {
        case .none: break
        case .some(let uinfo):
            if let urlStr = uinfo["url"] as? String {
                if let url = URL(string: urlStr), NSWorkspace.shared().open(url) {
                    print("default browser was successfully opened")
                }
            }
        }
    }
}
