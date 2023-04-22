import 'package:flutter/material.dart';

class Privacy extends StatelessWidget {
  const Privacy({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.secondary,

        title: Text('Privacy Policy'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: const [
            Text(
              '1. Collection of Personal Information',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              '1.1  We may collect personal information from you, such as your name, email address, and location, in order to provide you with the app\'s services.',
              textAlign: TextAlign.justify,
            ),
            Text(
              '1.2   We may also collect non-personal information, such as your device type and operating system, for analytical and statistical purposes.',
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              '2. Use of Personal information',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              '2.1  We will use your personal information only for the purposes for which it was collected, such as to provide you with the app\'s services and to communicate with you.',
              textAlign: TextAlign.justify,
            ),
            Text(
              '2.2  We may also use your personal information to improve the app\'s functionality and to conduct research and analysis.',
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              '3. Sharing of Personal Information',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              '3.1  We will not share your personal information with any third parties without your consent, except as required by law or as necessary to provide you with the app\'s services.',
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              '4. Security of Personal Information',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              '4.1  We take reasonable measures to protect your personal information from unauthorized access or disclosure.',
              textAlign: TextAlign.justify,
            ),
            Text(
              '4.2  However, we cannot guarantee the security of your personal information, and you acknowledge and accept this risk.',
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              '5. Retention of Personal Information',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              '5.1  We will retain your personal information for as long as necessary to provide you with the app\'s services, or as required by law.',
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              '6. Changes to this Privacy Policy',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              '6.1  We reserve the right to amend this privacy policy at any time. Any changes will be effective immediately upon posting the updated policy on the app.',
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    ));
  }
}
