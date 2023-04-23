import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/helper/iddiFunctions.dart';
import 'package:shimmer/shimmer.dart';

import '../Bloc/CookBook_Bloc/recipe_cubit.dart';
import '../model/Storagemodel.dart';
import 'detail.dart';

class Rcategory extends StatefulWidget {
  const Rcategory({super.key, required this.cat,required this.fid});
  final String cat;
  final String fid;

  @override
  State<Rcategory> createState() => _RcategoryState();
}

class _RcategoryState extends State<Rcategory> {
  Future<Store>? future;

  @override
  void initState() {
    future = getcrecipes(widget.cat);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: Theme.of(context).colorScheme.secondary,
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 90.0, vertical: 20.0),
                child: Text(
                  widget.cat,
                  style: TextStyle(
                      letterSpacing: 1.5,
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
            ],
          ),
          Expanded(
            child: FutureBuilder(
                future: future,
                builder: (BuildContext ctx, AsyncSnapshot<Store?> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // return Center(
                    //     child: CircularProgressIndicator());
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) => Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Container(
                            margin: const EdgeInsets.only(right: 15.0),
                            width: 370,
                            height: 300,
                            decoration: BoxDecoration(
                              color: Colors.grey[300]!,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    if (snapshot.hasError) {
                      print(snapshot.error.toString());
                      return Text('error');
                    } else if (snapshot.hasData) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: 5,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      BlocProvider<CookBookCubit>(
                                    create: (_) =>
                                        CookBookCubit(widget.fid.toString()),
                                    child: Details(
                                      store: snapshot.data!.categorydescription!
                                          .descriptions[index],
                                      img: snapshot
                                          .data!.categoryimagelist![index],
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: Container(
                                // color: Theme.of(context).colorScheme.secondary,
                                color: Colors.white,
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  children: [
                                    Stack(children: [
                                      Container(
                                        // margin: const EdgeInsets.only(right: 15.0),
                                        width: 370,
                                        height: 280,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: Colors.grey,
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(snapshot
                                                          .data!
                                                          .categoryimagelist![
                                                              index]
                                                          .replaceAll(
                                                              '"', '') ==
                                                      '0'
                                                  ? 'https://us.123rf.com/450wm/surfupvector/surfupvector1908/surfupvector190802662/129243509-denied-art-line-icon-censorship-no-photo-no-image-available-reject-or-cancel-concept-vector.jpg?ver=6'
                                                  : snapshot.data!
                                                      .categoryimagelist![index]
                                                      .replaceAll('"', '')),
                                            )),
                                      ),
                                      Positioned(
                                        bottom: 1,
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                              right: 15.0),
                                          width: 370,
                                          height: 140,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color:
                                                Colors.black.withOpacity(0.5),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 1,
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                height: 3.0,
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .access_time_filled_rounded,
                                                    size: 15.0,
                                                    color: Colors.white,
                                                  ),
                                                  SizedBox(
                                                    width: 5.0,
                                                  ),
                                                  Text(
                                                    snapshot
                                                        .data!
                                                        .categorydescription!
                                                        .descriptions[index]
                                                        .totalTime
                                                        .replaceAll("PT", ''),
                                                    style: const TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 3.0,
                                              ),
                                              SizedBox(
                                                width: 350,
                                                child: Text(
                                                  snapshot
                                                      .data!
                                                      .categorydescription!
                                                      .descriptions[index]
                                                      .name
                                                      .replaceAll('&amp;', '&'),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 3.0,
                                              ),
                                              SizedBox(
                                                width: 320,
                                                child: Text(
                                                  textAlign: TextAlign.justify,
                                                  snapshot
                                                      .data!
                                                      .categorydescription!
                                                      .descriptions[index]
                                                      .description
                                                      .replaceAll('&amp;', '&'),
                                                  maxLines: 3,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ]),
                                  ],
                                )),
                          );
                        },
                      );
                    }
                  }
                  return SizedBox();
                }),
          ),
        ],
      ),
    ));
  }
}
