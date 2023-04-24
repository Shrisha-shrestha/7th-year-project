import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../Bloc/CookBook_Bloc/recipe_cubit.dart';
import '../model/GetDescription.dart';
import '../model/firebasecollection.dart';

class Details extends StatefulWidget {
  Details({
    super.key,
    required this.store,
    required this.img,
  });

  final Description store;
  final String img;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> with TickerProviderStateMixin {
  bool _showText = true;
  @override
  Widget build(BuildContext context) {
    TabController _tabcontrol = TabController(length: 2, vsync: this);
    // final scrollController = ScrollController();

    print(widget.store.runtimeType);
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          // controller: scrollController,
          slivers: [
            SliverAppBar(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              expandedHeight: 300.0,
              pinned: true,
              snap: false,
              floating: false,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  titlePadding:
                      EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                  title: Text(
                    widget.store.name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  background: Stack(
                    children: [
                      Container(
                          // margin: const EdgeInsets.only(right: 15.0),
                          width: 1500,
                          height: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20.0),
                                  bottomRight: Radius.circular(20.0)),
                              color: Colors.grey,
                              image: DecorationImage(
                                fit: BoxFit.fitWidth,
                                image: NetworkImage(widget.img == '0'
                                    ? 'https://us.123rf.com/450wm/surfupvector/surfupvector1908/surfupvector190802662/129243509-denied-art-line-icon-censorship-no-photo-no-image-available-reject-or-cancel-concept-vector.jpg?ver=6'
                                    : widget.img.replaceAll('"', '')),
                              ))),

                      Container(
                        height: 300.0,
                        width: 10000.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0)),
                          color: Colors.black.withOpacity(0.2),
                        ),
                      ),
                      // Positioned(
                      //   top: 1,
                      //   left: 1,
                      //   child: IconButton(
                      //     icon: Icon(
                      //       Icons.arrow_back,
                      //       color: Colors.white,
                      //     ),
                      //     onPressed: () => Navigator.pop(context),
                      //   ),
                      // )
                    ],
                  )),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${widget.store.description}',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                              // maxLines: 10,
                              // softWrap: false,
                              // overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    RatingBar(
                                        initialRating: widget
                                                    .store.aggregatedRating ==
                                                'NA'
                                            ? 0.0
                                            : double.parse(
                                                widget.store.aggregatedRating),
                                        itemSize: 20.0,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        ratingWidget: RatingWidget(
                                            full: Icon(Icons.star,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary),
                                            half: Icon(
                                              Icons.star_half,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary,
                                            ),
                                            empty: Icon(
                                              Icons.star_outline,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary,
                                            )),
                                        onRatingUpdate: (value) {}),
                                    Text(
                                      '(${widget.store.reviewCount} Reviews)',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                      maxLines: 1,
                                      softWrap: false,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                                BlocBuilder<CookBookCubit,
                                    Stream<Currentbook?>?>(
                                  builder: (context, state) {
                                    return StreamBuilder(
                                        stream: state,
                                        builder:
                                            (context, AsyncSnapshot snapshot) {
                                          return GestureDetector(
                                            onTap: () async {
                                              context
                                                  .read<CookBookCubit>()
                                                  .updateBook(widget.store,
                                                      snapshot.data.favs ?? []);
                                              setState(() {
                                                _showText = !_showText;
                                              });
                                            },
                                            child: Container(
                                              width: 100,
                                              height: 35,
                                              decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                              ),
                                              child: AnimatedSwitcher(
                                                duration:
                                                    Duration(milliseconds: 500),
                                                transitionBuilder:
                                                    (child, animation) {
                                                  return ScaleTransition(
                                                    scale: animation,
                                                    child: child,
                                                  );
                                                },
                                                child: _showText
                                                    ? Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                          'Add to fav',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                          key: ValueKey('text'),
                                                        ),
                                                      )
                                                    : Icon(
                                                        Icons.check,
                                                        color: Colors.white,
                                                        key: ValueKey('icon'),
                                                      ),
                                              ),
                                            ),
                                          );
                                        });
                                  },
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Servings',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                      "${widget.store.recipeServings}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Prep Time',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                      "${widget.store.prepTime.replaceAll('PT', '')}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Cook Time',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                      "${widget.store.cookTime.replaceAll('PT', '')}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            TabBar(
                              indicatorSize: TabBarIndicatorSize.tab,
                              controller: _tabcontrol,
                              labelPadding:
                                  const EdgeInsets.only(left: 50, right: 50),
                              labelColor:
                                  Theme.of(context).colorScheme.secondary,
                              labelStyle: const TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                              unselectedLabelColor: Colors.grey,
                              isScrollable: true,
                              indicator: UnderlineTabIndicator(
                                borderRadius: BorderRadius.circular(2.0),
                                borderSide: BorderSide(
                                    width: 2,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                              ),
                              tabs: [
                                const Tab(
                                  text: 'Ingredients',
                                ),
                                const Tab(
                                  text: 'Instructions',
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  // left: 15.0,
                                  top: 20.0,
                                  // right: 15.0,
                                  bottom: 20.0),
                              child: SizedBox(
                                height: 1000,
                                width: double.maxFinite,
                                child: TabBarView(
                                    controller: _tabcontrol,
                                    children: [
                                      //ingredients
                                      ListView.builder(
                                        // physics: NeverScrollableScrollPhysics(),
                                        itemCount: widget
                                            .store.recipeIngredientParts
                                            .replaceAll('c(', '')
                                            .replaceAll(')', '')
                                            .replaceAll('"', '')
                                            .split(', ')
                                            .length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8.0),
                                            child: Text(
                                              '${widget.store.recipeIngredientQuantities.replaceAll('c(', '').replaceAll(')', '').replaceAll('"', '').split(', ')[index]}  ${widget.store.recipeIngredientParts.replaceAll('c(', '').replaceAll(')', '').replaceAll('"', '').split(', ')[index][0].toUpperCase()}${widget.store.recipeIngredientParts.replaceAll('c(', '').replaceAll(')', '').replaceAll('"', '').split(', ')[index].substring(1)} ',
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.0),
                                            ),
                                          );
                                        },
                                      ),

                                      //instruction
                                      Text(
                                        widget.store.recipeInstructions
                                            .replaceAll('c(', '')
                                            .replaceAll(')', '')
                                            .replaceAll('"', '')
                                            .replaceAll('",', '')
                                            .replaceAll(RegExp(r'[,\.][,\.]'), '.'),
                                        textAlign: TextAlign.justify,
                                        // maxLines: 20,
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.0),
                                      ),
                                    ]),
                              ),
                            ),
                          ],
                        ),
                      )
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
