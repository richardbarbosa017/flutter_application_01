
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/quizPage.dart';
import 'package:flutter_application_1/pages/toDoPage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RowCard(title: "Quiz"),
            RowCard(title: "ToDo List")
          ],
        ),
      ),
    );
  }
}

class RowCard extends StatelessWidget {
  const RowCard({
    required this.title
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Card(
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () => {
            if(title == "Quiz"){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return QuizPage();
              }))
            }
            else{
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ToDoPage();
              }))
            }
          },
          splashColor: Colors.blueAccent[100],
          child: 
          SizedBox(
            width: 350,
            height: 70,
            child: Center(child: Text(title)))
          ),
        )
         ,
      
    ],);
  }
}