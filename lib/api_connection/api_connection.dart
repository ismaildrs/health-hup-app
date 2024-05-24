class API {
  static const String path = "172.20.213.53";
  static const hostConnect = "http://" + path + "/api_health_hub";
  static const hostConnectUser = "$hostConnect/user";

  //signUp user
  static const validateEmail = "$hostConnectUser/validate_email.php";
  static const signUp = "$hostConnectUser/signup.php";
  static const login = "$hostConnectUser/login.php";

  //articles
  static const postarticle = "$hostConnect/article/post.php";
  static const getArticle = "$hostConnect/article/get.php";
  static const validateId = "$hostConnect/article/validate_id.php";
}
