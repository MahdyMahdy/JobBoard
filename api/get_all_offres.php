<?php
require '../connection.php';
$query = "SELECT * FROM offres";
if($result = @mysqli_query($dbc,$query))
{
    $jo = "[";
    while($row = mysqli_fetch_array($result))
    {
        $jo = $jo . '{"date_pub":"'.$row[0].'","date_mod":"'.$row[1].'","reference":"'.$row[2].'","intitule":"'.$row[3].'"
            ,"ville_id":"'.$row[4].'","contrat_id":"'.$row[5].'","metier_id":"'.$row[6].'","entreprise_id":"'.$row[7].'",
            "description":"'.$row[8].'"},';
    }
    $jo = rtrim($jo, ",");
    $jo = $jo."]";
    echo $jo;
}
mysqli_close($dbc);
?>