<?php
//   session_start();
//   if(!isset($_SESSION['auth']) || $_SESSION['auth'] === false)
//     header('Location: login.php');
    $page = $_GET['page'] ?? "dashboard";
?>

<?php 
    require_once 'pages/header.php';
    require_once 'pages/css.php';
    if($page == "user_groups"){
        echo '<link rel="stylesheet" href="css/style.min.css">';
    }
    echo '<title>Samba4::Admin::Center</title>
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
        echo '<script src="js/jquery.min.js"></script>
        <script src="js/jstree.min.js"></script>
        <script src="js/tree.js"></script>';
    }
?>
<?php require_once 'pages/footer.php'; ?>