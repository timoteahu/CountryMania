import SwiftUI


//The ContentView here is just the main page of the application. It contains the globe picture, the name of the application, and the "buttons" used to access the other parts of the application.

struct ContentView: View {
    @EnvironmentObject var selection: Selection
    var body: some View {
        NavigationView {
            VStack {
                Image("globebubble")
                    .resizable()
                    .scaledToFit()
                    .offset(y: -70)
                
                Text("CountryMania")
                    .font(.largeTitle)
                    .bold()
                
                Spacer()
                HStack {
                    Spacer()
                    NavigationLink(destination: LearnSelectionView(choice: "Learn")) {
                        Text("Learn")
                            .padding()
                            .background(Color.green)
                            .foregroundColor(Color.black)
                            .font(.title)
                        
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationTitle("Back to Main Menu")
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Text("Main Menu")
                        }
                    }
                    Spacer()
                    NavigationLink(destination: PlaySelectionView(choice: "Play")) {
                        Text("Play")
                            .padding()
                            .background(Color.green)
                            .foregroundColor(Color.black)
                            .font(.title)
                        
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationTitle("Back to Main Menu")
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Text("Main Menu")
                        }
                    }
                    Spacer()
                }
                Spacer()
                
                NavigationLink(destination: InfoView()) {
                    Text("How to Play + Important Information")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(Color.black)
                        .font(.title)
                    
                }
            
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        
    }
    
}
