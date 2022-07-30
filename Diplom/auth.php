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

  $res1 = $conn->query("select `Role` from People where login = '$login' and `Password` = '$pass'");
  $res2 = $conn->query("select `Role` from People where login = '$login' and `Password` = '$pass'");
  if(mysqli_fetch_assoc($res1) == null){
    header('Location: /');
  }
  else {;
    switch(mysqli_fetch_assoc($res2)["Role"]){
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
