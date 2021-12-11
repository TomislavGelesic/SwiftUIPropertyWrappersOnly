
import Combine
import SwiftUI

class HomeViewPresenter: ObservableObject {
    
    private var interactor: Interactor
    private var cancellables: Set<AnyCancellable> = .init()
    
    @Published var ints: [Int] = .init()
    @Published var option: OptionType = .none
    
    init(interactor: Interactor) {
        self.interactor = interactor
        observe()
    }
    
    func observe() {
        interactor.model.$ints
            .assign(to: \.ints, on: self)
            .store(in: &cancellables)
        
        interactor.model.$option
            .assign(to: \.option, on: self)
            .store(in: &cancellables)
    }
}
