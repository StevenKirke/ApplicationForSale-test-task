//
//  HandlerUserModel.swift
//  TEST
//
//  Created by Steven Kirke on 29.03.2023.
//

import SwiftUI

class HandlerUserModel {
    
    func takePhoto(currentUser: UserModel, currentData: Data?) -> Image {
        if currentData == nil {
            guard let data = currentUser.data else {
                return answerPhoto(photo: currentUser.photo)
            }
            return convertImage(data: data)
        } else {
            guard let data = currentData else {
                return answerPhoto(photo: currentUser.photo)
            }
            return convertImage(data: data)
        }
    }
    
    private func answerPhoto(photo: String?) -> Image {
        guard let currentPhoto = photo else {
            return Image(systemName: "person")
        }
       return Image(currentPhoto)
    }
    
    private func convertImage(data: Data) -> Image {
        let image = UIImage(data: data) ?? UIImage()
        return Image(uiImage: image)
    }
    
}
