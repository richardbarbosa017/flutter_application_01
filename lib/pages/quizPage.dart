import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<Map<String, Object>> _questions = [
    {
      'question': 'What type is the Pokémon Pikachu?',
      'answers': ['Electric', 'Fire', 'Water', 'Grass'],
      'correct': 'Electric',
      'imageUrl': 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png',
    },
    {
      'question': 'Which Pokémon is known as the "Lizard Pokémon"?',
      'answers': ['Charmander', 'Squirtle', 'Bulbasaur', 'Pidgey'],
      'correct': 'Charmander',
      'imageUrl': 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png',
    },
    {
      'question': 'How many Pokémon types are there in the first generation?',
      'answers': ['10', '15', '18', '20'],
      'correct': '15',
      'imageUrl': 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png', // Bulbasaur as generic image
    },
    {
      'question': 'Which of these is a Water-type Pokémon?',
      'answers': ['Geodude', 'Squirtle', 'Charmander', 'Pikachu'],
      'correct': 'Squirtle',
      'imageUrl': 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/7.png',
    },
    {
      'question': "Who's the best pokemon ever made?",
      'answers': ['Geodude', 'Squirtle', 'Lucario', 'Pikachu'],
      'correct': 'Lucario',
      'imageUrl': 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/448.png',
    }
  ];

  int _currentQuestionIndex = 0;
  int _score = 0;
  bool _answered = false;

  void _answer(String answer) {
    if (_answered) return;

    final correct = _questions[_currentQuestionIndex]['correct'] as String;
    if (answer == correct) {
      _score++;
    }

    setState(() {
      _answered = true;
    });

    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _currentQuestionIndex++;
        _answered = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_currentQuestionIndex >= _questions.length) {
      return Scaffold(
        appBar: AppBar(title: Text('Quiz Pokémon')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("That's all folks!", style: TextStyle(fontSize: 24)),
              Text('Score: $_score / ${_questions.length}'),
              ElevatedButton(
                child: Text('Try again'),
                onPressed: () {
                  setState(() {
                    _currentQuestionIndex = 0;
                    _score = 0;
                  });
                },
              )
            ],
          ),
        ),
      );
    }

    final question = _questions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(title: Text('Quiz Pokémon')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(
              question['imageUrl'] as String,
              height: 150,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 20),
            Text(
              question['question'] as String,
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ...(question['answers'] as List<String>).map((answer) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _answered
                        ? (answer == question['correct']
                            ? Colors.green
                            : Colors.red)
                        : null,
                  ),
                  child: Text(answer),
                  onPressed: () => _answer(answer),
                ),
              );
            }).toList()
          ],
        ),
      ),
    );
  }
}
