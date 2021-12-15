
import Combine
import SwiftUI

class HomeViewPresenter {
    
    public func createInfoViewTitleText(from data: MainDataModel) -> String {
        "Selection \(calculateAdditionalText(from: data.intSelectionOption))"
    }
    
    public func createInfoViewDescriptionText(from data: MainDataModel) -> String {
        intsToString(data.ints) ?? ""
    }
    
    func handleEvent(event: HomeViewEvent, navigationControl: MainNavigationControl, sheetControl: MainSheetControl) {
        switch event {
        case .goToMediatorView:
            navigationControl.destination = .mediatorView
            sheetControl.sheetItem = nil
        case .goToMediatorViewFirstSheet:
            navigationControl.destination = .mediatorView
            sheetControl.sheetItem = .init(id: .mediatorSheetFirst)
        case .goToMediatorViewSecondSheet:
            navigationControl.destination = .mediatorView
            sheetControl.sheetItem = .init(id: .mediatorSheetSecond)
        case .dismissSheet(let sheetItem):
            if let sheetItem = sheetItem {
                switch sheetItem.id {
                case .mediatorSheetFirst:
                    navigationControl.destination = .mediatorView
                    sheetControl.sheetItem = .init(id: .mediatorSheetSecond)
                case .mediatorSheetSecond:
                    navigationControl.destination = .mediatorView
                    sheetControl.sheetItem = nil
                }
            } else {
                navigationControl.destination = .mediatorView
                sheetControl.sheetItem = sheetItem
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
