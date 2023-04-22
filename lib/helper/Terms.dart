import 'package:flutter/material.dart';

class Terms extends StatelessWidget {
  const Terms({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.secondary,

        title: Text('Terms and Conditions'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: const [
            Text(
              '1. Introduction',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              '1.1  Welcome to our mobile application. By accessing or using the app, you agree to be bound by these terms and conditions.',
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              '2. Use of the App',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              '2.1  The app is intended for personal and non-commercial use only. You may not use the app for any unlawful purpose or in any way that violates these terms and conditions.',
              textAlign: TextAlign.justify,
            ),
            Text(
              '2.2  You are responsible for maintaining the confidentiality of your account information, including your login credentials. You agree to notify us immediately if you become aware of any unauthorized use of your account.',
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              '3. Intellectual Property',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              '3.1  The app and its contents, including but not limited to text, graphics, images, logos, and software, are protected by intellectual property laws and are owned by us or our licensors.',
              textAlign: TextAlign.justify,
            ),
            Text(
              '3.2  You may not reproduce, modify, distribute, or otherwise use any of the app\'s content without our prior written consent.',
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              '4. Disclaimer of Warranties',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              '4.1  The app is provided on an "as is" and "as available" basis, without any warranties of any kind, whether express or implied.',
              textAlign: TextAlign.justify,
            ),
            Text(
              '4.2  We do not guarantee that the app will be error-free or uninterrupted, or that any defects will be corrected.',
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              '5. Limitation of Liability',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              '5.1  To the fullest extent permitted by law, we shall not be liable for any direct, indirect, incidental, special, or consequential damages arising out of or in connection with your use of the app.',
              textAlign: TextAlign.justify,
            ),
            Text(
              '5.2  5.2 We shall not be liable for any loss or damage to your data or devices resulting from your use of the app.',
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    ));
  }
}
