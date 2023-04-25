import 'package:flutter/material.dart';

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({Key? key}) : super(key: key);

  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  var questionId = 0;
  var questions = [
    {
      'question': '2 + 2 = ?',
      'answer1': '1',
      'answer2': '2',
      'answer3': '4',
      'correct': '3',
    },
    {
      'question': '2 * 2 = ?',
      'answer1': '2',
      'answer2': '4',
      'answer3': '6',
      'correct': '2',
    },
    {
      'question': '2 + 2 * 2 = ?',
      'answer1': '2',
      'answer2': '4',
      'answer3': '6',
      'correct': '3',
    },
  ];

  void answer() {
    setState(() {
      questionId = (questionId + 1) % questions.length;
    });
  }

  bool isPressed = true;
  int points = 0;
  int pages = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text('Score: $points/${questions.length}',),
          ),
    
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(questions[questionId]['question']!,
                style: const TextStyle(fontSize: 30)),
          ),
    
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: isPressed
                  ? () {
                      pages += 1;
                      pages == questions.length ? isPressed = false : null;
                      questions[questionId]['correct'] == '1'
                          ? points += 1
                          : null;
                      answer();
                    }
                  : null,
              child: Text(questions[questionId]['answer1']!),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: isPressed
                  ? () {
                      pages += 1;
                      pages == questions.length ? isPressed = false : null;
                      questions[questionId]['correct'] == '2'
                          ? points += 1
                          : null;
                      answer();
                    }
                  : null,
              child: Text(questions[questionId]['answer2']!),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: isPressed
                    ? () {
                        pages += 1;
                        pages == questions.length ? isPressed = false : null;
                        questions[questionId]['correct'] == '3'
                            ? points += 1
                            : null;
                        answer();
                      }
                    : null,
                child: Text(questions[questionId]['answer3']!)),
          ),
        ],
      ),
    );
  }
}
