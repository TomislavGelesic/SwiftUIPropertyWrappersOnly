// Urheberrechtshinweis: Diese Software ist urheberrechtlich geschützt. Das Urheberrecht liegt bei
// Research Industrial Systems Engineering (RISE) Forschungs-, Entwicklungs- und Großprojektberatung GmbH,
// soweit nicht im Folgenden näher gekennzeichnet.

import Foundation

public class Interactor: ObservableObject {
    
    var model: Entity
    
    public init(model: Entity = .init()) {
        self.model = model
    }
}

// DetailViewPresenter methods
public extension Interactor {
    func select(_ selection: SelectionType) {
        model.selection = selection
        switch selection {
        case .none:
            model.ints = .init()
        case .one:
            model.ints = [1]
        case .two:
            model.ints = [2,2]
        case .three:
            model.ints = [3,3,3]
        }
    }
}
