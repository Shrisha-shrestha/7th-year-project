import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/model/GetDescription.dart';
import 'package:recipe/model/firebasecollection.dart';

import '../../../pages/detail.dart';
import '../Bloc/CookBook_Bloc/recipe_cubit.dart';
import '../Splash/loading.dart';

class CookBook extends StatefulWidget {
  const CookBook({super.key, required this.fid});
  final String fid;

  @override
  State<CookBook> createState() => _CookBookState();
}

class _CookBookState extends State<CookBook> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(20.0),
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'My Cookbook',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  SizedBox(
                    height: 2.0,
                  ),
                  Text(
                    'What do you want to cook today ?',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<CookBookCubit, Stream<Currentbook?>?>(
                  builder: (context, state) {
                if (state == null) {
                  print('a');
                  return Center(
                      child: Text(
                    'Empty state',
                  ));
                } else {
                  // return Search();
                  print('b');
                  return StreamBuilder(
                    stream: state,
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        print('c');
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data.favs.length,
                            itemBuilder: (BuildContext context, int index) {
                              List<String>? images = [];
                              int n = snapshot.data.favs.length;
                              for (int i = 0; i < n; i++) {
                                String url;
                                String urlString =
                                    snapshot.data.favs[i]['Images'];
                                if (urlString.contains("(")) {
                                  String urlSubString = urlString.substring(
                                      urlString.indexOf("(") + 1,
                                      urlString.lastIndexOf(")"));
                                  List<String> urlList =
                                      urlSubString.split(", ");
                                  url = urlList[0];
                                  images.add(url);
                                } else {
                                  url = urlString;
                                  images.add(url);
                                }
                              }
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 15.0),
                                child: ListTile(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            BlocProvider<CookBookCubit>(
                                          create: (_) => CookBookCubit(
                                              widget.fid.toString()),
                                          child: Details(
                                            store: Description.fromJson(
                                                snapshot.data.favs[index]),
                                            img: images[index],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(25.0)),
                                  contentPadding: EdgeInsets.all(10.0),
                                  title: Text(
                                      '${snapshot.data.favs[index]['Name']}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18.0)),
                                  subtitle: Text(
                                    snapshot.data.favs[index]['RecipeCategory'],
                                  ),
                                  leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(25.0),
                                    child: Image.network(
                                      images[index].replaceAll('"', ''),
                                      height: 190.0,
                                      width: 80.0,
                                    ),
                                  ),
                                  trailing: IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () {
                                        context
                                            .read<CookBookCubit>()
                                            .removeFrmBook(
                                                index, snapshot.data.favs);
                                        // context.read<CookBookCubit>().updateData(snapshot.data.userid,widget.store,snapshot.data.favs);
                                      }
                                      // context.read<RecipeCubit>().remove(index),
                                      ),
                                  tileColor: Theme.of(context)
                                      .colorScheme
                                      .secondary
                                      .withAlpha(index * 15),
                                ),
                              );
                            });
                      } else if (snapshot.hasError) {
                        print('d');
                        return Loading();
                      } else {
                        return Loading();
                      }
                    },
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
