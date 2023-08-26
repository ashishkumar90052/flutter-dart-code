import 'package:flutter/material.dart';
import 'package:flutterdartcode/controller.dart';
import 'package:get/get.dart';
import 'utils/size_cofig.dart'; // Import the GetX package

// Your existing models, controller setup, and data access

class YourScreen extends StatelessWidget {
  final MockTestController _mockTestController = Get.put(MockTestController());

  YourScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentSection = _mockTestController
        .mockTests[_mockTestController.currentSectionIndex.value]
        .sections[_mockTestController.currentSectionIndex.value];
    final totalQuestionsInSection = currentSection.questions.length;

    return Scaffold(
      appBar: AppBar(
        titleTextStyle: textStyle15Color,
        title: Obx(() => Row(
              children: [
                Text(
                    '${currentSection.name}  ${_mockTestController.remainingTime.value.inSeconds}s',
                    style: const TextStyle(color: Color(0xffFF7A00))),
                w8,
                const Text('|'),
                w8,
                Text(
                  '${_mockTestController.currentQuestionIndex.value + 1}/$totalQuestionsInSection',
                )
              ],
            )),
      ),
      body: Obx(() {
        if (_mockTestController.mockTests.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else {
          final currentSection = _mockTestController
              .mockTests[_mockTestController.currentSectionIndex.value]
              .sections[_mockTestController.currentSectionIndex.value];
          final currentQuestion = currentSection
              .questions[_mockTestController.currentQuestionIndex.value];

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(currentQuestion.question, style: textStyle15),
                h16,
                Column(
                  children: List<Widget>.generate(
                      currentQuestion.options.length, (index) {
                    final option = currentQuestion.options[index];

                    return Container(
                      color: _mockTestController.selectedOption.value == option
                          ? kBlack12 // Set the color to kRed if the option is selected
                          : Colors
                              .transparent, // Set to transparent if not selected
                      child: RadioListTile<String>(
                        title: Text(currentQuestion.options[index]),
                        value: currentQuestion.options[index],
                        groupValue: _mockTestController.selectedOption.value,
                        onChanged: (value) {
                          _mockTestController.selectedOption.value = value!;
                        },
                      ),
                    );
                  }),
                ),
                CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Mark for Review'),
                  value: _mockTestController.checkboxValue.value,
                  onChanged: (value) {
                    _mockTestController.checkboxValue.value = value ?? false;
                  },
                ),
                h16,
                ElevatedButton(
                  onPressed: () {
                    // Logic to handle button click and move to next question
                    _mockTestController.moveToNextQuestion();
                  },
                  child: const Text('Next Question'),
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
