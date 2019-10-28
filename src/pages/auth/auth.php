<?php
session_start();
$login = sha1($_POST['username']) ?? null;
$password = sha1($_POST['password']) ?? null;
if(authenticateFake($login, $password)){
  $_SESSION['auth'] = true;
  header('Location: ../../index.php');
  exit();
} else {
  header('Location: ../../login.php');
}
// function autentication($user, $pass){
//   // var_dump(username($user, $pass));
//     return username($user, $pass);
// }
function authenticateFake($user, $pass){
  return $user == sha1('reinaldo') && $pass == sha1('123');
}