// Urheberrechtshinweis: Diese Software ist urheberrechtlich geschützt. Das Urheberrecht liegt bei
// Research Industrial Systems Engineering (RISE) Forschungs-, Entwicklungs- und Großprojektberatung GmbH,
// soweit nicht im Folgenden näher gekennzeichnet.

import Combine
import SwiftUI

class FinalViewPresenter: ObservableObject {
    
    var interactor: Interactor
    var cancellables: Set<AnyCancellable> = .init()
    @Published var ints: [Int] = .init()
    @Published var option: OptionType = .none
    
    public init(interactor: Interactor) {
        self.interactor = interactor
        observe()
    }
    
    func select(_ selection: OptionType) {
        interactor.select(selection)
    }
    
    func getSelection() -> String {
        return option.rawValue
    }
}

extension FinalViewPresenter {
    func observe() {
        interactor.model.$ints
            .assign(to: \.ints, on: self)
            .store(in: &cancellables)
        
        interactor.model.$option
            .assign(to: \.option, on: self)
            .store(in: &cancellables)
    }
}
