<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>JobBoard</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
        <link href="myStyle.css" rel="stylesheet">
        <?php require 'functions.php'; ?>
    </head>
    <body>
        <h1>JobBoard</h1>
        <div class="d-flex justify-content-between">
            <div class="d-flex justify-content">
                <form method="GET" action="page1">
                    <div>
                        Metier :  
                        <select name='metier'>
                            <option value=''>Choisir</option>
                            <?php
                                add_options("metiers","metier");           
                            ?>
                        </select>
                        Contrat : 
                        <select name='contrat'>
                            <option value=''>Choisir</option>
                            <?php
                                add_options("contrats","contrat");           
                            ?>
                        </select>
                        Ville : 
                        <select name='ville'>
                            <option value=''>Choisir</option>
                            <?php
                                add_options("villes","ville");           
                            ?>
                        </select>
                        <input type='submit' value='Appliquer le filtre'>
                        <form method="GET" action="page1">
                            <input type='submit' value='Réinitialiser le filtre'>
                        </form>
                    </div>
                </form>
            </div>
            <div class='d-flex justify-content'>
                <form method="GET" action="<?php echo $_SERVER['REQUEST_URI'] ?>">
                    <input type='submit' value='Tri'>
                    <input type='hidden' name='metier' value="<?php if(isset($_GET['metier'])) echo $_GET['metier'] ?>">
                    <input type='hidden' name='contrat' value="<?php if(isset($_GET['contrat'])) echo $_GET['contrat'] ?>">
                    <input type='hidden' name='ville' value="<?php if(isset($_GET['ville'])) echo $_GET['ville'] ?>">
                    <select name='tri'>
                        <option value='pub'>Par date de publication</option>
                        <option value='alpha'>Par ordre alphabétique</option>
                    </select>
                    <select name='order'>
                        <option>Ascendant</option>
                        <option>Descendant</option>
                    </select>
                </form>
            </div>
        </div>
        <?php
            $page = 1;
            if(!empty($_GET['page']))
            {
                $page = $_GET['page'];
            }
            $jobs = get_jobs($page);
            add_jobs($jobs);
        ?>
            <div class="d-flex justify-content-between">
                <div>
                    <?php
                    change_page($page,$page-1,'previous');
                    ?>
                </div>
                <div>
                    <?php
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
                    for($i=1;$i<=ceil(has_next($page)/$limit);$i++)
                    {
                        $pages = "<a href='page$i?metier=$metier&contrat=$contrat&ville=$ville";
                        if(isset($_GET['tri']))
                        {
                            $pages = $pages ."&tri=". $_GET['tri'];
                        }
                        if(isset($_GET['order']))
                        {
                            $pages = $pages ."&order=". $_GET['order'];
                        }
                        $pages = $pages."'>$i </a>";
                        echo $pages;
                    }
                    ?>
                </div>
                <div >
                    <?php
                    change_page($page,$page+1,'next');
                    ?>
                </div>
            </div>
    </body>
</html>