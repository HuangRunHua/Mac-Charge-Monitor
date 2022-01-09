//
//  Mac_Charge_MonitorApp.swift
//  Mac Charge Monitor
//
//  Created by Runhua Huang on 2022/1/9.
//

import SwiftUI
import Combine

@main
struct Mac_Charge_MonitorApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        // Use following code to hide main window
        // and only show menu bar view
        Settings {
            MenuView()
        }
//        WindowGroup {
//            ContentView()
//        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    
    var statusItem: NSStatusItem?
    
    var popOver = NSPopover()
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        // Menu View
        let menuView = MenuView()
        
        // Create PopOver
        popOver.behavior = .transient
        popOver.animates = true
        popOver.setValue(true, forKeyPath: "shouldHideAnchor")
        popOver.contentSize = NSSize(width: 300, height: 300)
        
        
        // Setting Empty View Controller
        // And Setting View as SwiftUI View
        // with the help of Hosting Controller
        popOver.contentViewController = NSViewController()
        popOver.contentViewController?.view = NSHostingView(rootView: menuView)
        
        // Make View as Main View
        popOver.contentViewController?.view.window?.makeKey()
        
        // Create Status Bar Button
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        if let MenuButton = statusItem?.button {
            MenuButton.image = NSImage(systemSymbolName: "laptopcomputer", accessibilityDescription: nil)
            MenuButton.action = #selector(MenuButtonToggle)
        }
        
    }
    
    @objc func MenuButtonToggle(sender: AnyObject) {
        if popOver.isShown {
            popOver.performClose(sender)
        }
        else {
            // Show PopOver
            if let menuButton = statusItem?.button {
                // Top Get Button Location for PopOver
                self.popOver.show(relativeTo: menuButton.bounds, of: menuButton, preferredEdge: .minY)
            }
        }
    }
    
}




