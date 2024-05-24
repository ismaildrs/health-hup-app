<?php

include '../connection.php';

$id = $_POST['article_id'];

$sqlQuery = "SELECT * FROM articles WHERE article_id = '$id'";

$resultOfQuery = $connectNow->query($sqlQuery);

if($resultOfQuery->num_rows>0){
    echo json_encode(array("idFound"=>true));
}
else{
    echo json_encode(array("idFound"=>false));
}