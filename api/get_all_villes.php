<?php
require '../connection.php';
$query = "SELECT * FROM villes";
if($result = @mysqli_query($dbc,$query))
{
    $jo = "[";
    while($row = mysqli_fetch_array($result))
    {
        $jo = $jo . '{"id":"'.$row[0].'","nom":"'.$row[1].'"},';
    }
    $jo = rtrim($jo, ",");
    $jo = $jo."]";
    echo $jo;
}
mysqli_close($dbc);
?>