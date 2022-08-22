<?php
if(!empty($_GET['reference']))
{
    require '../connection.php';
    $query = "UPDATE offres SET date_mod=DEFAULT ";
    if(!empty($_GET['intitule']))
    {
        $query = $query . " ,intitule='".$_GET['intitule']."'";
    }
    if(!empty($_GET['ville_id']))
    {
        $query = $query . " ,ville_id=".$_GET['ville_id'];
    }
    if(!empty($_GET['contrat_id']))
    {
        $query = $query . " ,contrat_id=".$_GET['contrat_id'];
    }
    if(!empty($_GET['metier_id']))
    {
        $query = $query . " ,metier_id=".$_GET['metier_id'];
    }
    if(!empty($_GET['entreprise_id']))
    {
        $query = $query . " ,entreprise_id=".$_GET['entreprise_id'];
    }
    if(!empty($_GET['description']))
    {
        $query = $query . " ,description='".$_GET['description']."'";
    }
    $reference = $_GET['reference'];
    $query = $query . " WHERE reference = $reference";
    if(@mysqli_query($dbc,$query))
    {
        $query = "SELECT * FROM offres WHERE reference=$reference";
        $result = @mysqli_query($dbc,$query);
        $row = mysqli_fetch_array($result);
        echo '{"date_pub":"'.$row[0].'","date_mod":"'.$row[1].'","reference":"'.$row[2].'","intitule":"'.$row[3].'"
            ,"ville_id":"'.$row[4].'","contrat_id":"'.$row[5].'","metier_id":"'.$row[6].'","entreprise_id":"'.$row[7].'",
            "description":"'.$row[8].'"}';
    }
    mysqli_close($dbc);
}
?>