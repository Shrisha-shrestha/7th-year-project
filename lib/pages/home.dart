import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabcontrol = TabController(length: 3, vsync: this);
    return SingleChildScrollView(
      child: Expanded(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset('assets/home.jpg'),
                Container(
                  alignment: Alignment.bottomLeft,
                  color: Colors.black.withOpacity(0.3),
                  height: 240.0,
                  width: MediaQuery.of(context).size.width,
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.13,
                  left: 5.0,
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '20 Weekend \nDinner Recipes',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Best Recipes for Laid-Back Weekends',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  backgroundColor: Colors.white),
                              onPressed: () {},
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.0, vertical: 0.0),
                                child: Text(
                                  'View More',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              controller: _tabcontrol,
              labelPadding: const EdgeInsets.only(left: 30, right: 30),
              labelColor: Theme.of(context).colorScheme.secondary,
              labelStyle: const TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelColor: Colors.grey,
              isScrollable: true,
              indicator: UnderlineTabIndicator(
                borderRadius: BorderRadius.circular(2.0),
                borderSide: BorderSide(
                    width: 2.5,
                    color: Theme.of(context).colorScheme.secondary),
              ),
              tabs: [
                const Tab(
                  text: 'Featured',
                ),
                const Tab(
                  text: 'Popular',
                ),
                const Tab(
                  text: 'New',
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, top: 20.0, right: 15.0, bottom: 20.0),
              child: SizedBox(
                height: 150,
                width: double.maxFinite,
                child: TabBarView(
                  controller: _tabcontrol,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 15.0),
                              width: 200,
                              height: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage('assets/splash.jpg'),
                                  )),
                            ),
                            Positioned(
                              bottom: 20.0,
                              right: 20.0,
                              child: GestureDetector(
                                onTap: () {
                                  //   setState(() {
                                  //     selectedindex1=index;
                                  //   });},
                                  // onDoubleTap:(){
                                  //   setState(() {
                                  //     selectedindex1=8;
                                  //   });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(2),
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.white,
                                    ),
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: const Icon(
                                    Icons.favorite_border_rounded,
                                    size: 20.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 10,
                              left: 10,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 3.0,
                                  ),
                                  Text(
                                    'Whole food',
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 3.0,
                                  ),
                                  Text(
                                    'Tofu Noodle Soup',
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: ((context, index) {
                          return Stack(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 15.0),
                                width: 200,
                                height: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage('assets/soup.jpg'),
                                    )),
                              ),
                              Positioned(
                                bottom: 20.0,
                                right: 20.0,
                                child: GestureDetector(
                                  onTap: () {
                                    //   setState(() {
                                    //     selectedindex1=index;
                                    //   });},
                                    // onDoubleTap:(){
                                    //   setState(() {
                                    //     selectedindex1=8;
                                    //   });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(2),
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                      ),
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    child: const Icon(
                                      Icons.favorite_border_rounded,
                                      size: 20.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 10,
                                left: 10,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 3.0,
                                    ),
                                    Text(
                                      'Whole food',
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 3.0,
                                    ),
                                    Text(
                                      'Tofu Noodle Soup',
                                      style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        })),
                    ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: ((context, index) {
                          return Stack(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 15.0),
                                width: 200,
                                height: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage('assets/login.jpg'),
                                    )),
                              ),
                              Positioned(
                                bottom: 20.0,
                                right: 20.0,
                                child: GestureDetector(
                                  onTap: () {
                                    //   setState(() {
                                    //     selectedindex1=index;
                                    //   });},
                                    // onDoubleTap:(){
                                    //   setState(() {
                                    //     selectedindex1=8;
                                    //   });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(2),
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                      ),
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    child: const Icon(
                                      Icons.favorite_border_rounded,
                                      size: 20.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 10,
                                left: 10,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 3.0,
                                    ),
                                    Text(
                                      'Whole food',
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 3.0,
                                    ),
                                    Text(
                                      'Tofu Noodle Soup',
                                      style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        })),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                shrinkWrap: true,
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 15.0),
                          width: 200,
                          height: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/splash.jpg'),
                              )),
                        ),
                        Positioned(
                          bottom: 20.0,
                          right: 20.0,
                          child: GestureDetector(
                            onTap: () {
                              //   setState(() {
                              //     selectedindex1=index;
                              //   });},
                              // onDoubleTap:(){
                              //   setState(() {
                              //     selectedindex1=8;
                              //   });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                ),
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: const Icon(
                                Icons.favorite_border_rounded,
                                size: 20.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          left: 10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 3.0,
                              ),
                              Text(
                                'Whole food',
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 3.0,
                              ),
                              Text(
                                'Tofu Noodle Soup',
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
