<?php

    $limit = 10;

    function change_page($page,$x,$type)
    {
        global $limit;
        $metier = null;
        $contrat = null;
        $ville = null;
        if(isset($_GET['metier']))
        {
            $metier = $_GET['metier'];
        }
        if(isset($_GET['contrat']))
        {
            $contrat = $_GET['contrat'];
        }
        if(isset($_GET['ville']))
        {
            $ville = $_GET['ville'];
        }
        if($type == 'previous')
            if(has_previous($page))
            {
                echo "<form method='GET' action='page$x'>
                        <input type='hidden' name='metier' value='$metier'>
                        <input type='hidden' name='contrat' value='$contrat'>
                        <input type='hidden' name='ville' value='$ville'>";
                if(isset($_GET['tri']))
                {
                    $tri = $_GET['tri'];
                    echo "<input type='hidden' name='tri' value='$tri'>";
                }
                if(isset($_GET['order']))
                {
                    $order = $_GET['order'];
                    echo "<input type='hidden' name='order' value='$order'>";
                }
                echo   "<input type='submit' value='Page Precedente'>
                        </form>";
            }
        if($type == 'next')
            if(has_next($page)>$page*$limit)
            {
                echo "<form method='GET' action='page$x'>
                        <input type='hidden' name='metier' value='$metier'>
                        <input type='hidden' name='contrat' value='$contrat'>
                        <input type='hidden' name='ville' value='$ville'>";
                if(isset($_GET['tri']))
                {
                    $tri = $_GET['tri'];
                    echo "<input type='hidden' name='tri' value='$tri'>";
                }
                if(isset($_GET['order']))
                {
                    $order = $_GET['order'];
                    echo "<input type='hidden' name='order' value='$order'>";
                }
                echo   "<input type='submit' value='Page Suivante'>
                        </form>";
            }
    }

    function add_options($table,$name){
        require 'connection.php';
        $query = "SELECT nom FROM $table";
        $result = @mysqli_query($dbc,$query);
        @mysqli_close($dbc);
        while($row = mysqli_fetch_array($result))
        {
            $nom = $row[0];
            echo "<option >$nom</option>";
        }
    }

    function has_next($page){
        global $limit;
        require 'connection.php';
        $query = "WITH all_offres as (SELECT offres.date_pub,offres.reference,offres.description,offres.intitule,villes.nom AS ville,
        contrats.nom AS contrat,entreprises.nom AS entreprise,metiers.nom AS metier
        FROM offres,villes,contrats,entreprises,metiers
        WHERE offres.ville_id = villes.id AND offres.contrat_id = contrats.id AND offres.entreprise_id = entreprises.id AND 
        offres.metier_id = metiers.id) SELECT COUNT(*) FROM all_offres";
        $where_added = false;
        if(!empty($_GET['contrat']))
        {
            $contrat = str_replace("'","\'",$_GET['contrat']);
            $query = $query . " WHERE contrat LIKE '%".$contrat."%'";
            $where_added = true;
        }
        if(!empty($_GET['metier']))
        {
            $metier = str_replace("'","\'",$_GET['metier']);
            if(!$where_added)
            {
                $query = $query." WHERE ";
                $where_added = true;
            }
            else
                $query = $query." AND ";
            $query = $query . " metier LIKE '%".$metier."%'";
        }
        if(!empty($_GET['ville']))
        {
            $ville = str_replace("'","\'",$_GET['ville']);
            if(!$where_added)
                $query = $query." WHERE ";
            else
                $query = $query." AND ";
            $query = $query . " ville LIKE '%".$ville."%'";
        }
        $result = @mysqli_query($dbc,$query);
        $row = mysqli_fetch_array($result);
        $count = $row[0];
        @mysqli_close($dbc);
        return $count;
    }

    function has_previous($page){
        if($page>1)
        {
            return true;
        }
        return false;
    }

    function get_image(){
        $url = 'https://some-random-api.ml/meme';
        $json = file_get_contents($url);
        $jo = json_decode($json);
        return $jo->image;
    }

    function add_jobs($result){
        while($row = mysqli_fetch_array($result))
        {
            $image = get_image();
            $date = dateToFrench($row['date_pub'],'l j F Y');
            $des = substr(trim($row['description'],'\n'),0,30);
            $ville = $row['ville'];
            $contrat = $row['contrat'];
            $entreprise = $row['entreprise'];
            $metier = $row['metier'];
            echo "
                <div>
                    <div class='d-flex flex-row'>
                        <img src='$image' height='150' width='150'>
                        <div class='d-flex flex-column offre' height='150' width='100' >
                            <label ><h4>".$row['intitule']."</h4></label>
                            <label >Date de publication : $date</label>
                            <label >Entreprise : $entreprise / Ville : $ville </label>
                            <label >Metier : $metier / Contrat : $contrat
                            / Reference : ".$row['reference']."</label>
                            <label >Description : $des...</label>
                        </div>
                    </div>
                </div>
            ";
        }
    }

    function get_jobs($page){
        require 'connection.php';
        global $limit;
        $offset = ($page-1)*$limit;
        $query = "WITH all_offres as (SELECT offres.date_pub,offres.reference,offres.description,offres.intitule,villes.nom AS ville,
        contrats.nom AS contrat,entreprises.nom AS entreprise,metiers.nom AS metier
        FROM offres,villes,contrats,entreprises,metiers
        WHERE offres.ville_id = villes.id AND offres.contrat_id = contrats.id AND offres.entreprise_id = entreprises.id AND 
        offres.metier_id = metiers.id) SELECT * FROM all_offres";
        $where_added = false;
        if(!empty($_GET['contrat']))
        {
            $contrat = str_replace("'","\'",$_GET['contrat']);
            $query = $query . " WHERE contrat LIKE '%".$contrat."%'";
            $where_added = true;
        }
        if(!empty($_GET['metier']))
        {
            $metier = str_replace("'","\'",$_GET['metier']);
            if(!$where_added)
            {
                $query = $query." WHERE ";
                $where_added = true;
            }
            else
                $query = $query." AND ";
            $query = $query . " metier LIKE '%".$metier."%'";
        }
        if(!empty($_GET['ville']))
        {
            $ville = str_replace("'","\'",$_GET['ville']);
            if(!$where_added)
                $query = $query." WHERE ";
            else
                $query = $query." AND ";
            $query = $query . " ville LIKE '%".$ville."%'";
        }
        if(!empty($_GET['tri']))
        {
            if($_GET['tri']=='pub')
            {
                $query = $query." ORDER BY all_offres.date_pub ";
            }
            else
            {
                $query = $query." ORDER BY all_offres.intitule ";
            }
        }
        if(!empty($_GET['order']))
        {
            if($_GET['order']=='Ascendant')
            {
                $query = $query." ASC ";
            }
            else
            {
                $query = $query." DESC ";
            }
        }
        $query = $query . " LIMIT $limit OFFSET $offset";
        $result = @mysqli_query($dbc,$query);
        @mysqli_close($dbc);
        return $result;
    }

    function dateToFrench($date, $format) 
    {
        $english_days = array('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');
        $french_days = array('lundi', 'mardi', 'mercredi', 'jeudi', 'vendredi', 'samedi', 'dimanche');
        $english_months = array('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December');
        $french_months = array('janvier', 'février', 'mars', 'avril', 'mai', 'juin', 'juillet', 'août', 'septembre', 'octobre', 'novembre', 'décembre');
        return str_replace($english_months, $french_months, str_replace($english_days, $french_days, date($format, strtotime($date) ) ) );
    }
?>