//
//  PageTwoViewModel.swift
//  TEST
//
//  Created by Steven Kirke on 23.03.2023.
//

import Foundation


class PageTwoViewModel: ObservableObject {
    
    private var workUserDefaults: WorkUserDefaults = WorkUserDefaults()
    private var workToNumber: WorkToNumber = WorkToNumber()
    private var requestData: RequestData = RequestData()
    
    @Published var descriptionModels: Description?
    @Published var blockImage: [ImageDescription] = []
    @Published var currentUser: UserModel?
    @Published var balance: String = ""
    
    var currentBalance: Double = 0.0
    
    @Published var step:  Double = 0.0
    
    func getDescriptionData(returnImages: @escaping ([String]) -> Void) {
        var tempImage: [String] = []
        requestData.getData(url: Urls.description.rawValue, model: descriptionModels) { [weak self] data, error in
            if error != "" {
                print("errors \(String(describing: error))")
            }
            guard let data = data else {
                return
            }
            guard let  self = self  else {
                return
            }
            self.descriptionModels = data

            guard let images = self.descriptionModels?.imageUrls else {
                return
            }
            tempImage = images
            return returnImages(tempImage)
        }
    }
    
    func calculateImage(images: [String]) -> [ImageDescription] {
        var tempBlockImages: [ImageDescription] = []
        for (_, elem) in images.enumerated() {
            tempBlockImages.append(ImageDescription(image: elem))
        }
        return tempBlockImages
    }
    
    func getCurrentUser() {
        guard let userDefault = workUserDefaults.writeUserDefault(model: currentUser) else {
            return
        }
        self.currentUser = userDefault
        guard let tempBalance = userDefault?.balance else {
            return
        }
        self.currentBalance = tempBalance
        self.balance = workToNumber.forTrailingZero(number: tempBalance)
    }
    
    func addProduct() {
        let total = self.currentBalance - currentPrice()
        self.currentBalance = total
        self.balance = workToNumber.forTrailingZero(number: total)
    }
    
    func removeProduct() {
        guard let balance = currentUser?.balance else {
            return
        }
        let total = self.currentBalance + currentPrice()
        if total >= balance {
            return
        }
        self.currentBalance = total
        self.balance = workToNumber.forTrailingZero(number: total)
    }
    
    func currentPrice() -> Double {
        guard let currentPrice = descriptionModels?.price else {
           print("Error price")
            return 0.0
        }
        return currentPrice
    }
    
    
    func saveUserBalance() {
        self.currentUser?.balance = self.currentBalance
        workUserDefaults.saveUserDefault(currentUser: currentUser)
    }
    
}
