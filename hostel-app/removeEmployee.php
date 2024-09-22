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
        $employeeID = $_POST["employeeID"];
        $userID = $_POST["userID"];

        $removeEmployeeQuery = "DELETE FROM `employees` WHERE `Employee_ID` = '$employeeID';";
        if (mysqli_query($conn, $removeEmployeeQuery)) {
            $removeUserQuery = "DELETE FROM `users` WHERE `User_ID` = '$userID';";
            if (mysqli_query($conn, $removeUserQuery)) {
                $selectQuery = "SELECT * FROM `employees`";
                $result = mysqli_query($conn, $selectQuery);
                if($result) {
                    $employees = [];

                    while($row = mysqli_fetch_assoc($result)) {
                        $employees[] = $row;
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
            } else {
                echo json_encode([
                    "status" =>  "error",
                    "message" => "User had not been removed."
                ]);
            }
        } else {
            echo json_encode([
                "status" =>  "error",
                "message" => "Employee had not been removed."
            ]);
        }
    }