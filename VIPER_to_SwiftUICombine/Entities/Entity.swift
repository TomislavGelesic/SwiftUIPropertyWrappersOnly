
import Foundation

public class Entity {
    @Published var ints: [Int]
    @Published var selection: SelectionType
    
    public init(ints: [Int] = .init(), selection: SelectionType = .none) {
        self.ints = ints
        self.selection = selection
    }
}

extension Entity: ObservableObject { }

