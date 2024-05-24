class Article {
  String article_id;
  String article_title;
  String article_content;
  String article_category;
  String article_gender;

  Article(this.article_id, this.article_title, this.article_content,
      this.article_category, this.article_gender);

  Map<String, dynamic> toJson() => {
        'article_id': article_id.toString(),
        'title': article_title.toString(),
        'content': article_content.toString(),
        'category': article_category.toString(),
        'gender_type': article_gender.toString(),
      };

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        json["article_id"],
        json["title"],
        json["content"],
        json["categorie"],
        json["gender_type"],
      );
}
