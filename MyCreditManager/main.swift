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

      case .deleteGrade:
        deleteGrade()

      case .showGradeAvarage:
        showGradeAverage()

      case .exitSmallX, .exitLargeX:
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

    // 존재하는 학생인지 판별
    let isExistedName = studentData.contains { student in
      student.name == name
    }

    if !isExistedName {
      studentData.append(
        Student(
          name: name,
          gradeData: []
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

    // 존재하는 학생이면 삭제
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
  print("성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.")
  print("입력 예) Mickey Swift A+ \n 만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.")

  let gradeInput = readLine()

  // 입력 값이 비어있지 않고, 스페이스(" ")로 구분된 3개의 값이 존재하며, 마지막 성적이 올바른 형태로 입력 되었는지 판별
  if let gradeData = gradeInput,
     gradeData.split(separator: " ").count == 3,
     gradeSample.keys.contains(where: { $0 == String(gradeData.split(separator: " ").last ?? "") }){

    let dataArray = gradeData.split(separator: " ")

    let studentName = String(dataArray[0])
    let subjectName = String(dataArray[1])
    let grade = String(dataArray[2])

    // 이름으로 학생 정보 탐색하여 인덱스 파악
    if let studentIndex = studentData.firstIndex(where: { $0.name == studentName }) {
      let studentGradeData = studentData[studentIndex].gradeData

      // 해당 과목에 대한 성적이 이미 있다면 수정
      if let gradeIndex = studentGradeData.firstIndex(where: { $0.subjectName == subjectName }) {
        studentData[studentIndex].gradeData[gradeIndex].grade = grade

      } else {
        // 처음 입력 되는 과목이면 추가
        studentData[studentIndex].gradeData.append(
          Grade(
            subjectName: subjectName,
            grade: grade
          )
        )
      }

    } else {
      // 일치하는 학생의 이름이 없는 경우
      print("\(studentName) 학생을 찾지 못했습니다.")
    }
  } else {
    // 입력 값이 없거나, 스페이스 바로 구분 된 입력 값이 3가지 항목이 아니거나, 입력된 성적이 올바른 형태가 아닌경우
    print("입력이 잘못되었습니다. 다시 확인해주세요.")
  }
}

func deleteGrade() {
  print("성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.")

  let gradeInput = readLine()

  // 입력 값이 비어있지 않고, 스페이스(" ")로 구분된 2개의 값이 존재하는지 판별
  if let gradeData = gradeInput,
     gradeData.split(separator: " ").count == 2 {

    let dataArray = gradeData.split(separator: " ")

    let studentName = String(dataArray[0])
    let subjectName = String(dataArray[1])

    // 이름으로 학생 정보 탐색하여 인덱스 파악
    if let studentIndex = studentData.firstIndex(where: { $0.name == studentName }) {
      let studentGradeData = studentData[studentIndex].gradeData

      // 입력한 과목에 대한 성적이 있다면 삭제
      if let gradeIndex = studentGradeData.firstIndex(where: { $0.subjectName == subjectName }) {
        studentData[studentIndex].gradeData.remove(at: gradeIndex)
      } else {
        // 일치하는 과목이 없는 경우
        print("\(subjectName) 과목의 성적을 찾지 못했습니다.")
      }

    } else {
      // 일치하는 학생의 이름이 없는 경우
      print("\(studentName) 학생을 찾지 못했습니다.")
    }
  } else {
    // 입력 값이 비어있지 않고, 스페이스(" ")로 구분된 2개의 값이 존재하지 않는 경우
    print("입력이 잘못되었습니다. 다시 확인해주세요.")
  }
}

func showGradeAverage() {
  print("평점을 알고싶은 학생의 이름을 입력해주세요.")

  var numOfSubjects: Double = 0
  var totalGrade: Double = 0

  let studentName = readLine()

  if let name = studentName {

    if let studentIndex = studentData.firstIndex(where: { $0.name == studentName }) {
      let studentGradeData = studentData[studentIndex].gradeData

      // 입력 된 성적이 없는 경우
      if studentGradeData.count == 0 {
        print("아직 \(name) 학생의 입력 된 성적이 없습니다.")

      } else {
        studentGradeData.forEach {
          print("\($0.subjectName): \($0.grade)")

          totalGrade += gradeSample[$0.grade] ?? 0
          numOfSubjects += 1
        }
        print("평점: \(totalGrade/numOfSubjects)")
      }
    }

  } else {
    print("입력이 잘못되었습니다. 다시 확인해주세요.")
  }
}

menu()
