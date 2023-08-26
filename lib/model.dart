class Question {
  final String id;
  final String question;
  final String section;
  final int type;
  final List<String> options;
  final String isPara;
  final String videoLink;
  final int stage;

  Question({
    required this.id,
    required this.question,
    required this.section,
    required this.type,
    required this.options,
    required this.isPara,
    required this.videoLink,
    required this.stage,
  });
}

class Section {
  final String name;
  final int timing;
  final List<Question> questions;

  Section({
    required this.name,
    required this.timing,
    required this.questions,
  });
}

class MockTest {
  final String mockname;
  final List<Section> sections;
  final bool isCalculatorAllowed;
  final bool isToggleAllowed;

  MockTest({
    required this.mockname,
    required this.sections,
    required this.isCalculatorAllowed,
    required this.isToggleAllowed,
  });
}
