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
        // Retrieve and sanitize input data
        $name = mysqli_real_escape_string($conn, $_POST["name"]);
        $age = mysqli_real_escape_string($conn, $_POST["age"]);
        $phoneNo = mysqli_real_escape_string($conn, $_POST["phoneNo"]);
        $gender = mysqli_real_escape_string($conn, $_POST["gender"]); // Correct 'gender' field
        $email = mysqli_real_escape_string($conn, $_POST["email"]);
        $password = mysqli_real_escape_string($conn, $_POST["password"]);

        // Check if email is already registered
        $checkEmailQuery = "SELECT * FROM users WHERE Email = '$email'";
        $emailResult = mysqli_query($conn, $checkEmailQuery);

        if (mysqli_num_rows($emailResult) > 0) {
            // Email already registered
            echo json_encode([
                "status" => "error",
                "message" => "Email is already registered."
            ]);
        } else {
            // Insert user into the users table
            $insertUserQuery = "INSERT INTO users (`Email`, `Password`, `User_Type`) VALUES ('$email', '$password', 'guest')";
            if (mysqli_query($conn, $insertUserQuery)) {
                $userId = mysqli_insert_id($conn);

                // Insert guest into the guests table
                $insertGuestQuery = "INSERT INTO guests (`Email`, `Password`, `Name`, `Age`, `Phone_Number`, `Gender`, `User_ID`) 
                                     VALUES ('$email', '$password', '$name', '$age', '$phoneNo', '$gender', '$userId')";
                
                if (mysqli_query($conn, $insertGuestQuery)) {
                    echo json_encode([
                        "status" => "success",
                        "message" => "Guest Registered Successfully."
                    ]);
                } else {
                    // Error inserting into guests table
                    echo json_encode([
                        "status" => "error",
                        "message" => "Failed to insert into Guests table."
                    ]);
                }
            } else {
                // Error inserting into users table
                echo json_encode([
                    "status" => "error",
                    "message" => "Failed to insert into Users table."
                ]);
            }
        }
    }
?>
