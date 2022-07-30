<?php
require 'connectionstring.php';
$TeachID = $_POST['teach'];
echo "<input id=\"idsh\" hidden=\"true\" value=\"$TeachID\">";
echo "Выбранный преподаватель: $TeachID";
echo "<table>",
"<tr><th>Доступ к предметам:</th><th>Доступ к группам:</th></tr>",
"<tr><td>";
$ChSubj = $conn->query("SELECT Subject_ID, Subject_name FROM subjects");
while($row = mysqli_fetch_assoc($ChSubj)){
  $ifch1 = $conn->query("SELECT SubjectAcs_ID FROM `Subject_Access`
                         JOIN `subjects` ON Access_FK_subject = Subject_ID
                         WHERE FK_person_S = $TeachID AND Subject_name = '$row[Subject_name]'");
  echo "<p><input type=\"checkbox\" onchange=\"changeRoleSubj(this.id)\" id=\"".$row['Subject_ID']."\"";
  if(mysqli_fetch_assoc($ifch1) != null){
    echo "checked";
  }
  echo ">".$row['Subject_name']."</p><br>";
}
echo "</td><td>";
$ChGrp = $conn->query("SELECT Group_ID, Group_name FROM `groups`");
while($row = mysqli_fetch_assoc($ChGrp)){
  echo "<p><input type=\"checkbox\" onchange=\"changeRoleGrp(this.id)\" id=\"".$row['Group_ID']."\"";
  $ifch2 = $conn->query("SELECT GroupAcs_ID FROM `Group_Access`
                         JOIN `groups` ON Access_FK_group = Group_ID
                         WHERE FK_person_G = $TeachID AND Group_name = '$row[Group_name]'");
  if(mysqli_fetch_assoc($ifch2) != null){
    echo "checked";
  }
  echo ">".$row['Group_name']."</p><br>";
}
echo "</td></tr></table>";
?>
