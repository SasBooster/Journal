  <?php
  require 'connectionstring.php';
  $res;
  if(isset($_COOKIE['logol']) && isset($_COOKIE['pasap'])){
    $res = (mysqli_fetch_assoc($conn->query("select `Role` from People where login = '$_COOKIE[logol]'
    and `Password` = '$_COOKIE[pasap]'")));
  }
  else{
    $login = filter_var(trim($_POST['login_tb']), FILTER_SANITIZE_STRING);
    $pass = filter_var(trim($_POST['pass_tb']), FILTER_SANITIZE_STRING);
    setcookie("logol", $login, time()+3600);
    setcookie("pasap", $pass, time()+3600);
    $res = (mysqli_fetch_assoc($conn->query("select `Role` from People where login = '$login' and `Password` = '$pass'")));
  }
  if($res == null){
    header('Location: /');
  }
  else {
    switch($res["Role"]){
      case 'Педорг':
      header('Location: /Org.php');
        break;
      case 'Преподаватель':
      header('Location: /Teacher.php');
        break;
      case 'Студент':
      header('Location: /Student.php');
        break;
    }
  }
  ?>
