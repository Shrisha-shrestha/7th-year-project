import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/model/GetDescription.dart';
import '../CookBook_Bloc/exporter.dart';
import '../../pages/detail.dart';

class RecipeView extends StatelessWidget {
  const RecipeView({super.key});

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
              child: BlocBuilder<RecipeCubit, List<Description>>(
                builder: (context, state) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.length,
                      itemBuilder: (BuildContext context, int index) {
                        List<String>? images = [];
                        int n = state.length;
                        for (int i = 0; i < n; i++) {
                          String url;
                          String urlString = state[i].images;
                          if (urlString.contains("(")) {
                            String urlSubString = urlString.substring(
                                urlString.indexOf("(") + 1,
                                urlString.lastIndexOf(")"));
                            List<String> urlList = urlSubString.split(", ");
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
                                  builder: (context) => Details(
                                    store: state[index],
                                    img: images[index],
                                  ),
                                ),
                              );
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0)),
                            contentPadding: EdgeInsets.all(10.0),
                            title: Text('${state[index].name}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18.0)),
                            subtitle: Text(
                              state[index].recipeCategory,
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
                              onPressed: () =>
                                  context.read<RecipeCubit>().remove(index),
                            ),
                            tileColor: Theme.of(context)
                                .colorScheme
                                .secondary
                                .withAlpha(index * 15),
                          ),
                        );
                      });
                },
              ),
            ),
          ],
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            // FloatingActionButton(
            //   child: const Icon(Icons.add),
            //   onPressed: () => context.read<RecipeCubit>().add(),
            // ),
            // const SizedBox(height: 8),
            // FloatingActionButton(
            //   child: const Icon(Icons.remove),
            //   onPressed: () => context.read<RecipeCubit>().remove(),
            // ),
          ],
        ),
      ),
    );
  }
}
