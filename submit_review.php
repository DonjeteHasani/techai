<?php
session_start();
include 'config.php';

if (!isset($_SESSION['is_logged_in'])) {
    header("Location: login.php");
    exit;
}

if (!isset($_POST['product_id'], $_POST['rating']) || empty($_POST['product_id']) || empty($_POST['rating'])) {
    die("Invalid input. Please select a rating.");
}

$userId = $_SESSION['user_id'];
$productId = intval($_POST['product_id']);
$rating = intval($_POST['rating']);

// Insert the review into the database
$stmt = $pdo->prepare("INSERT INTO reviews (user_id, product_id, rating) VALUES (?, ?, ?)");
$stmt->execute([$userId, $productId, $rating]);

header("Location: productdetail.php?id=" . $productId . "&review=success");
exit;
