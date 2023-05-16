import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/Bloc/Myrecipes_bloc/mrecipe_cubit.dart';
import 'package:recipe/model/GetDescription.dart';
import 'package:recipe/model/firebasecollection.dart';

import '../../../pages/detail.dart';
import '../Bloc/CookBook_Bloc/recipe_cubit.dart';
import '../Splash/loading.dart';

class MyRecipes extends StatefulWidget {
  const MyRecipes({super.key, required this.fid});
  final String fid;

  @override
  State<MyRecipes> createState() => _MyRecipesState();
}

class _MyRecipesState extends State<MyRecipes> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
          ),
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
                      'My Recipes',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: BlocBuilder<MyRecipeCubit, Stream<CurrentMyrecipe?>?>(
                    builder: (context, state) {
                  if (state == null) {
                    print('a');
                    return Center(
                        child: Text(
                      'Empty state',
                    ));
                  } else {
                    print('b');
                    return StreamBuilder(
                      stream: state,
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          print('c');

                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data.mrecipes.length,
                              itemBuilder: (BuildContext context, int index) {
                                String a = snapshot
                                    .data.mrecipes[index]['Image']
                                    .substring(6);
                                String b = a.substring(1, a.length - 1);
                                print(b);
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 15.0),
                                  child: ListTile(
                                    onTap: () {},
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25.0)),
                                    contentPadding: EdgeInsets.all(10.0),
                                    title: Text(
                                        '${snapshot.data.mrecipes[index]['Name']}',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18.0)),
                                    subtitle: Text(
                                      snapshot.data.mrecipes[index]
                                          ['Description'],
                                    ),
                                    leading: ClipRRect(
                                      borderRadius: BorderRadius.circular(25.0),
                                      child: Image(
                                        image: FileImage(
                                          File(b),
                                        ),
                                        height: 190.0,
                                        width: 80.0,
                                      ),
                                    ),
                                    trailing: IconButton(
                                        icon: Icon(Icons.delete),
                                        onPressed: () {
                                          context.read<MyRecipeCubit>().remove(
                                              index, snapshot.data.mrecipes);
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
                          print(snapshot.error);
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
      ),
    );
  }
}
