//
//  LaureateData.swift
//  NobelLaureatesApp
//
//  Created by Alikhan Gubayev on 12.05.2023.
//

import Foundation

// MARK: - Laureate
struct LaureateData: Codable {
    let laureates: [LaureateElement]
    let links: Links
}

// MARK: - LaureateElement
struct LaureateElement: Codable {
    let id: String
    let knownName, givenName, familyName, fullName: Name
    let fileName: String
    let gender: Gender
    let birth: Birth
    let wikipedia: Wikipedia
    let wikidata: Wikidata
    let sameAs: [String]
    let links: [Link]
    let nobelPrizes: [NobelPrize]
    let death: Death?
}

// MARK: - Birth
struct Birth: Codable {
    let date: String
    let place: Place?
}

// MARK: - Place
struct Place: Codable {
    let city, country, cityNow, countryNow: City?
    let continent: City?
    let locationString: City
}

// MARK: - City
struct City: Codable {
    let en: String
    let no, se: String?
}

// MARK: - Death
struct Death: Codable {
    let date: String
    let place: Place
}

// MARK: - Name
struct Name: Codable {
    let en, se: String
}

enum Gender: String, Codable {
    case female = "female"
    case male = "male"
}

// MARK: - Link
struct Link: Codable {
    let rel: Rel
    let href: String
    let action: Action
    let types: Types
    let title: String?
    let linkClass: [Class]?

    enum CodingKeys: String, CodingKey {
        case rel, href, action, types, title
        case linkClass = "class"
    }
}

enum Action: String, Codable {
    case actionGET = "GET"
}

enum Class: String, Codable {
    case laureateFacts = "laureate facts"
    case prizeSummary = "prize summary"
}

enum Rel: String, Codable {
    case external = "external"
    case laureate = "laureate"
    case nobelPrize = "nobelPrize"
}

enum Types: String, Codable {
    case applicationJSON = "application/json"
    case textHTML = "text/html"
}

// MARK: - NobelPrize
struct NobelPrize: Codable {
    let awardYear: String
    let category, categoryFullName: City
    let sortOrder, portion: String
    let dateAwarded: String?
    let prizeStatus: PrizeStatus
    let motivation: City
    let prizeAmount, prizeAmountAdjusted: Int
    let affiliations: [Affiliation]?
    let links: [Link]
    let residences: [Residence]?
}

// MARK: - Affiliation
struct Affiliation: Codable {
    let name: City
    let nameNow: NameNow
    let city, country, cityNow, countryNow: City
    let locationString: City
}

// MARK: - NameNow
struct NameNow: Codable {
    let en: String
}

enum PrizeStatus: String, Codable {
    case received = "received"
}

// MARK: - Residence
struct Residence: Codable {
    let country, countryNow, locationString: City
}

// MARK: - Wikidata
struct Wikidata: Codable {
    let id: String
    let url: String
}

// MARK: - Wikipedia
struct Wikipedia: Codable {
    let slug: String
    let english: String
}

// MARK: - Links
struct Links: Codable {
    let first, linksSelf, next, last: String

    enum CodingKeys: String, CodingKey {
        case first
        case linksSelf = "self"
        case next, last
    }
}
