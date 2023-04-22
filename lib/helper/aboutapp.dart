import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text('About'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              Text(
                'Welcome to our app, a recipe finder and recommendation tool created by Anju Tamang, Khusbhu Chaulagain, and Shrisha Shrestha. As a group project for our 7th year, we have worked hard to create a platform that offers users a seamless experience in discovering new recipes and bookmarking their favorites.\n\nOne of the key features of our app is the recommendation system, which uses the SVD algorithm to suggest personalized recipes to users based on their past searches and bookmarked recipes. This means that every time you log in to our app, you\'ll see a selection of recipes that are tailored to your tastes and preferences.\n\nIn addition to the recommendation system, our app allows users to search for recipes based on specific ingredients or dietary restrictions. We understand that everyone has unique dietary needs and preferences, so we\'ve made sure to include a wide variety of recipes that cater to different lifestyles.\n\nFor added convenience, our app also includes a bookmarking feature that allows users to save their favorite recipes for easy access later. You can also sign up and login to our app to store your personal information and keep track of your bookmarked recipes across devices.\n\nWe take user privacy and security seriously, and have implemented measures to ensure that all personal information is kept safe and secure.\n\nAs a group, we\'re incredibly proud of the work we\'ve put into creating this app, and we\'re excited to share it with you. Whether you\'re an experienced cook looking for new inspiration, or a beginner looking to improve your culinary skills, our app has something for everyone. So why not give it a try and discover your new favorite recipe today!',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
