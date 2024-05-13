import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'custom_card.dart'; // Import the custom card widget
import 'package:lottie/lottie.dart';
import 'blink.dart';
import 'type_writer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


void main() {
  runApp(PortfolioApp());
}

List<CustomCard> projects = [
  const CustomCard(
    title: 'Reacto',
    description:
        "A mobile game designed to test and improve players' reaction times. 500+ downloads!",
    imagePath: "assets/images/reacto.png",
    technologies: ["Flutter", "Google Admob"],
    projectUrl: 'https://reacto.site/',
  ),
  const CustomCard(
    title: 'tubeAI',
    description:
        "An AI agent video ideation accelerator tool",
    imagePath: "assets/images/tubeai.png",
    technologies: ["React", "CrewAI", "FastAPI"],
    projectUrl: 'https://github.com/Kartik-007/tubeAI',
  ),

  const CustomCard(
    title: 'chatPDF',
    description:
        "The project enables a conversational interface for document interaction.",
    imagePath: "assets/images/pdf.png",
    technologies: ["Langchain", "OpenAi", "Streamlit"],
    projectUrl: 'https://github.com/Kartik-007/chatPDF',
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
    title: 'replyLLM',
    description:
        "A finetuned LLM specializing in responding to comments",
    imagePath: "assets/images/rbi.png",
    technologies: ["OpenAi", "Fast API", "Python"],
    projectUrl: 'https://github.com/Kartik-007/replyLLM',
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
                launchUrl(Uri.parse('kartik.mehra919@gmail.com'));
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.linkedinIn, color: Color.fromARGB(255, 204, 214, 246),),
              onPressed: () {
                launchUrl(
                    Uri.parse('https://www.linkedin.com/in/kartik-mehra-464108224/'));
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.github, color: Color.fromARGB(255, 204, 214, 246)),
              onPressed: () {
                launchUrl(Uri.parse('https://github.com/Kartik-007'));
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
                childAspectRatio: (1500 / 1500),
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
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
