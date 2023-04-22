import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:recipe/pages/category.dart';

class More extends StatefulWidget {
  const More({super.key});

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  List<String> head = [
    '1.  One-Pan Chicken and Veggies:',
    '2.  5-Minute Tomato Soup:',
    '3.  Spaghetti Aglio e Olio:',
    '4.  One-Pot Chili:',
    '5.  Greek Yogurt Chicken Salad:',
    '6.  Sheet Pan Nachos:',
    '7.  Quick and Easy Fried Rice:',
    '8.  Broiled Salmon with Lemon',
    '9.  Caprese Salad:',
    '10.  3-Ingredient Peanut Cookies:',
  ];
  List<String> body = [
    'Toss chicken breasts and your favorite veggies (like broccoli, bell peppers, and carrots) with olive oil and seasonings, then bake in the oven for an easy and healthy one-pan meal.',
    'Combine canned tomatoes, chicken broth, garlic, and herbs in a blender, then blend until smooth. Heat the mixture on the stove until warmed through, then serve with grilled cheese or croutons.',
    'Cook spaghetti until al dente, then toss with garlic, olive oil, red pepper flakes, and Parmesan cheese for a simple but flavorful pasta dish.',
    'Brown ground beef or turkey in a large pot, then add canned tomatoes, kidney beans, chili powder, and other seasonings. Simmer for 30 minutes for a hearty and satisfying meal.',
    'Mix cooked chicken, Greek yogurt, diced celery and red onion, and your favorite herbs for a protein-packed chicken salad that\'s perfect for sandwiches or salads..',
    'Layer tortilla chips with canned black beans, shredded cheese, diced tomatoes and jalapenos, and bake in the oven for a fun and easy party snack.',
    'Cook rice according to package directions, then stir fry with veggies like carrots, peas, and onions, and a scrambled egg for a fast and flavorful Asian-inspired dish.',
    'Brush salmon fillets with olive oil and season with lemon juice, garlic, and your favorite herbs. Broil for a few minutes until cooked through for a healthy and delicious seafood dinner.',
    'Layer sliced tomatoes, fresh mozzarella, and basil leaves, then drizzle with balsamic vinegar and olive oil for a simple and refreshing salad.',
    'Mix together peanut butter, sugar, and an egg, then bake for 10 minutes for an easy and tasty dessert.',
  ];
  List<String> image = [
    'a.jpg',
    'b.jpg',
    'c.jpg',
    'd.jpg',
    'e.jpg',
    'f.jpg',
    'g.jpg',
    'h.jpg',
    'i.jpg',
    'j.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          '10 Quick and Easy Recipes to Try Today',
          style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.bold,
              fontSize: 18.0),
        ),
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
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        index.isEven == true
                            ? Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        head.elementAt(index),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.0),
                                      ),
                                      Container(
                                        width: 250.0,
                                        child: Text(
                                          body.elementAt(index),
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(fontSize: 15.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12.0),
                                    child: Container(
                                      height: 150,
                                      width: 110,
                                      child: Image.asset(
                                        "assets/${image.elementAt(index)}",
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 12.0),
                                    child: Container(
                                      child: Image.asset(
                                          "assets/${image.elementAt(index)}",
                                          height: 150,
                                          width: 110),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        head.elementAt(index),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.0),
                                      ),
                                      Container(
                                        width: 250.0,
                                        child: Text(
                                          body.elementAt(index),
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(fontSize: 15.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                        SizedBox(
                          height: 8.0,
                        ),
                      ],
                    );
                  }),
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
