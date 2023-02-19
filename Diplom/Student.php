<?php
require 'connectionstring.php';
$logol = $_COOKIE['logol'];
$pasap = $_COOKIE['pasap'];
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Журнал студента</title>
    <style type="text/css">
    table{
      border: solid;
      border-collapse: collapse;

    }
    th, tr, td{
      border: solid;
    }
    </style>
  </head>
  <body>
    <table>
      <tr>
        <th>Предмет</th>
        <th>Оценки</th>
        <th>Средний балл</th>
      </tr>
      <?php
      $SubjNames = $conn->query("SELECT Subject_name FROM `subjects`");
      while($row1 = mysqli_fetch_assoc($SubjNames)){
        $AvgGrade = 0;
        $QntGrade = 0;
        $StudTable = $conn->query("SELECT Grade FROM `Grades`
                                   JOIN `People` ON Person_ID = Grades_FK_person
                                   JOIN `subjects` ON Subject_ID = Grades_FK_subject
                                   WHERE Login = '$logol' AND `Password` = '$pasap'
                                   AND Subject_name = '$row1[Subject_name]' AND Grade <> 'Н' AND Grade <> ''
                                   ORDER BY Grade_date ASC;");
        echo "<tr>";
        echo "<td>".$row1['Subject_name']."</td>";
        echo "<td>";
        while($row2 = mysqli_fetch_assoc($StudTable)){
          echo "".$row2['Grade']." ";
          $AvgGrade += $row2['Grade'];
          ++$QntGrade;
        }
        echo "</td>";
        if($QntGrade == 0){
          $QntGrade += 1;
        }
        echo "<td>".round($AvgGrade / $QntGrade, 2)."</td>";
      }
       ?>
    </table>
    <form action="exit.php" method="post">
      <button type="submit" name="button">Выйти</button>
    </form>
  </body>
</html>
