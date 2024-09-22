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
    if ($_SERVER['REQUEST_METHOD'] === 'POST'){
        $bookingID = $_POST["bookingID"];
        $roomID = $_POST["roomID"];

        $removeBookingQuery = "DELETE FROM `bookings` WHERE `Booking_ID` = $bookingID";
        if (mysqli_query($conn, $removeBookingQuery)) {
            $updateRoomQuery = "UPDATE `rooms` SET `STATUS` = 'Available' WHERE `Room_ID` = $roomID;";
            if (mysqli_query($conn, $updateRoomQuery)) {
                echo json_encode([
                    "status" => "success"
                ]);
            } else {
                echo json_encode([
                    "status" => "error",
                    "message" => "Room had not been updated."
                ]);
            }
        } else {
            echo json_encode([
                "status" => "error",
                "message" => "Bookin had not been canceled."
            ]);
        }
    }

?>