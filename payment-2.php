<?php
session_start();
if (!isset($_SESSION['userLogin'])) {
    header("Location: login-form-2.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Payment</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
        <link rel="stylesheet" href="Css/custom-2.css">
        <style>
            .pay-product table, .pay-product td, .pay-product th {
                border: solid 1px lightgray;
                padding: 10px;
            }
            .card {
                border: 1px solid lightgray !important;
            }
            .btn {
                padding: 10px !important;
                --bs-btn-bg: #DEAD6F;
            }
        </style>
    </head>
    <body>
        <!-- Fixed navbar -->
        <?php include 'header-2.php'; ?>
        <div class="container mt-2">
            <div class="container">
                <div class="row justify-content-center mt-3">
                    <div class="col-md-10">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Payment Details</h4>
                            </div>
                            <div class="card-body">
                                <form action="process_payment.php" method="POST">
                                    <?php
                                    //previous cart page, submit form + click on the checkout button
                                    if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['doPayment'])) {
                                        if (isset($_POST['checked']) && isset($_POST['quantity'])) {
                                            if (isset($_POST['studentid'])) {
                                                $studentid = htmlspecialchars($_POST['studentid']);
                                                $conn = new mysqli('database1.cfs6wemgo5yu.us-east-1.rds.amazonaws.com', 'admin', 'Abcd1234', 'database1', '3306');
                                                if ($conn->connect_error) {
                                                    die("Connection failed: " . $conn->connect_error);
                                                }

                                                $stmt = $conn->prepare("SELECT fullname, email FROM member WHERE studentid = ?");
                                                $stmt->bind_param("s", $studentid);
                                                $stmt->execute();
                                                $result = $stmt->get_result();
                                                $studentData = $result->fetch_assoc();

                                                if (!$studentData) {
                                                    die("Student not found.");
                                                }

                                                $stmt->close();
                                                $conn->close();
                                            }

                                            $idsArr = $_POST['ids'];
                                            $nameArr = $_POST['checked'];
                                            $productPriceArr = $_POST['price'];
                                            $quantityArr = $_POST['quantity'];
                                            $orderIdArr = $_POST['orderid'];
                                            $studentid = $_POST['studentid'];
                                            $total = 0;

                                            echo '<table class="col-12 pay-product" style="margin: 10px 0 15px 0;">';
                                            echo '<tr><th style="text-align: center">Product Name</th><th>Quantity</th><th>Price (RM)</th></tr>';

                                            for ($i = 0; $i < count($nameArr); $i++) {
                                                $product_name = $nameArr[$i];
                                                $product_id = $idsArr[$i];
                                                $quantity = $quantityArr[$i];
                                                $product_price = $productPriceArr[$i];
                                                $newOrderId = $orderIdArr[$i];
                                                $studentid = $studentid;
                                                $total += ($product_price * $quantity);

                                                echo '<tr>';
                                                echo '<td style="text-align: justify">' . $product_name . '</td>';
                                                echo '<td style="text-align: center">' . $quantity . '</td>';
                                                echo '<td style="text-align: center">' . number_format($product_price, 2) . '</td>';
                                                echo '</tr>';
                                                echo '<input type="hidden" name="products[]" value="' . $product_id . '">';
                                                echo '<input type="hidden" name="quantities[]" value="' . $quantity . '">';
                                                echo '<input type="hidden" name="prices[]" value="' . $product_price . '">';
                                                echo '<input type="hidden" name="orderid[]" value="' . $newOrderId . '">';
                                                echo '<input type="hidden" name="studentid" value="' . $studentid . '">';
                                            }
                                            echo '<tr>';
                                            echo "<td colspan='2' style='text-align: right'>Total Price (RM)</td>";
                                            echo "<td style='text-align: center'>" . number_format($total, 2) . "</td>";
                                            echo '</tr>';
                                            echo '</table>';
                                        }
                                    }
                                    ?>
                                    <div class="form-group mb-3">
                                        <label for="name">Full Name</label>
                                        <input type="text" id="name" name="name" placeholder="Enter your full name" class="form-control" required value="<?php echo htmlspecialchars(empty($studentData['fullname']) ? "" : $studentData['fullname']); ?>" disabled="disabled">
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="studentid">Student ID</label>
                                        <input type="text" class="form-control" placeholder="Enter your student ID" pattern="\d{2}[A-Z]{3}\d{5}" name="studentid" id="studentid" required value="<?php echo isset($_POST['studentid']) ? htmlspecialchars($_POST['studentid']) : ""; ?>" disabled="disabled">
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="email">Email</label>
                                        <input type="email" class="form-control" placeholder="Enter your email" name="email" id="email" required value="<?php echo htmlspecialchars(empty($studentData['email']) ? "" : $studentData['email']); ?>" disabled="disabled">
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="card-number">Card Number</label>
                                        <input type="text" id="card-number" class="form-control" required placeholder="Eg. 1111 2222 3333 4444">
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="expiry-date">Expiry Date</label>
                                        <input type="text" id="expiry-date" class="form-control" placeholder="Eg. MM/YY" required>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="cvv">CVV</label>
                                        <input type="text" id="cvv" class="form-control" required placeholder="Eg. 123">
                                    </div>
                                    <div class="form-group mb-3">
                                        <input type="submit" class="btn btn-primary" name="placeorder" value="Submit Payment">
                                        <a class="btn btn-warning" href="cart-2.php" style="border: none; color: white; height: 50px;">Cancel</a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> <!-- /container -->
        <div class="mt-5">
            <?php include 'footer-2.php'; ?>
        </div>
    </body>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        (function ($) {
            $(window).scroll(function () {
                if ($(document).scrollTop() > 300) {
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

        $(document).ready(function () {
            $('form').submit(function (event) {
                var cardNumber = $('#card-number').val().trim();
                var cvv = $('#cvv').val().trim();
                var expiryDate = $('#expiry-date').val().trim();

                // Card number validation (16 digits)
                if (!/^\d{16}$/.test(cardNumber)) {
                    alert('Please enter a valid 16-digit card number.');
                    event.preventDefault();
                    return;
                }

                // CVV validation (3 digits)
                if (!/^\d{3}$/.test(cvv)) {
                    alert('Please enter a valid 3-digit CVV.');
                    event.preventDefault();
                    return;
                }

                // Expiry date validation (MM/YY format)
                if (!/^\d{2}\/\d{2}$/.test(expiryDate)) {
                    alert('Please enter a valid expiry date in MM/YY format.');
                    event.preventDefault();
                    return;
                }

                var currentMonth = new Date().getMonth() + 1;
                var currentYear = new Date().getFullYear().toString().slice(-2); // Extract last two digits

                var expiryParts = expiryDate.split('/');
                var inputMonth = parseInt(expiryParts[0], 10);
                var inputYear = parseInt(expiryParts[1], 10);

                // Check if expiry date is valid
                if (inputYear < currentYear || (inputYear === currentYear && inputMonth < currentMonth)) {
                    alert('Please enter a valid expiry date.');
                    event.preventDefault();
                    return;
                }

            });
        });
    </script>
</html>
