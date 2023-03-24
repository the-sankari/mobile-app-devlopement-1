
//  AgeCalender.swift
//
//
//  Created by Kajol Sutra Dhar on 24.3.2023.
//
//  Exercise 9
import UIKit
import Foundation


let calendar = Calendar.current
var birthDateComponents = DateComponents()
birthDateComponents.year = 1997
birthDateComponents.month = 8
birthDateComponents.day = 16

let birthdate = calendar.date(from: birthDateComponents)


func ageInDays(birthDate: Date) -> Int{
    let calendar = Calendar.current
    let now = Date()
    let components = calendar.dateComponents([.day], from: birthDate, to: now)
    let days = components.day ?? 0
    return abs(days)
}
let age = ageInDays(birthDate: birthdate!)
print("Age in day is \(age)")
