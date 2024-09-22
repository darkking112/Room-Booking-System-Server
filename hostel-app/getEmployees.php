<?php 
    header("Access-Control-Allow-Origin: http://localhost:3001");
    header("Content-Type: application/json");
    include "databaseConection.php";

    $query = "SELECT * FROM `employees`";
    $result = mysqli_query($conn, $query);

    if($result) {
        $employees = [];

        // Use while loop to fetch all rows and append them to the $rooms array
        while ($row = mysqli_fetch_assoc($result)) {
            $employees[] = $row;  // Append each row to the array
        }

        echo json_encode([
            "status" =>  "success",
            "employees" => $employees
        ]);
    } else {
        echo json_encode([
            "status" =>  "error",
            "message" => "No employees found."
        ]);
    }
?>