<?php

include '../connection.php';

$userEmail = $_POST['user_email'];

$sqlQuery = "SELECT user_id FROM user_table WHERE user_email = '$userEmail'";

$resultOfQuery = $connectNow->query($sqlQuery);

if($resultOfQuery->num_rows>0){//we found the acount
    $articleRecord = array();
    while($rowFound = $resultOfQuery->fetch_assoc()){
        $sql1 = mysqli_query($connectNow, "SELECT a1.* FROM articles a1, to_see a2 WHERE a1.article_id = a2.article_id and a2.user_id = $rowFound[user_id]");
        while($rowFound2 = mysqli_fetch_assoc($sql1)){
                $articleRecord[] = $rowFound2;
        }
    }
    echo json_encode(array("articleFound"=>true, "articleData"=> $articleRecord));
}
else{//account not found
    echo json_encode(array("articleFound"=>false));
}