//
//  Student.swift
//  MyCreditManager
//
//  Created by Daye on 2022/11/25.
//

import Foundation

struct Student {
  let name: String
  var gradeData: [Grade]
}

struct Grade {
  let subjectName: String
  var grade: String
}

enum Menu: String {
  case addStudent = "1"
  case deleteStudent = "2"
  case editOrAddGrade = "3"
  case deleteGrade = "4"
  case showGradeAvarage = "5"
  case exitSmallX = "x"
  case exitLargeX = "X"
}

let gradeSample: [String: Double] = [
  "A+": 4.5,
  "A": 4.0,
  "B+": 3.5,
  "B": 3.0,
  "C+": 2.5,
  "C": 2.0,
  "D": 1.5,
  "D+": 1.0,
  "F": 0
]

