import 'package:flutter/material.dart';
import 'package:recipe/helper/iddiFunctions.dart';
import '../model/SearchRecipe.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController editingController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool _isVisible = false;

  Future<SearchResponseModel?>? future;

  // @override
  // void initState() {
  //   future = getsearchresults('soup');
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Search',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Card(
                                elevation: 4,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.search),
                                        onPressed: () {
                                          // startSearch(searchTextController.text);
                                          final currentFocus =
                                              FocusScope.of(context);
                                          if (!currentFocus.hasPrimaryFocus) {
                                            currentFocus.unfocus();
                                          }
                                        },
                                      ),
                                      const SizedBox(
                                        width: 6.0,
                                      ),
                                      Container(
                                        height: 40.0,
                                        width: 300.0,
                                        child: TextField(
                                          controller: editingController,
                                          onSubmitted: (String? value) async {
                                            print('kk');
                                            // searchrequestModel.vehicle_number = value;
                                            value != null
                                                ? await (future =
                                                    getresults(value))
                                                : null;

                                            print('ok');
                                          },
                                          keyboardType: TextInputType.text,
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption!
                                              .copyWith(fontSize: 18.0),
                                          decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Search'),
                                          autofocus: false,
                                          textInputAction: TextInputAction.done,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 25.0,
                              ),
                              FutureBuilder(
                                  future: future,
                                  builder: (BuildContext ctx,
                                      AsyncSnapshot<SearchResponseModel?>
                                          snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Center(
                                          child: CircularProgressIndicator());
                                    } else {
                                      if (snapshot.hasError) {
                                        print(snapshot.error.toString());
                                        return Text('error');
                                      } else if (snapshot.hasData) {
                                        print(snapshot.data!.results);
                                        print(
                                            snapshot.data!.results.runtimeType);

                                        return Text(
                                            snapshot.data!.results.toString());
                                      }
                                    }
                                    return SizedBox();
                                  }),
                            ],
                          ),
                        ),
                      ),
                    ]))));
  }
}
