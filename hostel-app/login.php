<?php 
    // Allow cross-origin requests from the React app running on localhost:3001
    header("Access-Control-Allow-Origin: http://localhost:3001");
    header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
    header("Access-Control-Allow-Headers: Content-Type");

    // Handle the preflight request for CORS (OPTIONS method)
    if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
        // Just send the headers if it's an OPTIONS request (no need for other code)
        http_response_code(200);
        exit();
    }

    // Connect to the database
    include "databaseConection.php";

    // Handle the POST request
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        // Retrieve email and password from the POST request
        $email = mysqli_real_escape_string($conn, $_POST["email"]);
        $password = mysqli_real_escape_string($conn, $_POST["password"]);

        // Query to check if the user exists in the 'Users' table
        $query = "SELECT * FROM users WHERE email = '$email' AND password = '$password' LIMIT 1";
        $result = mysqli_query($conn, $query);

        if (mysqli_num_rows($result) > 0) {
            $user = mysqli_fetch_assoc($result); // Get the user's data from 'Users' table
            $user_type = $user['User_Type'];     // Fetch user type ('guest', 'admin', or 'employee')

            // Fetch full user information based on the User_Type
            $user_id = $user['User_ID'];
            $query = "SELECT * FROM {$user_type}s WHERE User_ID = '$user_id' LIMIT 1";
            $result = mysqli_query($conn, $query);
            $userInfo = mysqli_fetch_assoc($result);

            // Return the full user info as a JSON response
            echo json_encode([
                "status" => "success",
                "user_type" => $user_type,
                "user_info" => $userInfo
            ]);
        } else {
            // User does not exist or invalid credentials
            echo json_encode([
                "status" => "error",
                "message" => "Invalid email or password"
            ]);
        }
    }

?>
