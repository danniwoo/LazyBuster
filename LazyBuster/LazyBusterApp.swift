//
//  LazyBusterApp.swift
//  LazyBuster
//
//  Created by Daniel on 19/01/2025.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth // sign-in
import GoogleSignIn

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    
//      // Enable debug logging
//      if let userDefaults = UserDefaults.standard.object(forKey: "FIRDebugEnabled") as? Bool, userDefaults {
//          print("Firebase debug logging enabled.")
//      } else {
//          UserDefaults.standard.set(true, forKey: "FIRDebugEnabled")
//      }
      
    FirebaseApp.configure()
//    Auth.auth().useEmulator(withHost:"localhost", port:9099)
      
      if let defaultApp = FirebaseApp.app() {
          print("Firebase successfully configured: \(defaultApp.name)")
      } else {
          print("Firebase configuration failed.")
      }

    return true
  }
    
    // Add this method to handle Google Sign-In callback
    func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
      return GIDSignIn.sharedInstance.handle(url)
    }
}


@main
struct LazyBusterApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            NavigationView { // for app delegate
                
                // ContentView() // <-- original code
                NavigationStack{
                    AuthenticationView() // <-- this is to test the login page
                }
                
            }
        }
    }
}
