<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
  </head>
  <?php
  require 'connectionstring.php';
  $login = filter_var(trim($_POST['login_tb']), FILTER_SANITIZE_STRING);
  $pass = filter_var(trim($_POST['pass_tb']), FILTER_SANITIZE_STRING);
  $res = (mysqli_fetch_assoc($conn->query("select `Role` from People where login = '$login' and `Password` = '$pass'")));
  if($res == null){
    header('Location: /');
  }
  else {
    switch($res["Role"]){
      case 'Педорг':
      ?>
    <form action="Org.php" method="post">
     <body>
      <input type="password" name="logol" value="<?php echo $login; ?>">
      <input type="password" name="pasap" value="<?php echo $pass; ?>" onfocus="this.form.submit()" autofocus>
      </body>
    </form>
      <?php
        break;
      case 'Преподаватель':
      ?>
    <form action="Teacher.php" method="post">
     <body>
      <input type="password" name="logol" value="<?php echo $login; ?>">
      <input type="password" name="pasap" value="<?php echo $pass; ?>" onfocus="this.form.submit()" autofocus>
      </body>
    </form>
      <?php
        break;
      case 'Студент':
      ?>
    <form action="Student.php" method="post">
     <body>
      <input type="password" name="logol" value="<?php echo $login; ?>">
      <input type="password" name="pasap" value="<?php echo $pass; ?>" onfocus="this.form.submit()" autofocus>
      </body>
    </form>
      <?php
        break;
    }
  }
  ?>
</html>
