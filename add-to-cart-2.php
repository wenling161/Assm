<?php

$uniq_id = "O" . substr(uniqid(), -7);

$product_id = $_GET['product_id']; // Replace with actual item ID
$studentID = $_GET['studentID'];
$addQuantity = $_GET['quantity'];
// connect to the database

$conn = new mysqli('database1.cfs6wemgo5yu.us-east-1.rds.amazonaws.com', 'admin', 'Abcd1234', 'database1', '3306');

// check if the item is already in the cart for the current user
$cart_query = "SELECT * FROM cart WHERE product_id = ? AND studentid = ?";
$stmt = mysqli_prepare($conn, $cart_query);
mysqli_stmt_bind_param($stmt, "ss", $product_id, $studentID);
mysqli_stmt_execute($stmt);
$cart_result = mysqli_stmt_get_result($stmt);

if (mysqli_num_rows($cart_result) > 0) {
    //if item already exist in the cart then update the quantity
   $cart_row = mysqli_fetch_assoc($cart_result);
   $quantity = $addQuantity;
   $update_query = "UPDATE cart SET quantity = ? WHERE product_id = ? AND studentid = ?";
    $update_stmt = mysqli_prepare($conn, $update_query);
    mysqli_stmt_bind_param($update_stmt, "iss", $quantity, $product_id, $studentID);
    mysqli_stmt_execute($update_stmt);
} else {
   // if the item is not in the cart, insert a new row
   $price = $_GET['price'];
   $insert_query = "INSERT INTO cart (orderid, product_id, studentid, quantity, price) VALUES ('$uniq_id', '$product_id', '$studentID', 1, '$price')";
   $result = mysqli_query($conn, $insert_query);

    if (!$result) {
        echo "Error inserting data: " . mysqli_error($conn);
    }
}

header('Location: event-details-2.php');
exit;
?>