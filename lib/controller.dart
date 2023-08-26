import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutterdartcode/utils/const.dart';
import 'package:get/get.dart';

import 'model.dart';

class MockTestController extends GetxController {
  final mockTest = MockTest(
    mockname: "",
    sections: [],
    isCalculatorAllowed: true,
    isToggleAllowed: false,
  ).obs;

  void setMockTestData(MockTest data) {
    mockTest.value = data;
  }

  final RxList<MockTest> mockTests = <MockTest>[].obs;
  final RxInt currentSectionIndex = 0.obs;
  final RxInt currentQuestionIndex = 0.obs;
  final Rx<Duration> remainingTime = const Duration(seconds: 0).obs;
  late Timer timer;
  var checkboxValue = false.obs;
  final RxString selectedOption = ''.obs;

  @override
  void onInit() {
    super.onInit();

    for (var mockItem in mockDatadd) {
      final mockTest = MockTest(
        mockname: mockItem['mockname'],
        sections: (mockItem['sections'] as List<dynamic>).map((sectionItem) {
          final sectionQuestions =
              (sectionItem['questions'] as List<dynamic>).map((questionItem) {
            final questionOptions = (questionItem['options'] as List<dynamic>)
                .map((option) => option.toString())
                .toList();

            return Question(
              id: questionItem['id'],
              question: questionItem['question'],
              section: questionItem['section'],
              type: questionItem['type'],
              options: questionOptions,
              isPara: questionItem['isPara'],
              videoLink: questionItem['videoLink'],
              stage: questionItem['stage'],
            );
          }).toList();

          return Section(
            name: sectionItem['name'],
            timing: sectionItem['timing'],
            questions: sectionQuestions,
          );
        }).toList(),
        isCalculatorAllowed: mockItem['isCalculatorAllowed'],
        isToggleAllowed: mockItem['isToggleAllowed'],
      );

      mockTests.add(mockTest);
    }
    startTimerForCurrentQuestion(mockTests[currentSectionIndex.value]
        .sections[currentSectionIndex.value]
        .timing);
    printSectionsData();
  }

  void printSectionsData() {
    for (var mockTest in mockTests) {
      print('Mock Test: ${mockTest.mockname}');
      for (var section in mockTest.sections) {
        print('Section: ${section.name}, Timing: ${section.timing}');
        for (var question in section.questions) {
          print('Question: ${question.question}');
          print('options: ${question.options}');
          // Print other question details if needed
        }
      }
    }
  }

  void startTimerForCurrentQuestion(int seconds) {
    remainingTime.value = Duration(seconds: seconds);
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime.value.inSeconds > 0) {
        debugPrint('Timer: ${remainingTime.value.inSeconds}');
        remainingTime.value -= const Duration(seconds: 1);
      } else {
        debugPrint('Timer expired, moving to next section');
        timer.cancel(); // Cancel the current timer
        moveToNextSection(); // Choose either moveToNextSection or moveToNextQuestion
      }
    });
  }

  // void startTimerForCurrentQuestion(int seconds) {
  //   remainingTime.value = Duration(seconds: seconds);
  //   timer = Timer.periodic(const Duration(seconds: 1), (timer) {
  //     if (remainingTime.value.inSeconds > 0) {
  //       debugPrint('Timer: ${remainingTime.value.inSeconds}');

  //       remainingTime.value -= const Duration(seconds: 1);
  //     } else {
  //       debugPrint('Timer expired, moving to next section');
  //       timer.cancel(); // Cancel the current timer
  //       moveToNextSection();
  //     }
  //   });
  // }

  void moveToNextQuestion() {
    if (currentQuestionIndex <
        mockTests[currentSectionIndex.value]
                .sections[currentSectionIndex.value]
                .questions
                .length -
            1) {
      currentQuestionIndex.value++;
    } else {
      // Move to next section if no more questions
      moveToNextSection();
    }
  }

  void moveToNextSection() {
    final currentMock = mockTests[currentSectionIndex.value];
    debugPrint(mockTests.length.toString());

    // debugPrint('length of sections ${currentMock.sections.length.toString()}');
    // debugPrint('current idx ${currentSectionIndex.toString()}');
    if (currentSectionIndex < mockTests.length - 1) {
      currentSectionIndex.value++;
      currentQuestionIndex.value = 0;
      debugPrint(mockTests.length.toString());
      debugPrint('new length of sections ${currentMock.sections.toString()}');
      debugPrint('new current idx ${currentSectionIndex.value.toString()}');

      update();
      refresh();
      // startTimerForCurrentQuestion(
      //     currentMock.sections[currentSectionIndex.value].timing);
    } else {
      debugPrint('All sections and questions completed');
      // Handle as needed (e.g., show results)
    }
  }

  // void moveToNextSection() {
  //   debugPrint('current section ${currentSectionIndex.toString()}');
  //   debugPrint('mock lenght  ${mockTests.sections.length.toString()}');
  //   if (currentSectionIndex < mockTests.length - 1) {
  //     currentSectionIndex.value++;
  //     currentQuestionIndex.value = 0;
  //     startTimerForCurrentQuestion(mockTests[currentSectionIndex.value]
  //         .sections[currentSectionIndex.value]
  //         .timing);
  //   } else {
  //     debugPrint('current section ${currentSectionIndex.toString()}');
  //     debugPrint('mock lenght  ${mockTests.length.toString()}');

  //     debugPrint('All sections and questions completed');
  //     // Handle as needed (e.g., show results)
  //   }
  // }
}
