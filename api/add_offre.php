<?php
if(!empty($_GET['intitule']) && !empty($_GET['ville_id']) && !empty($_GET['contrat_id']) &&
 !empty($_GET['metier_id']) && !empty($_GET['entreprise_id']) && !empty($_GET['description']))
{
    require '../connection.php';
    $intitule = $_GET['intitule'];
    $ville_id = $_GET['ville_id'];
    $contrat_id = $_GET['contrat_id'];
    $metier_id = $_GET['metier_id'];
    $entreprise_id = $_GET['entreprise_id'];
    $description = $_GET['description'];
    $query = "INSERT INTO offres VALUES(DEFAULT,DEFAULT,0,'$intitule',$ville_id,$contrat_id,$metier_id,$entreprise_id,'$description')";
    if(@mysqli_query($dbc,$query))
    {
        $query = "SELECT * FROM offres WHERE intitule='$intitule' AND ville_id=$ville_id 
        AND contrat_id=$contrat_id AND metier_id=$metier_id AND entreprise_id=$entreprise_id AND description='$description'";
        $result = @mysqli_query($dbc,$query);
        $row = mysqli_fetch_array($result);
        echo '{"date_pub":"'.$row[0].'","date_mod":"'.$row[1].'","reference":"'.$row[2].'","intitule":"'.$row[3].'"
            ,"ville_id":"'.$row[4].'","contrat_id":"'.$row[5].'","metier_id":"'.$row[6].'","entreprise_id":"'.$row[7].'",
            "description":"'.$row[8].'"}';
    }
    mysqli_close($dbc);
}
?>