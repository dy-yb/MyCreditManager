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

      case .deleteStudent:
        deleteStudent()

      case .editOrAddGrade:
        addGrade()

      case .exit:
        isExited = true

      default:
        print("뭔가 입력이 잘못되었습니다. 1~5사이의 숫자 혹은 X를 입력해주세요.")

      }
    } else {
      print("뭔가 입력이 잘못되었습니다. 1~5사이의 숫자 혹은 X를 입력해주세요.")
    }
  }
}

func addStudent() {
  print("추가할 학생의 이름을 입력해주세요")

  let newStudentName = readLine()

  if let name = newStudentName {

    let isExistedName = studentData.contains { student in
      student.name == name
    }

    if !isExistedName {
      studentData.append(
        Student(
          name: name,
          gradeData: nil
        )
      )
      print("\(name) 학생을 추가했습니다.")

    } else {
      print("\(name)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
    }

  } else {
      print("입력이 잘못되었습니다. 다시 확인해주세요.")
  }
}

func deleteStudent() {
  print("삭제할 학생의 이름을 입력해주세요")

  let deleteStudentName = readLine()

  if let name = deleteStudentName {

    if let studentIndex = studentData.firstIndex(where: { $0.name == name }) {
      studentData.remove(at: studentIndex)

      print("\(name) 학생을 삭제했습니다.")

    } else {
      print("\(name) 학생을 찾지 못했습니다.")
    }

  } else {
    print("입력이 잘못되었습니다. 다시 확인해주세요.")
  }

}


func addGrade() {
  print("성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등을 띄어쓰기로 구분하여 차례로 작성해주세요.")
  print("입력 예) Mickey Swift A+ \n 만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.")

  let gradeInput = readLine()

  if let grade = gradeInput {

    let dataArray = grade.split(separator: " ")

    let isExistedName = studentData.contains { student in
      student.name == dataArray[0]
    }

    if isExistedName {
      studentData.append(
        Student(
          name: dataArray[0],
          gradeData: Grade(
            subjectName: String(dataArray[1]),
            grade: String(dataArray[2])
          )
        )
      )
    } else {
      print("\(dataArray[0]) 학생을 찾지 못했습니다.")
    }

  } else {
    print("입력이 잘못되었습니다. 다시 확인해주세요.")
  }
}

menu()
print(studentData)
