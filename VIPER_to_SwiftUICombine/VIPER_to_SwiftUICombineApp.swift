// Urheberrechtshinweis: Diese Software ist urheberrechtlich geschützt. Das Urheberrecht liegt bei
// Research Industrial Systems Engineering (RISE) Forschungs-, Entwicklungs- und Großprojektberatung GmbH,
// soweit nicht im Folgenden näher gekennzeichnet.

import SwiftUI

@main
struct VIPER_to_SwiftUICombineApp: App {
    
    // Name [Entity] type similar to feature name, to avoid integration issues/overlaps in naming.
    // Wrap [Entity] property with @StateObject to ensure it has source of truth in integrator.
    // Populate [Entity] upon creating, upon starting feature.
    @StateObject private var model: Entity = .init()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                // Add feature to integrators navigation stack.
                HomeView(presenter: HomeViewPresenter(interactor: Interactor(model: model)))
                // Pass [Entity] to feature environment (create interactors upon creating presenters).
                    .environmentObject(model)
            }
        }
    }
}

#warning("README")

/**
 $$ GOAL $$
 
 - This app presents few examples for common patterns using purer (from authors experience) SwiftUI code.
 
 
 $$ LITERATURE $$

   1)    https://www.appypie.com/pass-data-between-views-swiftui-how-to
   2)    https://www.hackingwithswift.com/articles/216/complete-guide-to-navigationview-in-swiftui
   3)    https://www.raywenderlich.com/8440907-getting-started-with-the-viper-architecture-pattern#toc-anchor-004
 
 
 $$  MVVM vs VIPER  $$
 
 -> [Viper] is used for additional separation of concerns, in most of the most cases not needed in modern mobile app development!
 -> [Mvvm] separation should suffice in most of nowadays mobile app screens/features - which are  lightweight, modular, recyclable.
 - Happy to hear arguments against these thoughts/statements - will argue back and change my opinion if yours arguments are stronger/better :)
 
 
 $$  VIPER  $$
 
 - [Router]  is implementation of principle - inversion of control, knows how to create each [View] with everything needed for that [View] to live happily.
 
 - [Entity] is object containing/wrapping/uniting all variables.
 - Multiple entities enable syntacticall /  logic separation of concerns.
 
 - [Interactor] is point of interaction for various presenters to handle user interaction with app/feature.
 - Multiple interactors enable syntacticall / logical separation of concerns (preceeded by multiple Entity instances).
 
 - [Presenter] is instance, wrapped in @ObservableObject that triggers UI changes.
 - Multiple presenters enable syntactically / logical separation of concerns (for each [View] where [View] is lowest hierarchical UI unit we want to control dinamically in feature).
 
 - [View] is lowest hierarchical UI unit (e.g. SwiftUI View subview) we want to control dinamically in feature.
 - Multiple views, well, you get that part by now hopefully.
 - Multiple views, all passive UI elements, are grouped in (theirs) parent [View] which is controlled by respective [Presenter] instance.
 
 
 $$  EXAMPLES  $$
 
 -> 1) navigation flow  ⎻ \
                  | ---> - Navigation flow with passing data forw-backw in setup StartView-MediatorView-FinalView.
                  |        - In which data is presented on StartView and changed in FinalView.
                  |        - MediatorView and FinalView are dismissed withouth transitions between.
 -> 2) passing data     _ |
 
 -> 3) data presented on MediatorView is always re-rendered (core paradigm of and goal of usage of SwiftUI) but data is consistent because it comes from @Environment instance
 
 
 
 */