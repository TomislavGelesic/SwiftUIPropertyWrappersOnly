
import Foundation

// Minimal data needed for feature to operate successfully
class MainDataModel: ObservableObject {
    
    @Published var ints: [Int] = .init() // unnecessary - could be recreated in HomeView from 'IntSelectionOption'
    @Published var intSelectionOption: IntSelectionOption = .none
}
