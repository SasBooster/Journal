<?php
require 'connectionstring.php';
$logol = $_POST['logol'];
$pasap = $_POST['pasap'];
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Журнал педорга</title>
    <script type="text/javascript" src="orgsesame.js"></script>
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
    .Teach{
      cursor: pointer;
      text-align: center;
    }
    .Teach:hover, .Teach:focus{
      background-color: LightGray;
    }
    </style>
  </head>
  <body onload="SelectTable()">
    <select name="CB_subjects" id="CB_subjects" onchange="SelectTable()">
      <?php
      $combobox1 = $conn->query("SELECT Subject_name FROM `subjects`");
        while($row = mysqli_fetch_assoc($combobox1))
        {
          echo '<option value="'.$row['Subject_name'].'">'.$row['Subject_name'].'</option>';
        }
      ?>
    </select>
    <select name="CB_groups" id="CB_groups" onchange="SelectTable()">
      <?php
      $combobox2 = $conn->query("SELECT Group_name FROM `groups`");
        while($row = mysqli_fetch_assoc($combobox2))
        {
          echo '<option value="'.$row['Group_name'].'">'.$row['Group_name'].'</option>';
        }
       ?>
    </select>
    <a href="index.php" style="align: right;">Выйти</a>
    <table id="ens">

    </table>
    <table>
      <tr>
        <th>Список преподавателей:</th>
      </tr>
      <?php
      $Teachers = $conn->query("SELECT Person_ID, concat(Last_name, ' ', first_Name, ' ', Father_name) AS FIO FROM `People` where `Role` = 'Преподаватель'");
      while($row = mysqli_fetch_assoc($Teachers)){
        echo "<tr><td id=\"".$row['Person_ID']."\" onclick=\"TeachRoles(this.id)\" class=\"Teach\">".$row['FIO']."</td></tr>";
      }
       ?>
    </table>
    <div id="list">

    </div>
  </body>
</html>
