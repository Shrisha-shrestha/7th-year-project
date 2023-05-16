import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:recipe/Bloc/Myrecipes_bloc/mrecipe_cubit.dart';
import 'package:recipe/customwidgets/myrecipetextfield.dart';
import 'package:recipe/model/firebasecollection.dart';

import '../customwidgets/myrecipeimage.dart';

class AddRecipes extends StatefulWidget {
  const AddRecipes({super.key});

  @override
  State<AddRecipes> createState() => _AddRecipesState();
}

class _AddRecipesState extends State<AddRecipes> {
  //Name	Description	Image	Servings	PrepTime	CookTime	Ingredients	Instructions
  AutovalidateMode val = AutovalidateMode.disabled;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final namecontroller = TextEditingController();
  final Descriptioncontroller = TextEditingController();
  final Imagecontroller = TextEditingController();
  final Servingscontroller = TextEditingController();
  final PrepTimecontroller = TextEditingController();
  final CookTimecontroller = TextEditingController();
  final Ingredientscontroller = TextEditingController();
  final Instructionscontroller = TextEditingController();
  File? image;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(
          'Add a recipe',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: SingleChildScrollView(
              child: Form(
            key: _formkey,
            child: Column(
              children: [
                CustomField(
                    val: val, Name: 'Name*', controller: namecontroller),
                CustomField(
                    val: val,
                    Name: 'Description*',
                    controller: Descriptioncontroller),
                CustomImageFormField(
                    ctx: context,
                    formkey: _formkey,
                    fieldname: 'Image*',
                    onSaved: ((newValue) {
                      setState(() {
                        image = newValue;
                      });
                    })),
                CustomField(
                    val: val,
                    Name: 'Servings*',
                    controller: Servingscontroller),
                CustomField(
                    val: val,
                    Name: 'PrepTime*',
                    controller: PrepTimecontroller),
                CustomField(
                    val: val,
                    Name: 'CookTime*',
                    controller: CookTimecontroller),
                CustomField(
                    val: val,
                    Name: 'Ingredients*',
                    controller: Ingredientscontroller),
                CustomField(
                    val: val,
                    Name: 'Instructions*',
                    controller: Instructionscontroller),
                BlocBuilder<MyRecipeCubit, Stream<CurrentMyrecipe?>?>(
                  builder: (context, state) {
                    return StreamBuilder(
                        stream: state,
                        builder: (context, AsyncSnapshot snapshot) {
                          return TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                            ),
                            onPressed: () async {
                              if (_formkey.currentState!.validate()) {
                                _formkey.currentState!.save();
                                print('a');
                                context.read<MyRecipeCubit>().update({
                                  'Name': namecontroller.text,
                                  'Description': Descriptioncontroller.text,
                                  'Image': image.toString(),
                                  'Servings': Servingscontroller.text,
                                  'PrepTime': PrepTimecontroller.text,
                                  'CookTime': CookTimecontroller.text,
                                  'Ingredients': Ingredientscontroller.text,
                                  'Instructions': Instructionscontroller.text,
                                }, snapshot.data.mrecipes);
                                Fluttertoast.showToast(
                                    msg: "Added custom recipe",
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor:
                                        Theme.of(context).colorScheme.primary,
                                    textColor: Colors.black.withOpacity(0.6),
                                    fontSize: 12.0);
                              } else {
                                setState(() {
                                  val = AutovalidateMode.always;
                                });
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 120.0, vertical: 5.0),
                              child: const Text(
                                'Publish',
                                style: TextStyle(
                                    fontSize: 17, color: Colors.white),
                              ),
                            ),
                          );
                        });
                  },
                ),
              ],
            ),
          )),
        ),
      ),
    ));
  }
}
