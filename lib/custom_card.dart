// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:url_launcher/url_launcher.dart'; // Ensure this import is correct for URL launching

// class CustomCard extends StatelessWidget {
//   final String title;
//   final String description;
//   final String imagePath; // Changed from imageUrl to imagePath
//   final List<String> technologies;
//   final String projectUrl;

//   const CustomCard({
//     Key? key,
//     required this.title,
//     required this.description,
//     required this.imagePath, // Changed parameter name to reflect its purpose
//     required this.technologies,
//     required this.projectUrl,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final double logoSize = 24.0;


//     List<Widget> technologyTexts = [];
//     for (var i = 0; i < technologies.length; i++) {
//       technologyTexts.add(
//         Text(
//           technologies[i],
//           style: TextStyle(
//             color: Color.fromARGB(255, 96, 242, 212),
//             fontWeight: FontWeight.w200,
//           ),
//         ),
//       );
//       // Add a divider unless it's the last item
//       if (i < technologies.length - 1) {
//         technologyTexts.add(
//           Text(
//             ' | ',
//             style: TextStyle(
//               color: Color.fromARGB(255, 96, 242, 212),
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         );
//       }
//     }
//     // Using MediaQuery for responsive width
//     double screenWidth = MediaQuery.of(context).size.width;
//     double cardWidth = screenWidth > 500 ? 500 : screenWidth * 0.9;

//     return Center(
//       child: ConstrainedBox(
//         constraints: BoxConstraints(maxWidth: cardWidth, minWidth: cardWidth),
//         child: Card(
//           clipBehavior: Clip.antiAlias,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(30.0),
//           ),
//           child: Container(
//             height: 500,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 opacity: 0.75,
//                 image: AssetImage(imagePath), // Changed to AssetImage
//                 fit: BoxFit.cover,
//                 alignment: FractionalOffset.center,
//               ),
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SizedBox(height: 180),
//                 ConstrainedBox(
//                   constraints: BoxConstraints(maxWidth: 275),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Color.fromARGB(255, 16, 33, 62).withOpacity(0.9),
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(4.0),
//                           child: Text(
//                             title,
//                             style: TextStyle(
//                               fontSize: 24,
//                               color: Color.fromARGB(255, 204, 214, 246),
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                         Row(
//                             mainAxisSize: MainAxisSize.min, // To prevent the Row from expanding to the max width of the card
//                             children: technologyTexts,
//                           ),
//                         Padding(
//                           padding: const EdgeInsets.all(6.0),
//                           child: Text(
//                             description,
//                             style: TextStyle(
//                                 fontSize: 16,
//                                 color: Color.fromARGB(255, 136, 146, 175)),
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
                        
//                       ],
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: ElevatedButton.icon(
//                     label: Text('Know more'),
//                     icon: Icon(Icons.arrow_forward),
//                     onPressed: () => launchUrl(Uri.parse(projectUrl)),
//                     style: ElevatedButton.styleFrom(
//                       foregroundColor: Color.fromARGB(255, 96,242,212),
//                       backgroundColor: Color.fromARGB(255, 16, 33, 62).withOpacity(0.9),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(18.0),
//                       ),
//                       padding: EdgeInsets.symmetric(
//                           horizontal: 20.0, vertical: 10.0),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart'; // Ensure this import is correct for URL launching

class CustomCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final List<String> technologies;
  final String projectUrl;

  const CustomCard({
    Key? key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.technologies,
    required this.projectUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> technologyTexts = [];
    for (var i = 0; i < technologies.length; i++) {
      technologyTexts.add(
        Text(
          technologies[i],
          style: TextStyle(
            color: Color.fromARGB(255, 96, 242, 212),
            fontWeight: FontWeight.w200,
          ),
        ),
      );
      if (i < technologies.length - 1) {
        technologyTexts.add(
          Text(
            ' | ',
            style: TextStyle(
              color: Color.fromARGB(255, 96, 242, 212),
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      }
    }

    return Center(
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Container(
          height: 600,
          width: 600,
          decoration: BoxDecoration(
            image: DecorationImage(
              opacity: 0.75,
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
              alignment: FractionalOffset.center,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center the column itself
            children: [
              Spacer(), // Use Spacer to evenly distribute space
              Container(
                width: 200, // Define a fixed width for consistency
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 16, 33, 62).withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.all(10), // Internal padding within the container
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Allow column to size to its children
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 204, 214, 246),
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min, // Ensure the row doesn't stretch
                      children: technologyTexts,
                    ),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(255, 136, 146, 175),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Spacer(), // Additional spacer to push everything to center
              ElevatedButton.icon(
                label: Text('Know more'),
                icon: Icon(Icons.arrow_forward),
                onPressed: () => launchUrl(Uri.parse(projectUrl)),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color.fromARGB(255, 96, 242, 212),
                  backgroundColor: Color.fromARGB(255, 16, 33, 62).withOpacity(0.9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  
                ),
                
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

