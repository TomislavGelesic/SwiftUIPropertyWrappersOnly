
import Combine
import SwiftUI

class HomeViewPresenter: ObservableObject {
    
    private var interactor: Interactor
    private var cancellables: Set<AnyCancellable> = .init()
    
    @Published var ints: [Int] = .init()
    @Published var selection: SelectionType = .none
    
    init(interactor: Interactor) {
        self.interactor = interactor
        observe()
    }
    
    func observe() {
        interactor.model.$ints
            .assign(to: \.ints, on: self)
            .store(in: &cancellables)
        
        interactor.model.$selection
            .assign(to: \.selection, on: self)
            .store(in: &cancellables)
    }
}
