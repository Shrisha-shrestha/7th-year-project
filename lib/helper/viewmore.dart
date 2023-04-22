import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:recipe/pages/category.dart';

class More extends StatefulWidget {
  const More({super.key});

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 15,
              color: Theme.of(context).colorScheme.secondary,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '10 Quick and Easy Recipes to Try Today',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                'Sometimes, you just don\'t have the time or energy to spend hours in the kitchen cooking up a fancy meal. That\'s why we\'ve put together this list of 10 quick and easy recipes that you can whip up in no time. These recipes are perfect for busy weeknights or lazy weekends when you don\'t feel like putting in too much effort but still want a delicious and satisfying meal.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 15.0),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                '1.  One-Pan Chicken and Veggies: ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
              ),
              Text(
                'Toss chicken breasts and your favorite veggies (like broccoli, bell peppers, and carrots) with olive oil and seasonings, then bake in the oven for an easy and healthy one-pan meal.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 15.0),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                '2.  5-Minute Tomato Soup:  ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
              ),
              Text(
                'Combine canned tomatoes, chicken broth, garlic, and herbs in a blender, then blend until smooth. Heat the mixture on the stove until warmed through, then serve with grilled cheese or croutons.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 15.0),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                '3.  Spaghetti Aglio e Olio:   ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
              ),
              Text(
                'Cook spaghetti until al dente, then toss with garlic, olive oil, red pepper flakes, and Parmesan cheese for a simple but flavorful pasta dish.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 15.0),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                '4.  One-Pot Chili:   ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
              ),
              Text(
                'Brown ground beef or turkey in a large pot, then add canned tomatoes, kidney beans, chili powder, and other seasonings. Simmer for 30 minutes for a hearty and satisfying meal.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 15.0),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                '5.  Greek Yogurt Chicken Salad:   ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
              ),
              Text(
                'Mix cooked chicken, Greek yogurt, diced celery and red onion, and your favorite herbs for a protein-packed chicken salad that\'s perfect for sandwiches or salads..',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 15.0),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                '6.  Sheet Pan Nachos:   ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
              ),
              Text(
                'Layer tortilla chips with canned black beans, shredded cheese, diced tomatoes and jalapenos, and bake in the oven for a fun and easy party snack.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 15.0),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                '7.  Quick and Easy Fried Rice:   ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
              ),
              Text(
                'Cook rice according to package directions, then stir fry with veggies like carrots, peas, and onions, and a scrambled egg for a fast and flavorful Asian-inspired dish.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 15.0),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                '8.  Broiled Salmon with Lemon and Herbs:   ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
              ),
              Text(
                'Brush salmon fillets with olive oil and season with lemon juice, garlic, and your favorite herbs. Broil for a few minutes until cooked through for a healthy and delicious seafood dinner.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 15.0),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                '9.  Caprese Salad:   ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
              ),
              Text(
                'Layer sliced tomatoes, fresh mozzarella, and basil leaves, then drizzle with balsamic vinegar and olive oil for a simple and refreshing salad.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 15.0),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                '10.  3-Ingredient Peanut Butter Cookies:   ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
              ),
              Text(
                ' Mix together peanut butter, sugar, and an egg, then bake for 10 minutes for an easy and tasty dessert.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 15.0),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'With these 10 quick and easy recipes, you\'ll have plenty of delicious and satisfying meals to make when you\'re short on time or energy. Try them out today and enjoy a stress-free mealtime!',
                style: TextStyle(fontSize: 15.0),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
