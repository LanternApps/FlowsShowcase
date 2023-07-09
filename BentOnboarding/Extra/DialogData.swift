//
//  DialogData.swift
//  BentOnboarding
//
//  Created by Vivienne Fosh on 09.07.2023.
//

import Foundation

struct ConfirmationDialogData {
    struct Action {
        var title: String
        var action: () -> ()
    }
    var title: String
    var message: String?
    var actions: [Action]
}
