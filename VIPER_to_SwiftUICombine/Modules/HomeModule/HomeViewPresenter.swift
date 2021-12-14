
import Combine
import SwiftUI

class HomeViewPresenter {
    
    public func createInfoViewTitleText(from data: MainDataModel) -> String {
        "Selection \(calculateAdditionalText(from: data.intSelectionOption))"
    }
    
    public func createInfoViewDescriptionText(from data: MainDataModel) -> String {
        intsToString(data.ints) ?? ""
    }
    
    public func handleEvent(event: HomeViewEvent, state: MainState) {
        switch event {
        case .goToMediatorView:
            state.destination = .mediatorView
            state.sheetItem = nil
        case .goToMediatorViewFirstSheet:
            state.destination = .mediatorView
            state.sheetItem = .init(id: .mediatorSheetFirst)
        case .goToMediatorViewSecondSheet:
            state.destination = .mediatorView
            state.sheetItem = .init(id: .mediatorSheetSecond)
        case .dismissSheet(let sheetItem):
            if let sheetItem = sheetItem {
                switch sheetItem.id {
                case .mediatorSheetFirst:
                    state.destination = .mediatorView
                    state.sheetItem = .init(id: .mediatorSheetSecond)
                case .mediatorSheetSecond:
                    state.destination = .mediatorView
                    state.sheetItem = nil
                }
            } else {
                state.destination = .mediatorView
                state.sheetItem = sheetItem
            }
        }
    }
    
    private func intsToString(_ ints: [Int]) -> String? {
        if ints.isEmpty {
            return nil
        }
        let intStrings = ints.map { String($0) }
        var result: String = .init()
        result.append("Ints are: [ ")
        for string in intStrings {
            result.append(contentsOf: "\(string) ")
        }
        result.append("]")
        return result
    }
    
    private func calculateAdditionalText(from option: IntSelectionOption) -> String {
        option == .none ? "is: _?_?_" : "was: \(option.rawValue)"
    }
}
