//
//  ContentViewModel.swift
//  TEST
//
//  Created by Steven Kirke on 18.03.2023.
//

import Foundation


class ContentViewModel: ObservableObject {
    
    @Published var backInMenu: Bool = false
    @Published var itemNenu: CustomTabBar = CustomTabBar.pageOne

}
