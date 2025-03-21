//
//  WeatherErrorHandler.swift
//  Weather_Tracker
//
//  Created by agmcoder on 3/21/25.
//


struct WeatherErrorHandler {
    func handleClientError(code: String) throws {
        switch code {
        case "1003":
            throw WeatherServiceError.missingParameter(message: "Parameter 'q' not provided.")
        case "1005":
            throw WeatherServiceError.invalidRequestURL(message: "API request URL is invalid.")
        case "1006":
            throw WeatherServiceError.locationNotFound(message: "No location found matching parameter 'q'.")
        case "9000":
            throw WeatherServiceError.invalidJson(message: "Json body passed in bulk request is invalid.")
        case "9001":
            throw WeatherServiceError.tooManyLocations(message: "Json body contains too many locations for bulk request.")
        case "9999":
            throw WeatherServiceError.internalServerError(message: "Internal application error.")
        default:
            throw WeatherServiceError.unknownError(message: "Unknown client error.")
        }
    }

    func handleAuthenticationError(code: String) throws {
        switch code {
        case "1002":
            throw WeatherServiceError.apiKeyNotProvided(message: "API key not provided.")
        case "2006":
            throw WeatherServiceError.invalidApiKey(message: "API key provided is invalid.")
        default:
            throw WeatherServiceError.unknownError(message: "Unknown authentication error.")
        }
    }

    func handleAccessError(code: String) throws {
        switch code {
        case "2007":
            throw WeatherServiceError.quotaExceeded(message: "API key has exceeded calls per month quota.")
        case "2008":
            throw WeatherServiceError.apiKeyDisabled(message: "API key has been disabled.")
        case "2009":
            throw WeatherServiceError.accessDenied(message: "API key does not have access to the resource.")
        default:
            throw WeatherServiceError.unknownError(message: "Unknown access error.")
        }
    }
}