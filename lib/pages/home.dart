import 'package:flutter/material.dart';

import '../API/API_connection.dart';
import '../model/GetDescription.dart';
import '../model/Storagemodel.dart';

Future<RecipeDescriptionResponseModel?> getD(List<int>? idlist) async {
  dynamic apiResult;
  APIService apiService = APIService();
  apiResult = await apiService.getdescription(
      idlist![0], idlist[1], idlist[2], idlist[3], idlist[4]);
  return apiResult;
}

Future<List<String>?> getI(
    Store store, RecipeDescriptionResponseModel desc) async {
  APIService apiService = APIService();
  List<String>? images = [];
  int n = desc.descriptions.length;
  for (int i = 0; i < n; i++) {
    String url;
    String urlString = desc.descriptions[i].images;
    if (urlString.contains("(")) {
      String urlSubString = urlString.substring(
          urlString.indexOf("(") + 1, urlString.lastIndexOf(")"));
      List<String> urlList = urlSubString.split(", ");
      url = urlList[0];
      images.add(url);
    } else {
      url = urlString;
      images.add(url);
    }
  }
  return images;
}

Future<Store> initializeApp() async {
  Store store = Store();
  dynamic apiResult1;
  APIService apiService = APIService();

  // get popular recipe's id
  List<int>? recipeId1 = [];
  apiResult1 = await apiService.get_recipe_id(40);
  apiResult1.recipeId!.values!.forEach((value) {
    recipeId1.add(value);
  });
  // get popular recipe's description
  store.popularRecipeID = recipeId1;
  store.populardescription = await getD(store.popularRecipeID);
  // Get popular recipe's images
  store.popularimagelist = await getI(store, store.populardescription!);

  //get model based recommended recipe's id
  dynamic apiResult2;
  List<int>? recipeId2 = [];
  apiResult2 = await apiService.get_recipe_id2(13);
  apiResult2.userRatings!.keys!.forEach((value) {
    recipeId2.add(int.parse(value));
  });
  store.modelRecipeID = recipeId2;
  //get model recommended recipe's description
  store.modeldescription = await getD(store.modelRecipeID);
  print(store.modeldescription!.descriptions.length);
  // Get model recipe's images
  store.modelimagelist = await getI(store, store.modeldescription!);

  //get new recipe's id
  dynamic apiResult3;
  apiResult3 = await apiService.get_recipe_id3();
  store.newRecipeID = apiResult3.newRecipes.values.toList();
  //get new  recipe's description
  store.newdescription = await getD(store.newRecipeID);
  // Get new recipe's images
  store.newimagelist = await getI(store, store.newdescription!);
  return store;
}




class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  Store store = Store();

  void iniState() async {
    store = await initializeApp();
    super.initState();
  }

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
                  itemCount: store.modeldescription!.descriptions.length,
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
                                image: NetworkImage(store.modelimagelist![index]
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
                                store.modeldescription!.descriptions[index]
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
                                  store.modeldescription!.descriptions[index]
                                      .name
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
                  itemCount: store.populardescription!.descriptions.length,
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
                                image: NetworkImage(store
                                    .popularimagelist![index]
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
                                store.populardescription!.descriptions[index]
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
                                  store.populardescription!.descriptions[index]
                                      .name
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
                  itemCount: store.newdescription!.descriptions.length,
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
                                image: NetworkImage(store.newimagelist![index]
                                            .replaceAll('"', '') ==
                                        '0'
                                    ? 'https://us.123rf.com/450wm/surfupvector/surfupvector1908/surfupvector190802662/129243509-denied-art-line-icon-censorship-no-photo-no-image-available-reject-or-cancel-concept-vector.jpg?ver=6'
                                    : store.newimagelist![index]
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
                                store.newdescription!.descriptions[index]
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
                                  store.newdescription!.descriptions[index].name
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
