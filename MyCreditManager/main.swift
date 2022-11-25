//
//  main.swift
//  MyCreditManager
//
//  Created by Daye on 2022/11/25.
//

import Foundation

var studentData: [Student] = []

func menu() {
  var isExited: Bool = false

  while !isExited {

    print("원하는 기능을 입력해주세요")
    print("1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료")

    let selectedMenu = readLine()

    if let menu = selectedMenu {
      let selection = Menu(rawValue: menu)

      switch selection {
      case .addStudent:
        addStudent()

      case .exit:
        isExited = true

      default:
        print("뭔가 입력이 잘못되었습니다. 1~5사이의 숫자 혹은 X를 입력해주세요.")

      }
    }
  }
}

func addStudent() {
  print("추가할 학생의 이름을 입력해주세요")

  let newStudentName = readLine()

  if let name = newStudentName {
    studentData.append(
      Student(
        name: name, gradeData: nil
      )
    )
  }
}

  menu()
  print(studentData)
