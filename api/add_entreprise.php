<?php
if(!empty($_GET['name']))
{
    require '../connection.php';
    $name = $_GET['name'];
    $query = "INSERT INTO entreprises VALUES(0,'$name')";
    if(@mysqli_query($dbc,$query))
    {
        $query = "SELECT * FROM entreprises WHERE nom='$name'";
        $result = @mysqli_query($dbc,$query);
        $row = mysqli_fetch_array($result);
        echo '{"id":"'.$row[0].'","nom":"'.$row[1].'"}';
    }
    mysqli_close($dbc);
}
?>