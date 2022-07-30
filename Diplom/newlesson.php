<?php
require 'connectionstring.php';
$subj1 = $_POST['subjVal'];
$grp1 = $_POST['grpVal'];
mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
$NLdate = date("Y-m-d");
$IFdate = mysqli_fetch_assoc($conn->query("SELECT DISTINCT Grade_date FROM `Grades`
JOIN `People` ON Person_ID = Grades_FK_person
JOIN `Group_Access` ON FK_person_G = Person_ID
JOIN `groups` ON Access_FK_group = Group_ID
JOIN `subjects` ON Subject_ID = Grades_FK_subject
WHERE Grade_date = '$NLdate' AND Subject_name = '$subj1'
AND Group_Name = '$grp1' AND `Role` = 'Студент';"));
$Names = $conn->query("SELECT CONCAT(first_Name, ' ', Last_name) AS FI FROM People
    JOIN `Group_Access` ON FK_person_G = Person_ID
    JOIN `groups` ON Access_FK_group = Group_ID
    WHERE Group_Name = '$grp1' AND `Role` = 'Студент'");
if($NLdate == $IFdate['Grade_date']){
}
else{
  while($row = mysqli_fetch_assoc($Names)){
    echo $row['FI'];
    $conn->query("INSERT INTO `Grades` (Grade_date, Grades_FK_person, Grades_FK_subject) VALUES ('$NLdate',
      (SELECT Person_ID FROM `People` WHERE CONCAT(first_Name, ' ', last_Name) = '$row[FI]'),
      (SELECT Subject_ID FROM `subjects` WHERE Subject_name = '$subj1'));");
  }
}
?>
