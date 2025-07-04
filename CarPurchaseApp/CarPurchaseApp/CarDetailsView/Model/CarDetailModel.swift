//
//  CarDetailModel.swift
//  CarPurchaseApp
//
//  Created by Simelabs on 27/06/25.
//

import Foundation

// MARK: - CarDetailModel
struct CarDetailModel: Codable {
    let id, title: String
    let mainImage: String
    let price: Int
    let description: String
    let specifications: Specifications
    let availableColors: [String]
    let otherImages: [OtherImage]
}

// MARK: - OtherImage
struct OtherImage: Codable {
    let alt: String
    let src: String
    let color: String
}

// MARK: - Specifications
struct Specifications: Codable {
    let title: String
    let dimensions: Dimensions
    let engineSpecs: EngineSpecs
    let performanceSpecs: PerformanceSpecs
    let generalInformation: GeneralInformation
    let spaceVolumeWeights: SpaceVolumeWeights
    let drivetrainBrakesSuspensionSpecs: DrivetrainBrakesSuspensionSpecs
}

// MARK: - Dimensions
struct Dimensions: Codable {
    let width, height, length, wheelbase: String
    let frontTrack, approachAngle, departureAngle, rearBackTrack: String
    let dragCoefficientCD, rideHeightGroundClearance, minimumTurningCircleTurningDiameter: String

    enum CodingKeys: String, CodingKey {
        case width, height, length, wheelbase, frontTrack, approachAngle, departureAngle, rearBackTrack
        case dragCoefficientCD = "dragCoefficientCd"
        case rideHeightGroundClearance, minimumTurningCircleTurningDiameter
    }
}

// MARK: - DrivetrainBrakesSuspensionSpecs
struct DrivetrainBrakesSuspensionSpecs: Codable {
    let tiresSize, driveWheel, steeringType, powerSteering: String
    let rearSuspension, wheelRimsSize, frontSuspension, assistingSystems: String
    let drivetrainArchitecture, numberOfGearsAndTypeOfGearbox: String
}

// MARK: - EngineSpecs
struct EngineSpecs: Codable {
}

// MARK: - GeneralInformation
struct GeneralInformation: Codable {
    let brand, doors, model, seats: String
    let bodyType, generation, startOfProduction, modificationEngine: String
    let powertrainArchitecture: String
}

// MARK: - PerformanceSpecs
struct PerformanceSpecs: Codable {
    let fuelType, maximumSpeed, weightToPowerRatio, weightToTorqueRatio: String
}

// MARK: - SpaceVolumeWeights
struct SpaceVolumeWeights: Codable {
    let kerbWeight, trunkBootSpaceMaximum, trunkBootSpaceMinimum: String
}
