import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'custom_card.dart'; // Import the custom card widget
import 'package:lottie/lottie.dart';
import 'blink.dart';
import 'type_writer.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(PortfolioApp());
}

List<CustomCard> projects = [
  const CustomCard(
    title: 'Reacto',
    description:
        "A mobile game designed to test and improve players' reaction times.",
    imagePath: "assets/images/reacto.png",
    technologies: ["Flutter", "Google Admob"],
    projectUrl: 'https://reacto.site/',
  ),
  const CustomCard(
    title: 'Fitness Ai',
    description:
        "A fitness app utilizing Chat GPT 4 to curate workout and meal plans based on user inputs.",
    imagePath: "assets/images/fitness.png",
    technologies: ["OpenAi", "Flutter", "Firebase"],
    projectUrl: '',
  ),

  const CustomCard(
    title: 'Fitness Ai',
    description:
        "A fitness app utilizing Chat GPT 4 puts. Featuring a firebase login, it adapts according to user progress",
    imagePath: "assets/images/fitness.png",
    technologies: ["OpenAi", "Flutter", "Firebase"],
    projectUrl: '',
  ),

  const CustomCard(
    title: 'PDF Ai',
    description:
        "The project aims y multiple PDF documents simultaneously, enabling a conversational interface for document interaction.",
    imagePath: "assets/images/pdf.png",
    technologies: ["OpenAi", "Flutter", "Pinecone"],
    projectUrl: 'https://github.com/Aman-Kothari7/pdf_AI_Flutter_Langchain',
  ),

  const CustomCard(
    title: 'RAG system-FastAPI',
    description:
        "Uses PI to create a responsive and informative query system.",
    imagePath: "assets/images/rbi.png",
    technologies: ["OpenAi", "Fast API", "Python"],
    projectUrl: 'https://github.com/Aman-Kothari7/RAGsystem-FastAPI',
  ),

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

  // Add more projects as needed
];

class PortfolioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 11, 25, 47),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 11, 25, 47),
          title: Text('My Portfolio',
              style: TextStyle(color: Color.fromARGB(255, 204, 214, 246))),
          actions: [
            IconButton(
              icon:
                  Icon(Icons.email, color: Color.fromARGB(255, 204, 214, 246)),
              onPressed: () {
                launchUrl(Uri.parse('mailto:your-email@example.com'));
              },
            ),
            IconButton(
              icon: Icon(Icons.account_circle,
                  color: Color.fromARGB(255, 204, 214, 246)),
              onPressed: () {
                launchUrl(
                    Uri.parse('https://www.linkedin.com/in/your-linkedin/'));
              },
            ),
            IconButton(
              icon: Icon(Icons.code, color: Color.fromARGB(255, 204, 214, 246)),
              onPressed: () {
                launchUrl(Uri.parse('https://github.com/your-github/'));
              },
            ),
          ],
        ),
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
                padding: EdgeInsets.all(10),
                child: FittedBox(
                  child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 700),
                      child: const Text(
                        textAlign: TextAlign.center,
                        "I am a dynamic Computer Science graduate from the University of Illinois, passionate about leveraging innovative technologies to make a significant impact on humanity. Committed to continuous learning, I thrive on engaging with new ideas and contributing positively to the global tech community.",
                        style: TextStyle(
                            height: 2,
                            color: Color.fromARGB(255, 136, 146, 175),
                            fontSize: 20),
                      )),
                ),
              ),
              const SizedBox(height: 50),

              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(
                    left: 250,
                    bottom: 50,
                    top: 200), // Adjust padding as needed
                child: Text(
                  '/projects',
                  style: TextStyle(
                    color: Color.fromARGB(255, 204, 214, 246),
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(), // to disable GridView's scrolling
                crossAxisCount: 3,
                crossAxisSpacing: 30, // Space between columns
                mainAxisSpacing: 30, // Space between rows
                padding: const EdgeInsets.symmetric(horizontal: 250), // Uniform padding on the sides
                childAspectRatio: (800 / 800),
                children: List.generate(projects.length, (index) {
                  return CustomCard(
                    title: projects[index].title,
                    description: projects[index].description,
                    imagePath: projects[index].imagePath,
                    technologies: projects[index].technologies,
                    projectUrl: projects[index].projectUrl,
                  );
                }),
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
