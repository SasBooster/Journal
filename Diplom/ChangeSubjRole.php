<?php
require 'connectionstring.php';
$subjid = $_POST['subjid'];
$teachid = $_POST['teach1'];
$findsubj = $conn->query("SELECT SubjectAcs_ID FROM `Subject_Access`
                       WHERE FK_person_S = $teachid AND Access_FK_subject = '$subjid'");
$z = mysqli_fetch_assoc($findsubj);
if($z != null){
  $conn->query("DELETE FROM `Subject_Access` WHERE SubjectAcs_ID = '$z[SubjectAcs_ID]'");
}
else{
  $conn->query("INSERT INTO `Subject_Access` (FK_person_S, Access_FK_subject) VALUES ($teachid, '$subjid')");
}
?>
