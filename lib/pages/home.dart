import 'package:flutter/material.dart';

import '../model/Storagemodel.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.store});
  final Store store;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabcontrol = TabController(length: 3, vsync: this);
    return Column(
      children: [
        Stack(
          children: [
            Image.asset(
              'assets/home.jpg',
              height: MediaQuery.of(context).size.height * 0.33,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitWidth,
            ),
            Container(
              alignment: Alignment.bottomLeft,
              color: Colors.black.withOpacity(0.3),
              height: MediaQuery.of(context).size.height * 0.33,
              width: MediaQuery.of(context).size.width,
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.14,
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
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black),
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
                width: 2, color: Theme.of(context).colorScheme.secondary),
          ),
          tabs: [
            const Tab(
              text: 'Recommended',
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
            height: 170,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabcontrol,
              children: [
                //recommended
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.store.modeldescription!.descriptions.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 15.0),
                          width: 200,
                          height: 170,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(widget
                                    .store.modelimagelist![index]
                                    .replaceAll('"', '')),
                              )),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 15.0),
                          width: 200,
                          height: 170,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.18),
                              borderRadius: BorderRadius.circular(20)),
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
                                widget.store.modeldescription!
                                    .descriptions[index].recipeCategory,
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 3.0,
                              ),
                              SizedBox(
                                width: 190,
                                child: Text(
                                  widget.store.modeldescription!
                                      .descriptions[index].name
                                      .replaceAll('&amp;', '&'),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),

                //popular
                ListView.builder(
                  shrinkWrap: true,
                  itemCount:
                      widget.store.populardescription!.descriptions.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 15.0),
                          width: 200,
                          height: 170,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(widget
                                    .store.popularimagelist![index]
                                    .replaceAll('"', '')),
                              )),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 15.0),
                          width: 200,
                          height: 170,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20)),
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
                                widget.store.populardescription!
                                    .descriptions[index].recipeCategory,
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 3.0,
                              ),
                              SizedBox(
                                width: 190,
                                child: Text(
                                  widget.store.populardescription!
                                      .descriptions[index].name
                                      .replaceAll('&amp;', '&'),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),

                //new
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.store.newdescription!.descriptions.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 15.0),
                          width: 200,
                          height: 170,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(widget
                                            .store.newimagelist![index]
                                            .replaceAll('"', '') ==
                                        '0'
                                    ? 'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg?20200913095930'
                                    : widget.store.newimagelist![index]
                                        .replaceAll('"', '')),
                              )),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 15.0),
                          width: 200,
                          height: 170,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20)),
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
                                widget.store.newdescription!.descriptions[index]
                                    .recipeCategory,
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 3.0,
                              ),
                              SizedBox(
                                width: 190,
                                child: Text(
                                  widget.store.newdescription!
                                      .descriptions[index].name
                                      .replaceAll('&amp;', '&')
                                      .replaceAll('&rsquo;', '\''),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
