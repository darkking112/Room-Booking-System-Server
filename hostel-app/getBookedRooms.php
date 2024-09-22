<?php 
    header("Access-Control-Allow-Origin: http://localhost:3001");
    header("Content-Type: application/json");
    include "databaseConection.php";

    if(isset($_GET['userID'])) {
        $userID = $_GET['userID'];

        $query = "SELECT * FROM `roombookingview` WHERE User_ID = '$userID'";
        $result = mysqli_query($conn, $query);

        if($result) {
            $bookings = [];
            while ($row = mysqli_fetch_assoc($result)) {
                $bookings[] = $row;
            }

            echo json_encode([
                "status" =>  "success",
                "bookings" => $bookings
            ]);
        } else {
            echo json_encode([
                "status" => "error",
                "message" => "Error fetching booked rooms."
            ]);
        }
    } else {
        echo json_encode([
            "status" => "error",
            "message" => "User ID not provided"
        ]);
    }
?>