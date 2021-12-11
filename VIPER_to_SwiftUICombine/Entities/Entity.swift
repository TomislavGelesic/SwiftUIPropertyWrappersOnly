
import Foundation

public class Entity {
    @Published var ints: [Int]
    @Published var option: OptionType
    
    public init(ints: [Int] = .init(), option: OptionType = .none) {
        self.ints = ints
        self.option = option
    }
}

extension Entity: ObservableObject { }

