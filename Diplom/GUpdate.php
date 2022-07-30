<?php
require 'connectionstring.php';
$grdid = $_POST['grdid'];
$grd = $_POST['grd'];
$conn->query("UPDATE `Grades` SET `Grade` = '$grd' WHERE `Grade_ID` = $grdid;");
?>
