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

  RxList<MockTest> mockTests = <MockTest>[].obs;
  var currentSectionIndex = 0.obs;
  RxInt currentQuestionIndex = 0.obs;
  Rx<Duration> remainingTime = const Duration(seconds: 0).obs;
  late Timer timer;
  var checkboxValue = false.obs;
  RxString selectedOption = ''.obs;

  @override
  void onInit() {
    super.onInit();

    for (var mockItem in mockDatadd) {
      var mockTest = MockTest(
        mockname: mockItem['mockname'],
        sections: (mockItem['sections'] as List<dynamic>).map((sectionItem) {
          var sectionQuestions =
              (sectionItem['questions'] as List<dynamic>).map((questionItem) {
            var questionOptions = (questionItem['options'] as List<dynamic>)
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
    // printSectionsData();
  }

  Section get currentSection =>
      mockTests[0].sections[currentSectionIndex.value];

  int get totalQuestionsInSection => currentSection.questions.length;

  Question get currentQuestion =>
      currentSection.questions[currentQuestionIndex.value];

  // void printSectionsData() {
  //   for (var mockTest in mockTests) {
  //     print('Mock Test: ${mockTest.mockname}');
  //     for (var section in mockTest.sections) {
  //       print('Section: ${section.name}, Timing: ${section.timing}');
  //       for (var question in section.questions) {
  //         print('Question: ${question.question}');
  //         print('options: ${question.options}');
  //         // Print other question details if needed
  //       }
  //     }
  //   }
  // }

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

  void moveToNextQuestion() {
    if (currentQuestionIndex <
        mockTests[0].sections[currentSectionIndex.value].questions.length - 1) {
      currentQuestionIndex.value++;
    } else {
      debugPrint('dont move until timer gets 0');
    }
  }

  void moveToNextSection() {
    currentSectionIndex.value++;
    mockTests[0].sections[currentSectionIndex.value];
    currentQuestionIndex.value = 0;
    startTimerForCurrentQuestion(currentSection.timing);
  }
}
