//
//  PageOneViewModel.swift
//  TEST
//
//  Created by Steven Kirke on 20.03.2023.
//

import SwiftUI


class PageOneViewModel: ObservableObject {
    
    private var requestData: RequestData = RequestData()
    private var workUserDefaults: WorkUserDefaults = WorkUserDefaults()
    private var handlerUM: HandlerUserModel = HandlerUserModel()
    
    @Published var itemNenu: TypeSales = TypeSales.phone
    @Published var latestModels: LatestModel = LatestModel.init(latest: [])
    @Published var saleModels: Sale = Sale.init(flashSale: [])
    @Published var brandsModel: [BrandsModel] = []
    
    @Published var currentUser: UserModel?
    
    init() {
        self.getLatetData()
        self.getSaleData()
        self.getBrandsData()
        self.getCurrentUser()
    }
    
    func getCurrentUser() {
        guard let userDefault = workUserDefaults.writeUserDefault(model: currentUser) else {
            return
        }
        self.currentUser = userDefault
    }
    
    func getUserImage() -> Image {
        guard let user = currentUser else {
            return Image(systemName: "person")
        }
       return self.handlerUM.takePhoto(currentUser: user, currentData: nil)
    }
    
    func getLatetData() {
        self.requestData.getData(url: Urls.latest.rawValue, model: latestModels) { [weak self] data, err in
            if err != "" {
                //print("errors \(String(describing: err))")
            }
            guard let data = data else {
                return
            }
            guard let  self = self  else {
                return
            }
            self.latestModels = data
            if !self.latestModels.latest.isEmpty {
                self.getSaleData()
            }
            if !self.latestModels.latest.isEmpty {
                self.getBrandsData()
            }
        }
    }
    
    func getSaleData() {
        self.requestData.getData(url: Urls.sale.rawValue, model: saleModels) { [weak self] data, err in
            if err != "" {
                //print("errors \(String(describing: err))")
            }
            guard let data = data else {
                return
            }
            guard let  self = self  else {
                return
            }
            self.saleModels = data
        }
    }
    
    func getBrandsData() {
        self.requestData.getData(url: Urls.branch.rawValue, model: brandsModel) { [weak self] data, err in
            if err != "" {
                //print("errors \(String(describing: err))")
            }
            guard let data = data else {
                return
            }
            guard let  self = self  else {
                return
            }
            self.brandsModel = data
        }
    }
}
