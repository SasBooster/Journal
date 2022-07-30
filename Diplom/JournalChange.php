<?php
require 'connectionstring.php';
$subj = $_POST['subjVal'];
$grp = $_POST['grpVal'];
mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
$DTable = $conn->query("SELECT DISTINCT Grade_date FROM `Grades` JOIN `subjects` ON Grades_FK_subject = Subject_ID
	WHERE Subject_name = '$subj' AND `Grades_FK_person` = (SELECT Person_ID FROM `People`
	JOIN `Group_Access` ON Person_ID = FK_Person_G
	JOIN `groups` ON Group_ID = Access_FK_group
	JOIN `Grades` ON Grades_FK_person = Person_ID where Group_name = '$grp' LIMIT 1) ORDER BY Grade_date ASC;");
?>
<tr>
  <td>ФИО</td>
  <?php
  while ($row = mysqli_fetch_assoc($DTable)){
    echo '<td>'.substr($row['Grade_date'], -2).'</td>';
  }

   ?>
</tr>
<?php
    $STable = $conn->query("SELECT CONCAT(Last_name, ' ', first_Name) AS FIO FROM People
    JOIN `Group_Access` ON FK_person_G = Person_ID
    JOIN `groups` ON Access_FK_group = Group_ID
    WHERE Group_Name = '$grp' AND `Role` = 'Студент' ORDER BY Last_name ASC");

    while ($row1 = mysqli_fetch_assoc($STable)){
      echo "<tr>";
      echo "<td>".$row1['FIO']."</td>";
			$GTable = $conn->query("SELECT Grade_ID, Grade FROM `Grades`
															JOIN `People` ON Person_ID = Grades_FK_person
															JOIN `subjects` ON Subject_ID = Grades_FK_subject
															WHERE Concat(last_Name, ' ', First_name) = '$row1[FIO]'
															AND Subject_name = '$subj' ORDER BY Grade_date ASC;");
			while($row2 = mysqli_fetch_assoc($GTable)){
				echo "<td id=\"".$row2['Grade_ID']."\" onclick=\"GradePage(this.id)\" class=\"Grade\">".$row2['Grade']."</td>";
			}
      echo "</tr>";
    }

?>
