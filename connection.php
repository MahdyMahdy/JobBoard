<?php
  $dbc=@mysqli_connect('localhost','root','') or die("connection error:".@mysqli_errno($dbc).': '.@mysqli_error($dbc));
  @mysqli_select_db($dbc,'jobboarddb');
?>
