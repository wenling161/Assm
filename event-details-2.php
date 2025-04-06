<?php
session_start();
?>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Products</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
        <link rel="stylesheet" href="Css/custom-2.css">
        <style>
            .card {
                max-width: 70em;
                flex-direction: row;
                background-color: #696969;
                border: 0;
                box-shadow: 0 7px 7px rgba(0, 0, 0, 0.18);
                margin: 3em auto;
            }

            .card.dark {
                color: #fff;
            }

            .card.card.bg-light-subtle .card-title {
                color: dimgrey;
            }

            .card img {
                max-width: 30%;
                margin: auto;
                padding: 0.5em;
                border-radius: 20px;
                height: 315px;
            }

            .card-body {
                display: flex;
                justify-content: space-between;
            }

            .text-section {
                max-width: 75%;
                text-align: justify;
                padding: 20px 10px;
            }

            .cta-section {
                max-width: 40%;
                display: flex;
                flex-direction: column;
                align-items: flex-end;
                justify-content: space-between;
            }

            .cta-section .btn {
                padding: 0.3em 0.5em;
                /* color: #696969; */
            }

            .card.bg-light-subtle .cta-section .btn {
                background-color: #898989;
                border-color: #898989;
            }

            .btn-cart {
                margin-top: 20px !important;
                padding: 15px !important;
                background-color: lightgray;
                border: none !important;
            }

            .btn-cart:hover {
                background-color: lightsteelblue;
                border: none;
            }

            @media screen and (max-width: 475px) {
                .card {
                    font-size: 0.9em;
                }
            }
        </style>
    </head>

    <body>
        <!-- Fixed navbar -->
        <?php include 'header-2.php' ?>
        <div class="container">
            <?php
            require_once './config/helper.php';
            $con = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);
//            $sql = "SELECT * FROM event";
            $sql = "SELECT * FROM product";

            if ($result = $con->query($sql)) {
                while ($row = $result->fetch_object()) {
                    printf('
                    <div class="card bg-secondary mt-4">
                        <img src="picturefolder/%s" class="card-img-top" alt="%s">
                        <div class="card-body">
                            <div class="text-section">
                                <h4 class="card-title fw-bold text-black font-weight-bold mb-4">%s</h4>
                                <p class="card-text text-black"><b>Description</b> : %s</p>
                                <p class="card-text text-black"><b>Price</b> : RM %s</p>
                                <p class="card-text text-black"><b>Stock</b> : %s</p>
                            </div>
                            <div class="cta-section">
                                <div>', $row->product_picture, $row->product_name, $row->product_name, $row->product_description, number_format($row->product_price, 2), $row->product_stock, number_format($row->product_price, 2));
                    if (isset($_SESSION['userLogin'])) {
                        printf('<a href="add-to-cart-2.php?product_id=%s&studentID=%s&quantity=1&price=%s" class="btn btn-light btn-cart">Add to cart</a>', $row->product_id, $_SESSION['studentId'], $row->product_price);
                        echo '<span style="margin: 0 5px;"></span>'; // Add spacing here                                    
                    } else {
                        printf('<a href="" class="btn btn-light" title="Required to login first" style="cursor: no-drop;">Add to cart</a>');
                        echo '<span style="margin: 0 5px;"></span>'; // Add spacing here                   
                    }
                    printf('
                                </div>
                            </div>
                        </div>
                    </div>
                    ');
                }
            }
            ?>
        </div> <!-- /container -->
        <div class="mt-5">
            <?php include 'footer-2.php' ?>
        </div>
    </body>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        (function ($) {
            $(window).scroll(function () {
                if ($(document).scrollTop() > 300) {
                    // Navigation Bar
                    $('.navbar').removeClass('fadeIn');
                    $('.navbar').addClass('fixed-top animated fadeInDown');
                } else {
                    $('.navbar').removeClass('fadeInDown');
                    $('.navbar').removeClass('fixed-top');
                    $('body').removeClass('shrink');
                    $('.navbar').addClass('animated fadeIn');
                }
            });
        })(jQuery);
    </script>

</html>