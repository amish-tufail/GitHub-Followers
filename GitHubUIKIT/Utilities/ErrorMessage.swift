//
//  ErrorMessage.swift
//  GitHubUIKIT
//
//  Created by Amish on 02/07/2024.
//

import Foundation

enum GFError: String, Error {
    case invalidUsername = "This username created an invalid request. Please try again."
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid reponse from the server. Please try again"
    case invalidData = "The data recieved from the server was invalid. Please try again."
}
