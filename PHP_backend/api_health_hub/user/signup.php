<?php
include '../connection.php';

$userName = $_POST['user_name'];
$userSurname = $_POST['user_surname'];
$userGender = $_POST['user_gender'];
$userEmail = $_POST['user_email'];
$userPassword = md5($_POST['user_password']);

$sqlQuery = "INSERT INTO user_table SET user_name = '$userName', user_surname = '$userSurname', user_gender = '$userGender', user_email = '$userEmail', user_password = '$userPassword'";

$resultOfQuery = $connectNow->query($sqlQuery);

if($resultOfQuery){
    echo json_encode(array("success"=>true));
}
else{
    echo json_encode(array("success"=>false));
}
