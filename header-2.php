<?php
$current_page = basename($_SERVER['PHP_SELF']);
?>
<head>    
    <link rel="stylesheet" type="text/css" href="Css/style1.css">
</head>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="homepage-2.php">
            <img class="logo" src="picturefolder/logo.png" alt="TARUMT Gradify Logo" style="width: 400px; height: 100px;" /></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarMain"
                aria-controls="navbarMain" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarMain">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link <?php echo $current_page == 'homepage-2.php' ? 'active' : ''; ?>" aria-current="page" href="homepage-2.php">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link <?php echo $current_page == 'event-details-2.php' ? 'active' : ''; ?>" href="event-details-2.php">Products</a>
                </li>
                <?php
                if (isset($_SESSION['userLogin'])) {
                    echo '                        
                            <li class="nav-item">
                                <a class="nav-link ' . ($current_page == 'cart-2.php' ? 'active' : '') . '" href="cart-2.php">Cart</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle ' . (($current_page == 'customer-profile-2.php' || $current_page == 'logout-2.php') ? 'active' : '') . '" href="#" id="navbarDropdown" role="button"
                                    data-bs-toggle="dropdown" aria-expanded="false">
                                    Account Settings
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="customer-profile-2.php">Profile</a></li>
                                    <li><a class="dropdown-item" href="logout-2.php?role=customer">Logout</a></li>
                                </ul>
                            </li>
                        ';
                } else {
                    echo '
                            <li class="nav-item">
                                <a class="nav-link ' . ($current_page == 'login-form-2.php' ? 'active' : '') . '" href="login-form-2.php">Login</a>
                            </li>
                        ';
                }
                ?>
            </ul>
        </div>
        <!--/.nav-collapse -->
    </div>
</nav>
<script type="text/javascript">
    <?php if(isset($_SESSION['userLogin'])): ?>
        console.log("userLogin: <?php echo $_SESSION['userLogin']; ?>");
        console.log("userID: <?php echo  $_SESSION['studentId']; ?>");
    <?php else: ?>
        console.log("userLogin: not set");
    <?php endif; ?>
</script>