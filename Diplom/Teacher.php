<?php
require 'connectionstring.php';
$logol = $_POST['logol'];
$pasap = $_POST['pasap'];
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Журнал учителя</title>
    <script type="text/javascript" src="openSesame.js"></script>
		<script src="https://code.jquery.com/jquery-3.6.0.js"
    integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
    crossorigin="anonymous"></script>
    <style type="text/css">
    table{
      border: solid;
      border-collapse: collapse;

    }
    th, tr, td{
      border: solid;
    }
    .Grade{
      cursor: pointer;
      text-align: center;
    }
    .Grade:hover, .Grade:focus{
      background-color: LightGray;
    }
    .G5{
      background-color: LimeGreen;
    }
    .G4{
      background-color: LawnGreen;
    }
    .G3{
      background-color: Gold;
    }
    .G2{
      background-color: OrangeRed;
    }
    .GN{
      background-color: Gray;
    }
    .Gremove{
      background-color: LightGray;
    }
    </style>
  </head>
  <body onload="SelectChange()">
    <header style="">
      <div style="margin-bottom: 20px; margin-top: 20px;">
        <select name="CB_subjects" id="CB_subjects" onchange="SelectChange()">
          <?php
          $combobox1 = $conn->query("SELECT Subject_name FROM `subjects` JOIN Subject_Access ON Subject_ID = Access_FK_subject
  	        JOIN `People` ON Person_ID = FK_person_S WHERE login = '$logol' and `Password` = '$pasap'");
            while($row = mysqli_fetch_assoc($combobox1))
            {
              echo '<option value="'.$row['Subject_name'].'">'.$row['Subject_name'].'</option>';
            }
          ?>
        </select>
        <select style="margin-left: 10px;" name="CB_groups" id="CB_groups" onchange="SelectChange()">
          <?php
          $combobox2 = $conn->query("SELECT Group_name FROM `groups` JOIN Group_Access ON Group_ID = Access_FK_group
  	        JOIN `People` ON Person_ID = FK_person_G WHERE login = '$logol' and `Password` = '$pasap'");
            while($row = mysqli_fetch_assoc($combobox2))
            {
              echo '<option value="'.$row['Group_name'].'">'.$row['Group_name'].'</option>';
            }
           ?>
        </select>
        <a style="margin-left: 10px;" href="index.php" style="align: right;">Выйти</a>
      </div>
    </header>
    <table id="ans">

    </table>
    <div id="ins">

    </div>
    <footer>
        <button style="margin-top: 20px;" onclick="GradeInsert()">Новое занятие</button>
    </footer>
  </body>
</html>
