<?php

if (session_id() == "") {
  session_start();

  if (!$_SESSION) {

    header("Location: ../index.php");
    exit();

  }



}


?>