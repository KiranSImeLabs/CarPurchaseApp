//
//  TimeIntervalExtensions.swift
//  WeatherDemo
//
//  Created by Argus Asia on 04/06/24.
//

import Foundation

public extension TimeInterval{
    /*
     - stringFromTimeInterval() returns a human readable in hh:mm:dd string from the unixepoch value
     */
    func stringFromTimeInterval() -> String {
        let time = NSInteger(self)
        let seconds = time % 60
        let minutes = (time / 60) % 60
        let hours = (time / 3600)
        if hours == 0 {
            return String(format: "%0.2d:%0.2d",minutes,seconds)
        }else{
            return String(format: "%0.2d:%0.2d:%0.2d",hours,minutes,seconds)
        }
    }
    
    
    /*
     - stringFromTimeInterval() returns a human readable string from the unixepoch value
     */
    
    
    func stringFromTimeInterval(dateFormate:String) -> String {
        let date = Date(timeIntervalSince1970: self )
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = dateFormate
        return dateformatter.string(from: date) // inputFormatter.date(from: campaignDetails.startDate)
    }
    
    /*
     - timePassedSinceNow() returns  string value with time passing since now
     */
    
    var timePassedSinceNow: String {
        get {
            let date = Date(timeIntervalSince1970: self )
            let interval = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date, to: Date())
            if let year = interval.year, year > 0 {
                return year == 1 ? "\(year)" + " " + "year ago" : "\(year)" + " " + "years ago"
            } else if let month = interval.month, month > 0 {
                return month == 1 ? "\(month)" + " " + "month ago" : "\(month)" + " " + "months ago"
            }else if let week = interval.weekOfYear, week > 0 {
                return week == 1 ? "\(week)" + " " + "month ago" : "\(week)" + " " + "months ago"
            }else if let day = interval.day, day > 0 {
                return day == 1 ? "\(day)" + " " + "day ago" : "\(day)" + " " + "days ago"
            }else if let hour = interval.hour, hour > 0 {
                return hour == 1 ? "\(hour)" + " " + "hour ago" : "\(hour)" + " " + "hours ago"
            }else if let minute = interval.minute, minute > 0 {
                return minute == 1 ? "\(minute)" + " " + "minute ago" : "\(minute)" + " " + "minutes ago"
            }else if let second = interval.second, second > 0 {
                return second == 1 ? "\(second)" + " " + "second ago" : "\(second)" + " " + "seconds ago"
            } else {
                return "a moment ago"
                
            }
        }
    }
}
