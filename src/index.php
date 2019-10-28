<?php
   session_start();
   if(!isset($_SESSION['auth']) || $_SESSION['auth'] === false)
   {
        header('Location: login.php');
   }
       
    $page = $_GET['page'] ?? "dashboard";
?>

<?php 
    require_once 'pages/header.php';
    require_once 'pages/css.php';
    if($page == "user_groups"){
        echo '<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />';
    }
    echo '<title>Samba4::Admin::Center</title>
    <link rel="shortcut icon" href="assets/icon/favicon.co">
        </head>
        <body>';

?>
<?php require_once 'pages/navbar.php'; ?>

<main class="container-fluid mt-3" id="index-main">
    <?php include("pages/".$page.".php"); ?>
</main>

<?php 
    require_once 'pages/scripts.php';
    
    if($page == "user_groups"){
        echo '
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
        <script src="js/tree.js"></script>';
    }
?>
<?php require_once 'pages/footer.php'; ?>