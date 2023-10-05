import 'package:ckeditor/Screens/quiz_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('cKEditor ', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.transparent, 
        elevation: 0,
      ),
     // backgroundColor: const Color(0xffC8DCF8),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 8, ), 
            children: [
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=> const QuizScreen()));
                },
                child: Container(
                  height: 50, 
                  width: 80, 
                  padding: const EdgeInsets.all(26),
                  decoration:  BoxDecoration(
                    color:  const Color(0xffC8DCF8), 
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Center(
                    child: Image.asset('Images/latex.png'),
                  )
                ),
              ), 
              Container(
                height: 50, 
                width: 80, 
                decoration:  BoxDecoration(
                  color: const Color(0xffFEE3A0), 
                   borderRadius: BorderRadius.circular(12)
                ),
                child: const Center(child: Text('Coming Soon..'),),
              )
            ],),
        )
      ),
    );
  }
}