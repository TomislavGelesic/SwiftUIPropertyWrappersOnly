
import Foundation

class MainDataModel: ObservableObject {
    
    @Published var ints: [Int] = .init()
    @Published var intSelectionOption: IntSelectionOption = .none
}
