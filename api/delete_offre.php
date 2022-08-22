<?php
if(!empty($_GET['reference']))
{
    require '../connection.php';
    $reference = $_GET['reference'];
    $query = "DELETE FROM offres WHERE reference=$reference";
    @mysqli_query($dbc,$query);
    mysqli_close($dbc);
}
?>