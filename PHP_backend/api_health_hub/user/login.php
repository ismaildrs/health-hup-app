<?php

include '../connection.php';

$userEmail = $_POST['user_email'];
$userPassword = md5($_POST['user_password']);

$sqlQuery = "SELECT * FROM user_table WHERE user_email = '$userEmail' AND user_password = '$userPassword'";

$resultOfQuery = $connectNow->query($sqlQuery);

if($resultOfQuery->num_rows>0){//we found the acount
    $userRecord = array();
    while($rowFound = $resultOfQuery->fetch_assoc()){
        $userRecord[] = $rowFound;
    }
    echo json_encode(array("accountFound"=>true, "userData"=> $userRecord[0]));
}
else{//account not found
    echo json_encode(array("accountFound"=>false));
}