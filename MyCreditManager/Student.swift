//
//  Student.swift
//  MyCreditManager
//
//  Created by Daye on 2022/11/25.
//

import Foundation

struct Student {
  let name: String
  let gradeData: [Grades]?
}

struct Grade {
  let subjectName: String
  let grade: String
}

enum GradeValue: Float {
  case AP = 4.5
  case A = 4
  case BP = 3.5
  case B = 3
  case CP = 2.5
  case C = 2
  case DP = 1.5
  case D = 1
  case F = 0
}


enum Menu: String {
  case addStudent = "1"
  case deleteStudent = "2"
  case editOrAddGrade = "3"
  case deleteGrade = "4"
  case showGradeList = "5"
  case exit = "x"
}
