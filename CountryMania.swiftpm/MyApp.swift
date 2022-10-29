import SwiftUI


//Main method in which we create the state object selection and put it in as an environment object.
@main
struct MyApp: App {
    @StateObject var selection = Selection()
    var body: some Scene {
        
        WindowGroup {
            ContentView()
            .environmentObject(selection)
        
        }
    }
}

