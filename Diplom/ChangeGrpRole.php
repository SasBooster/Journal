<?php
require 'connectionstring.php';
$grpid = $_POST['grpid'];
$teachid = $_POST['teach2'];
$findgrp = $conn->query("SELECT GroupAcs_ID FROM `Group_Access`
                         WHERE FK_person_G = $teachid AND Access_FK_group = '$grpid'");
$y = mysqli_fetch_assoc($findgrp);
if($y != null){
  $conn->query("DELETE FROM `Group_Access` WHERE GroupAcs_ID = '$y[GroupAcs_ID]'");
}
else{
  $conn->query("INSERT INTO `Group_Access` (FK_person_G, Access_FK_group) VALUES ($teachid, '$grpid')");
}
?>
