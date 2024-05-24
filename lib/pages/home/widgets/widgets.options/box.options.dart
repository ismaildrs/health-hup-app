import 'package:flutter/material.dart';
import 'package:health_hub_app/pages/articles/showarticles.dart';
import 'package:health_hub_app/pages/sleeptracker/sleeptracker.dart';
import 'package:health_hub_app/users/model/article.dart';

class BoxField extends StatelessWidget {
  final Article article;
  final String boxName;
  final String boxImage;
  final String? route;

  const BoxField(
      {Key? key,
      required this.article,
      required this.boxName,
      required this.boxImage,
      required this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ArticlePage(
                  article_name: article.article_title,
                  content: article.article_content)),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: 190,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(
            image: AssetImage(boxImage),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Color(0xffc29dc4).withOpacity(0.7),
              BlendMode.modulate,
            ),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 20,
              bottom: 25,
              child: Text(
                boxName,
                style: TextStyle(
                  shadows: [
                    Shadow(
                      offset: Offset(0, 2),
                      color: Colors.black12,
                      blurRadius: 3,
                    ),
                  ],
                  color: Colors.white,
                  fontFamily: 'Gilroy-Medium',
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
