import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:projecthealthapp/models/Edamam.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher package

class RecipeDetailScreen extends StatelessWidget {
  final EdamamRecipeModel recipe;

  RecipeDetailScreen({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              recipe.image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
            ),
            SizedBox(height: 16),
            Text(
              'Nutritional value:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Ingredients:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: recipe.ingredients
                  .map((ingredient) => Text(
                        '• $ingredient',
                        style: TextStyle(fontSize: 16),
                      ))
                  .toList(),
            ),
            SizedBox(height: 16),
            Text(
              'Steps:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Due to copyright we can only provide the url:\n',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black, // Adjust text color as needed
                    ),
                    children: [
                      TextSpan(
                        text: recipe.url,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue, // Style link text
                          decoration:
                              TextDecoration.underline, // Underline link text
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            if (await canLaunchUrl(Uri.parse(recipe.url))) {
                              await launchUrl(Uri.parse(recipe.url));
                            } else {
                              throw 'Could not launch URL';
                            }
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
