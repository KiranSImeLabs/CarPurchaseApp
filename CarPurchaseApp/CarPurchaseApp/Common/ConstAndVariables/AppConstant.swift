//
//  AppConstant.swift
//  WeatherDemo
//
// Created by Argus Asia on 04/06/24.
//

import Foundation
import UIKit

struct AppConstant {
    static let isProduction = false
    static let kThemeInterval = 5.0
    static let kScreenWidth = UIScreen.main.bounds.width
    static let kScreenHeight = UIScreen.main.bounds.height
    
    static let kAppAlreadyOpened = "kAppAlreadyOpened"
    static let themeUrlString = "/getTheme"
    static let kUserModel = "kUserModel"
    static let kWeatherAPI = "https://api.weatherapi.com/v1/forecast.json"
    static let kNotificationWeatherApiUpdated = "kNotificationWeatherApiUpdated"
    static let kNotificationThemeUpdated = "kNotificationThemeUpdated"
    static let kThemeAdvertismentIdNotificaiton = "kThemeAdvertismentIdNotificaiton"
    static let kLocationAutherized = "kLocationAutherized"
    static let kLanguageChanged = "kLanguageChanged"
    static let kDeviceRemovedFromDB = "kDeviceRemovedFromDB"
    
    
    static let kHomeScreenTableHeader = "HomeScreenTableHeader"
    static let kTextfieldTableCell = "TextfieldTableCell"
    static let kTitleTableCell = "TitleTableCell"
    static let kScanDeviceCell = "ScanDeviceCell"
    static let kAddNewDeviceCell = "AddNewDeviceTableCell"
    static let kGenderSelectionTableCell = "GenderSelectionTableCell"
    static let kGenderProfileSelectionTableCell = "GenderProfileSelectionTableCell"
    static let kButtonTableViewCell = "ButtonTableViewCell"
    static let kOtherSignInTableCell = "OtherSignInTableCell"
    static let kRegisterSignInTableCell = "RegisterSignInTableCell"
    static let kHomeDeviceCell = "HomeDeviceCell"
    static let kMyDevicesTableViewCell = "MyDevicesTableViewCell"
    static let kMyDevicesMinimumTableViewCell = "MyDevicesMinimumTableViewCell"
    static let kSettingsTableViewCell1 = "SettingsTableViewCell1"
    static let kSettingsTableViewCell2 = "SettingsTableViewCell2"
    static let kSettingsTableViewCell3 = "SettingsTableViewCell3"
    static let kNotificationTableViewCell = "NotificationTableViewCell"
    static let kProfileImageTableViewCell = "ProfileImageTableViewCell"
    static let kEnvironmentRain = "kEnvironmentRain"
    static let kEnvironmentSnow = "kEnvironmentSnow"
    static let kEnvironmentUV = "kEnvironmentUV"
    static let kscanningStoppedNotification = "BluetoothScanningStopped"
    static let kBluetoothConnectedNotification = "BluetoothConnectedNotification"
    static let kBluetoothFailedConnectedNotification = "BluetoothFailedConnectedNotification"
    static let kBluetoothDisConnectedNotification = "BluetoothDisConnectedNotification"
    static let kCentralManageerStateNotification = "CentralManageerStateNotification"
    static let kBluetoothConnectionTimeOut = "BluetoothConnectionTimeOut"
    
}
