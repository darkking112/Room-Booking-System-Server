<?php 
    header("Access-Control-Allow-Origin: http://localhost:3001");
    header("Content-Type: application/json");
    include "databaseConection.php";

    $query = "SELECT * FROM `rooms`";
    $result = mysqli_query($conn, $query);

    if($result) {
        $rooms = [];

        // Use while loop to fetch all rows and append them to the $rooms array
        while ($row = mysqli_fetch_assoc($result)) {
            $rooms[] = $row;  // Append each row to the array
        }

        echo json_encode([
            "status" =>  "success",
            "rooms" => $rooms
        ]);
    } else {
        echo json_encode([
            "status" =>  "error",
            "message" => "No rooms found."
        ]);
    }
?>
