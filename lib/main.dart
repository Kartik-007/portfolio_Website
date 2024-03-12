import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'custom_card.dart'; // Import the custom card widget
import 'package:lottie/lottie.dart';
import 'blink.dart';
import 'type_writer.dart';

void main() {
  runApp(PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 11, 25, 47),
        // appBar: AppBar(
        //   title: Text('My Portfolio'),
        //   actions: [
        //     IconButton(
        //       icon: Icon(Icons.email),
        //       onPressed: () {
        //         showAboutDialog(context: context);
        //       },
        //     ),
        //     // IconButton(
        //     //   icon: Icon(Icons.code),
        //     //   onPressed: () {
        //     //     // Handle GitHub action
        //     //   },
        //     // ),
        //   ],
        // ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // Place your animation widget here
              Lottie.asset('assets/animations/Animation - 1710030344281.json',
                  width: 200, height: 200, fit: BoxFit.fill),

              Padding(
                padding: const EdgeInsets.all(30.0),
                child: FittedBox(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CustomTypewriterText(),
                        BlinkingCursorText(
                          text: "",
                          textStyle: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                          cursorColor: const Color.fromARGB(255, 96, 242, 212),
                        ),
                      ]),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(30),
                child: FittedBox(
                  child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 700),
                      child: const Text(
                        textAlign: TextAlign.center,
                        "Leading provider of cutting-edge technologies and services, offering scalable software solutions for businesses of all sizes.",
                        style: TextStyle(
                            color: Color.fromARGB(255, 136, 146, 175),
                            fontSize: 30),
                      )),
                ),
              ),
              const SizedBox(height: 50),
              const CustomCard(
                title: 'Reacto',
                description:
                    "A mobile game designed to test and improve players' reaction times. The game consists of four thrilling mini-games that challenge your speed and precision.",
                imagePath: "assets/images/reacto.png",
                technologies: [
                  "Flutter",
                  "Google Admob",
                ],
                projectUrl: 'https://reacto.site/',
              ),
              const SizedBox(height: 50),
              const CustomCard(
                title: 'Fitness Ai',
                description:
                    "A fitness app utilizing Chat GPT 4 to curate workout and meal plans based on user inputs. Featuring a firebase login, it adapts according to user progress",
                imagePath: "assets/images/fitness.png",
                technologies: ["OpenAi", "Flutter", "Firebase"],
                projectUrl: '',
              ),
              const SizedBox(height: 50),
              const CustomCard(
                title: 'PDF Ai',
                description:
                    "The project aims to provide users with an interactive platform to query multiple PDF documents simultaneously, enabling a conversational interface for document interaction.",
                imagePath: "assets/images/pdf.png",
                technologies: ["OpenAi", "Flutter", "Pinecone", "Langchain"],
                projectUrl:
                    'https://github.com/Aman-Kothari7/pdf_AI_Flutter_Langchain',
              ),
              const SizedBox(height: 50),
              const CustomCard(
                title: 'RAG system-FastAPI',
                description:
                    "Uses RAG system specifically designed to query RBI notifications. It leverages the LLaMA index and FastAPI to create a responsive and informative query system.",
                imagePath: "assets/images/rbi.png",
                technologies: ["OpenAi", "Fast API", "Python", "LlamaIndex"],
                projectUrl:
                    'https://github.com/Aman-Kothari7/RAGsystem-FastAPI',
              ),
              const SizedBox(height: 50),
              const CustomCard(
                title: 'Learning Path Ai',
                description:
                    "Harnesses LLMs to curate personal learning paths on a particular topic according to user preferences and goals",
                imagePath: "assets/images/learn.png",
                technologies: [
                  "OpenAi",
                  "Flutter",
                  "Firebase",
                ],
                projectUrl:
                    'https://github.com/Aman-Kothari7/learning_path_ai_applied_LLM_Application',
              ),
              const SizedBox(height: 50),
              const CustomCard(
                title: 'AI ChatBot',
                description:
                    "Advanced chatbot customer service agent focusing on web data. It employs NLP techniques, machine learning models, and integrates with LlamaIndex for efficient data handling and query processing.",
                imagePath: "assets/images/ai_chatbot.png",
                technologies: [
                  "Python",
                  "LlamaIndex",
                  "Langchain",
                ],
                projectUrl:
                    'https://github.com/Aman-Kothari7/Generative-AI-Chatbot_Web-scraped-data',
              ),
              const SizedBox(height: 50),
              const CustomCard(
                title: 'Habit Tracker',
                description:
                    "The app aims to facilitate users in breaking bad habits and forming new ones. It features a to-do list that users must complete daily.",
                imagePath: "assets/images/habit_tracker.png",
                technologies: [
                  "Flutter",
                  "HIVE DB",
                ],
                projectUrl:
                    'https://play.google.com/store/apps/details?id=com.slapp.makeandbreak',
              ),
              const SizedBox(height: 50),
              const CustomCard(
                title: 'TestGen AI',
                description:
                    "This project employs a combination of natural language processing and machine learning techniques to extract keywords, generate questions, and create distractors for quizzes.",
                imagePath: "assets/images/test_gen.png",
                technologies: [
                  "Python",
                  "Java Script",
                ],
                projectUrl: 'https://github.com/Aman-Kothari7/TestGen.ai',
              ),

              // Add more CustomCard widgets as needed
              const SizedBox(height: 50),
              const Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(Icons.email, color: Colors.white),
                  SizedBox(
                      width:
                          10), // Provides space between the icon and the text
                  Text(
                    "amankothari917@gmail.com",
                    style: TextStyle(
                        color: Color.fromARGB(255, 96, 242, 212), fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
