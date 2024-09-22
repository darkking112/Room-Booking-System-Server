<?php 
    header("Access-Control-Allow-Origin: http://localhost:3001"); // Allow requests from this origin
    header("Access-Control-Allow-Methods: POST, GET, OPTIONS"); // Allow specific methods
    header("Access-Control-Allow-Headers: Content-Type"); // Allow Content-Type header

    // Handle the preflight request for CORS (OPTIONS method)
    if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
        http_response_code(200); // Indicate success
        exit(); // No further processing needed for OPTIONS request
    }

    include "databaseConection.php"; // Database connection

    // Handle the POST request
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $userID = $_POST["userID"];
        $name = $_POST["name"];
        $phoneNo = $_POST["phoneNo"];
        $roomID = $_POST["roomID"];
        $bookingType = $_POST["bookingType"];
        $date = date("Y/m/d");

        $insertQuery = "INSERT INTO `bookings` (`Guest_Name`, `Guest_Phone_Number`, `Booking_Type`, `Booking_Date`, `User_ID`, `Room_ID`) 
                                        VALUES ('$name', '$phoneNo', '$bookingType', '$date', '$userID', '$roomID');";

        if (mysqli_query($conn, $insertQuery)) {
            $updateQuery = "UPDATE `rooms` SET `Status` = 'Reserved' WHERE `Room_ID` = '$roomID';";
            if (mysqli_query($conn, $updateQuery)) {
                echo json_encode([
                    "status" => "success",
                ]);
            }
        } else {
            echo json_encode([
                "status" => "error",
                "message" => "Booking had not been inserted."
            ]);
        }
    }
?>