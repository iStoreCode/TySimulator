//
//  NSApplication+TySimulator.swift
//  TySimulator
//
//  Created by luckytianyiyan on 2016/11/15.
//  Copyright © 2016年 luckytianyiyan. All rights reserved.
//

import Cocoa
import HockeySDK

extension NSApplication {
    func showFeedbackWindow() {
        DevMateKit.showFeedbackDialog(nil, in: .modalMode)
    }
    
    func showPreferencesWindow() {
        let windowController = Preference.sharedWindowController()
        windowController.select(at: 0)
        windowController.showWindow(nil)
        NSApp.activate(ignoringOtherApps: true)
    }
    
    func showAboutWindow() {
        NSApp.orderFrontStandardAboutPanel(nil)
        NSApp.activate(ignoringOtherApps: true)
    }
    
    func checkForUpdates() {
        DM_SUUpdater.shared().checkForUpdates(NSApp)
    }
    
    public class func toggleDockIcon(showIcon state: Bool) -> Bool {
        var result: Bool
        if state {
            result = NSApp.setActivationPolicy(NSApplicationActivationPolicy.regular)
        } else {
            result = NSApp.setActivationPolicy(NSApplicationActivationPolicy.accessory)
        }
        return result
    }
    
    public class func activate() -> Bool {
        var error: Int = DMKevlarError.testError.rawValue
        return _my_secret_activation_check!(&error).boolValue || DMKevlarError.noError == DMKevlarError(rawValue: error)
    }
    
}
