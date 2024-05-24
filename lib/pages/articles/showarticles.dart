import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_hub_app/pages/home/home.page.dart';

class ArticlePage extends StatelessWidget {
  final String article_name;
  final String content;
  const ArticlePage(
      {Key? key, required this.article_name, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: Colors.white,
        width: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Get.off(HomePage());
                      }),
                  Expanded(
                    child: Text(
                      article_name,
                      style: TextStyle(
                          color: Colors.black54,
                          fontFamily: "Gilroy-Black",
                          fontSize: 30),
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 2,
                color: Colors.black45,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  child: Text(
                    content,
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: 22,
                        fontFamily: "Gilroy-Medium"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
