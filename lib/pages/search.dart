import 'package:flutter/material.dart';
import 'package:recipe/helper/iddiFunctions.dart';
import 'package:shimmer/shimmer.dart';
import '../API/API_connection.dart';
import '../model/Storagemodel.dart';
import 'detail.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController editingController = TextEditingController();


  Future<Store>? future;


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
                        child: Column(
                          children: [
                            Card(
                              elevation: 4,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10.0))),
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
                                    height: 30.0,
                                    width: 300.0,
                                    child: TextField(
                                      controller: editingController,
                                      onSubmitted: (String? value) async {
                                        value != null
                                            ? future = getresults(value)
                                            : null;
                                      },
                                      keyboardType: TextInputType.text,
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(fontSize: 18.0),
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        // hintText: 'Search'
                                      ),
                                      autofocus: false,
                                      textInputAction: TextInputAction.done,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 25.0,
                            ),
                            FutureBuilder(
                                future: future,
                                builder: (BuildContext ctx,
                                    AsyncSnapshot<Store?> snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    // return Center(
                                    //     child: CircularProgressIndicator());
                                    return Expanded(
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: 5,
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (context, index) =>
                                            Shimmer.fromColors(
                                          baseColor: Colors.grey[300]!,
                                          highlightColor: Colors.grey[100]!,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              margin: const EdgeInsets.only(
                                                  right: 15.0),
                                              width: 200,
                                              height: 170,
                                              decoration: BoxDecoration(
                                                color: Colors.grey[300]!,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
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
                                      return Expanded(
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: 5,
                                          scrollDirection: Axis.vertical,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        Details(
                                                      store: snapshot
                                                          .data!
                                                          .searchdescription!
                                                          .descriptions[index],
                                                      img: snapshot.data!
                                                              .searchimagelist![
                                                          index],
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            right: 15.0),
                                                    width: 200,
                                                    height: 170,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        color: Colors.grey,
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: NetworkImage(
                                                              snapshot
                                                                  .data!
                                                                  .searchimagelist![
                                                                      index]
                                                                  .replaceAll(
                                                                        '"',
                                                                        '') ==
                                                                '0'
                                                            ? 'https://us.123rf.com/450wm/surfupvector/surfupvector1908/surfupvector190802662/129243509-denied-art-line-icon-censorship-no-photo-no-image-available-reject-or-cancel-concept-vector.jpg?ver=6'
                                                            : snapshot
                                                                .data!
                                                                .searchimagelist![
                                                                    index]
                                                                .replaceAll(
                                                                    '"', '')),
                                                        )),
                                                  ),
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            right: 15.0),
                                                    width: 200,
                                                    height: 170,
                                                    decoration: BoxDecoration(
                                                        color: Colors.black
                                                            .withOpacity(0.18),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20)),
                                                  ),
                                                  Positioned(
                                                    top: 10,
                                                    left: 10,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const SizedBox(
                                                          height: 3.0,
                                                        ),
                                                        Text(
                                                          snapshot
                                                              .data!
                                                              .searchdescription!
                                                              .descriptions[
                                                                  index]
                                                              .recipeCategory,
                                                          style:
                                                              const TextStyle(
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
                                                            snapshot
                                                                .data!
                                                                .searchdescription!
                                                                .descriptions[
                                                                    index]
                                                                .name
                                                                .replaceAll(
                                                                    '&amp;',
                                                                    '&'),
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 22,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    }
                                  }
                                  return SizedBox();
                                }),
                          ],
                        ),
                      ),
                    ]))));
  }
}
