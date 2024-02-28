//
//  ErrorMessage.swift
//  MyGitHubFollowers
//
//  Created by yucian huang on 2024/2/27.
//

import Foundation

enum GFError: String, Error {
    case invalidUsername     = "This username created an invalid request. Please try again."
    case unableToComplete    = "Unable to complete your request. Please check your internet connection."
    case invalidResponse     = "Invalid response from the server. Please try again."
    case invalidData         = "The data received from the server was invalid. Please try again."
}


// rawValue -> String, after this we can use it as Result : FAILURE, SUCCESS in our networkManager.
