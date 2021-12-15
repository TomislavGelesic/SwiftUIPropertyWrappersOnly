// Urheberrechtshinweis: Diese Software ist urheberrechtlich geschützt. Das Urheberrecht liegt bei
// Research Industrial Systems Engineering (RISE) Forschungs-, Entwicklungs- und Großprojektberatung GmbH,
// soweit nicht im Folgenden näher gekennzeichnet.

import Combine
import SwiftUI

class FinalViewPresenter {
    
    func handleEvent(event: FinalViewEvent, navigationControl: MainNavigationControl) {
        switch event {
        case .goToHomeView:
            navigationControl.destination = nil
        case .goBack:
            navigationControl.destination = .mediatorView
        case .update(let newOption, let data):
            data.intSelectionOption = newOption
            data.ints = getInts(for: newOption)
            
        }
    }
    public func getSelection(_ data: MainDataModel) -> String {
        data.intSelectionOption.rawValue
    }
    
    public func hasData(_ data: MainDataModel) -> Bool {
        return !data.ints.isEmpty
    }
    
    private func getInts(for selection: IntSelectionOption) -> [Int] {
        switch selection {
        case .none:
            return .init()
        case .one:
            return [1]
        case .two:
            return [2,2]
        case .three:
            return [3,3,3]
        }
    }
}
