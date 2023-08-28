import 'package:flutter/material.dart';
import 'package:flutterdartcode/controller.dart';
import 'package:get/get.dart';
import 'utils/size_cofig.dart';

class YourScreen extends StatelessWidget {
  final MockTestController _mockTestController = Get.put(MockTestController());

  YourScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          titleTextStyle: textStyle15Color,
          title: Row(
            children: [
              Text(
                  '${_mockTestController.currentSection.name}  ${_mockTestController.remainingTime.value.inSeconds}s',
                  style: const TextStyle(color: Color(0xffFF7A00))),
              w8,
              const Text('|'),
              w8,
              Text(
                '${_mockTestController.currentQuestionIndex.value + 1}/${_mockTestController.totalQuestionsInSection}',
              )
            ],
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_mockTestController.currentQuestion.question,
                    style: textStyle15),
                h16,
                Column(
                  children:
                      _mockTestController.currentQuestion.options.map((option) {
                    return RadioListTile(
                      title: Text(option),
                      value: option,
                      groupValue: _mockTestController.selectedOption.value,
                      onChanged: (value) {
                        _mockTestController.selectedOption.value = value!;
                      },
                    );
                  }).toList(),
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
                    _mockTestController.moveToNextQuestion();
                  },
                  child: const Text('Next Question'),
                ),
              ],
            )),
        bottomNavigationBar: Obx(() {
          final sections = _mockTestController.mockTests[0].sections;

          return SafeArea(
            child: Row(
              children: List.generate(
                sections.length,
                (index) => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    // Apply a different background color for the current section
                    backgroundColor:
                        _mockTestController.currentSectionIndex.value == index
                            ? Colors.blue
                            : Colors.grey,
                  ),
                  onPressed: () {
                    _mockTestController.moveToNextQuestion();
                    _mockTestController.selectedOption.value =
                        ''; // Reset selected option

                    // _mockTestController.moveToNextSection(index);
                  },
                  child: Text(sections[index].name),
                ),
              ),
            ),
          );
        }),
      );
    });
  }
}
