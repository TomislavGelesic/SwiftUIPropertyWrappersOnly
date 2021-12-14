// Urheberrechtshinweis: Diese Software ist urheberrechtlich geschützt. Das Urheberrecht liegt bei
// Research Industrial Systems Engineering (RISE) Forschungs-, Entwicklungs- und Großprojektberatung GmbH,
// soweit nicht im Folgenden näher gekennzeichnet.

import SwiftUI

extension View {
    
    func navigationOverride(actionBack: @escaping () -> Void) -> some View {
        navigationBarBackButtonHidden(true)
            .navigationBarItems(
                leading: Button(action: actionBack) {
                    Image(systemName: "chevron.left")
                        .padding()
                })
    }
    
    func hiddenNavigationLink<TargetView: View>(_ view: TargetView) -> some View {
        background(
            ZStack {
                view
                self
            }
        )
    }
}
