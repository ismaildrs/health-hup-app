<?php
include '../connection.php';

$articleId = $_POST['article_id'];
$articleTitle = $_POST['title'];
$articleGender = $_POST['gender_type'];
$articleContent = $_POST['content'];

$sqlQuery = "INSERT INTO articles SET article_id = '$articleId', title = '$articleTitle', gender_type= '$articleGender', content = '$articleContent', pub_date = curdate()";

$resultOfQuery = $connectNow->query($sqlQuery);

if($resultOfQuery){
    $sql = mysqli_query($connectNow, "SELECT * from user_table where user_gender = '$articleGender'");
    while ($row = mysqli_fetch_assoc($sql)) {
        $sql2 = mysqli_query($connectNow, "INSERT INTO to_see SET user_id = $row[user_id], article_id = '$articleId'");
    }
    echo json_encode(array("success"=>true));
}
else{
    echo json_encode(array("success"=>false));
}