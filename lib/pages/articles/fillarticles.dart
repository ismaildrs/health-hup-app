import 'dart:convert';
import 'package:get/get.dart';
import 'package:health_hub_app/pages/home/home.page.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:health_hub_app/api_connection/api_connection.dart';
import 'package:health_hub_app/users/model/article.dart';

class WriteArticles extends StatefulWidget {
  const WriteArticles({super.key});

  @override
  State<WriteArticles> createState() => _WriteArticlesState();
}

class _WriteArticlesState extends State<WriteArticles> {
  int _value = 0;

  int _id = 0;

  final formKey = GlobalKey<FormState>();

  final _idController = TextEditingController();

  final _titleController = TextEditingController();

  final _textController = TextEditingController();

  String _dropdownvalue = '';

  String _genderType = '';

  validateIdArticle() async {
    try {
      var res = await http.post(Uri.parse(API.validateId), body: {
        'article_id': _idController.text.trim()
      }); //response from the server
      if (res.statusCode == 200) {
        //from flutter the connection with api to server
        var resBodyOfValidateId = jsonDecode(res.body);
        if (resBodyOfValidateId["idFound"]) {
          Fluttertoast.showToast(msg: "Id is already used. Try another id.");
        } else {
          postArticle();
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  postArticle() async {
    Article articleModel = Article(
        _idController.text.trim(),
        _titleController.text.trim(),
        _textController.text,
        _dropdownvalue.trim(),
        _genderType.trim());

    try {
      var res = await http.post(Uri.parse(API.postarticle),
          body: articleModel.toJson());
      if (res.statusCode == 200) {
        var resBodyOfPosting = jsonDecode(res.body);
        if (resBodyOfPosting["success"]) {
          Fluttertoast.showToast(
              msg: "Congratulations, the article was stored succefully.");
        } else {
          Fluttertoast.showToast(msg: "Error Ocurred, Try Again.");
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [Color(0xff58e3c5), Color(0xff84ead4)])),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                Row(children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Get.off(HomePage());
                    },
                  ),
                  Text(
                    "ARTICLE",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Gilroy-Bold",
                      fontSize: 60,
                    ),
                  ),
                ]),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Enter the id of the article",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Gilroy-Medium",
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontFamily: "Gilroy-Medium"),
                        controller: _idController,
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return "Id Required";
                          } else if (value.length != 4) {
                            return "Id should contains 4 characters";
                          }
                        },
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3, color: Colors.white), //<-- SEE HERE
                          ),
                          border: OutlineInputBorder(),
                          hintText: 'id',
                          hintStyle: TextStyle(
                              fontFamily: "Gilroy", color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Enter the title of the article",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Gilroy-Medium",
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        style: TextStyle(fontFamily: "Gilroy-Medium"),
                        controller: _titleController,
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return "Title Required";
                          }
                        },
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3, color: Colors.white), //<-- SEE HERE
                          ),
                          border: OutlineInputBorder(),
                          hintText: 'title',
                          hintStyle: TextStyle(
                              fontFamily: "Gilroy", color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Choose the category",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Gilroy-Medium",
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      DropdownButtonFormField<String>(
                          value: _dropdownvalue,
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3, color: Colors.white), //<-- SEE HERE
                            ),
                            border: OutlineInputBorder(),
                          ),
                          dropdownColor: Color(0xff58dee3),
                          icon: const Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: "Gilroy-Bold",
                            fontSize: 15,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              _dropdownvalue = newValue!;
                            });
                          },
                          items: const [
                            DropdownMenuItem<String>(
                              value: "",
                              child: Text("Choose"),
                            ),
                            DropdownMenuItem<String>(
                              value: "Health",
                              child: Text("Health"),
                            ),
                            DropdownMenuItem<String>(
                              value: "Fitness",
                              child: Text("Fitness"),
                            )
                          ],
                          validator: (value) {
                            if (_dropdownvalue == '') {
                              return 'You must select a value.';
                            }
                            return null;
                          }),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Write here the article",
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: "Gilroy-Medium",
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        style: TextStyle(fontFamily: "Gilroy-Medium"),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        minLines: null,
                        controller: _textController,
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return "Text Required";
                          }
                        },
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3, color: Colors.white), //<-- SEE HERE
                          ),
                          border: OutlineInputBorder(),
                          hintText: 'title',
                          hintStyle: TextStyle(
                              fontFamily: "Gilroy", color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 30.0, left: 10.0, right: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Male",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "Gilroy-Bold",
                                      color: Colors.white),
                                ),
                                Radio(
                                  activeColor: Colors.white,
                                  value: 1,
                                  groupValue: _value,
                                  onChanged: (value) {
                                    setState(() {
                                      _value = value!;
                                      _genderType = "Male";
                                    });
                                  },
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Female",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "Gilroy-Bold",
                                      color: Colors.white),
                                ),
                                Radio(
                                  activeColor: Colors.white,
                                  value: 2,
                                  groupValue: _value,
                                  onChanged: (value) {
                                    setState(() {
                                      _value = value!;
                                      _genderType = "Female";
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            validateIdArticle();
                          }
                        },
                        child: Center(
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Color(0xff58e3c5),
                                borderRadius: BorderRadius.circular(5)),
                            height: 50,
                            width: 120,
                            margin: EdgeInsets.symmetric(vertical: 30),
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontFamily: "Gilroy-Bold",
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
