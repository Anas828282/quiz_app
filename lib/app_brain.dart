import 'question.dart';

class AppBrain {
  int _questionNumber = 0;

  List<Question> _questionGroup = [
    Question(
      q: 'Sustainability means that things cannot continue into the future.',
      a: false,
    ),
    Question(
      q: 'From a human perspective, sustainability ensures that the planet can provide fresh air, clean water, and food forever.',
      a: true,
    ),
    Question(
      q: 'Unsustainability means the planet can still perform its functions without issue.',
      a: false,
    ),
    Question(
      q: 'Scientists in Sweden developed a definition for sustainability twenty years ago with four basic principles.',
      a: true,
    ),
    Question(
      q: 'One care instruction for sustainability is to increase dependence on synthetic chemicals.',
      a: false,
    ),
    Question(
      q: 'Reducing the destruction of nature is part of the care instructions for sustainability.',
      a: true,
    ),
    Question(
      q: 'Meeting global needs has no connection to sustainability efforts.',
      a: false,
    ),
    Question(
      q: 'The Earth'
          's ability to provide essential services is declining because of human activities.',
      a: true,
    ),
    Question(
      q: 'Living sustainably involves following the four care instructions in every aspect of life.',
      a: true,
    ),
    Question(
      q: 'The Earth is a system where society, environment, and economy are interconnected.',
      a: true,
    ),
    //questions about sustainability from video //
  ];

  void nextQuestion() {
    if (_questionNumber < _questionGroup.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionGroup[_questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _questionGroup[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber >= _questionGroup.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
