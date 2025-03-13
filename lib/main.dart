import 'package:flutter/material.dart';
import 'app_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:video_player/video_player.dart';
import 'menu_screen.dart';

AppBrain appBrain = AppBrain();

void main() {
  runApp(ExamApp());
}

class ExamApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MenuScreen(),
        '/quiz': (context) => Scaffold(
              backgroundColor: const Color.fromARGB(255, 3, 119, 38),
              appBar: AppBar(
                backgroundColor: const Color.fromARGB(255, 20, 204, 45),
                title: Text('Quiz about sustainabillity'),
                leading: IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/', (route) => false);
                  },
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ExamPage(),
              ),
            ),
      },
    );
  }
}

class ExamPage extends StatefulWidget {
  @override
  _ExamPageState createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  List<Widget> answerResult = [];
  int rightAnswers = 0;
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/video/quiz_video.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller.setLooping(true);
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void checkAnswer(bool whatUserPicked) {
    bool correctAnswer = appBrain.getQuestionAnswer();
    setState(() {
      if (whatUserPicked == correctAnswer) {
        rightAnswers++;
        answerResult.add(
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Icon(
              Icons.check,
              color: Colors.green,
            ),
          ),
        );
      } else {
        answerResult.add(
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Icon(
              Icons.close,
              color: Colors.red,
            ),
          ),
        );
      }
      if (appBrain.isFinished() == true) {
        Alert(
          context: context,
          title: "Quiz done",
          desc: " You answered  $rightAnswers Out of 10 questions",
          buttons: [
            DialogButton(
              child: Text(
                "Play again",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();

        appBrain.reset();

        answerResult = [];

        rightAnswers = 0;
      } else {
        appBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: answerResult,
        ),
        Expanded(
          flex: 5,
          child: Column(
            children: [
              _controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          VideoPlayer(_controller),
                          IconButton(
                            icon: Icon(
                              _controller.value.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow,
                              size: 50,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                _controller.value.isPlaying
                                    ? _controller.pause()
                                    : _controller.play();
                              });
                            },
                          ),
                        ],
                      ),
                    )
                  : CircularProgressIndicator(),
              SizedBox(height: 20.0),
              Text(
                appBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[600],
                foregroundColor: Colors.white,
              ),
              child: Text(
                'True',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
              onPressed: () {
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[600],
                foregroundColor: Colors.white,
              ),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
              onPressed: () {
                checkAnswer(false);
              },
            ),
          ),
        ),
      ],
    );
  }
}
