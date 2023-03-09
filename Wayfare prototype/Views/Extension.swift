//
//  Extension.swift
//  App name prototype
//
//  Created by Luigi Cirillo on 06/03/23.
//

import Foundation
import SwiftUI


extension View {
    
    @ViewBuilder
    func bottomSheet <Content: View>(
        presentationDetents: Set<PresentationDetent>,
        isPresented : Binding<Bool>,
        dragIndicator : Visibility = .visible,
        sheetCornerRadius : CGFloat?,
        largestUndimmedIdentifier : UISheetPresentationController.Detent.Identifier = .large,
        isTransparent : Bool = false,
        interactiveDisabled : Bool = true,
        @ViewBuilder content : @escaping ()->Content,
        onDismiss : @escaping ()->()
    )-> some View {
        self
            .sheet(isPresented: isPresented) {
                onDismiss()
            } content: {
                content()
                    .presentationDetents(presentationDetents)
                    .presentationDragIndicator(dragIndicator)
                    .interactiveDismissDisabled(interactiveDisabled)
                    .onAppear {
                        //finding the presentation view controller
                        guard let windows = UIApplication.shared.connectedScenes.first as?
                                UIWindowScene else {
                            return
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now()+1.0) {
                            // from this extracting presentation controller
                            if let controller = windows.windows.first?.rootViewController?
                                .presentedViewController, let sheet = controller.presentationController as? UISheetPresentationController {
                                
                                controller.presentingViewController?.view.tintAdjustmentMode = .normal
                                
                                sheet.largestUndimmedDetentIdentifier = largestUndimmedIdentifier
                                sheet.preferredCornerRadius = sheetCornerRadius
                            } else {
                                print("No controller Found")
                            }
                        }}
            }
    }
}
