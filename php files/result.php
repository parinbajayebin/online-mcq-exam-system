<?php
session_start();
require_once("conn.php");

function unsetSessionsExcept($exceptions) {
    foreach ($_SESSION as $key => $value) {
        if (!in_array($key, $exceptions)) {
            unset($_SESSION[$key]);
        }
    }
}

if (isset($_SESSION['userexamid'])) {
    $examid = mysqli_real_escape_string($conn, $_SESSION['userexamid']);
    $userid = mysqli_real_escape_string($conn, $_SESSION['userid']);

    $sql = "SELECT exam_id, SUM(user_answer_marks) AS total_marks FROM exam_question WHERE exam_id = '$examid' GROUP BY exam_id";

    $result = mysqli_query($conn, $sql);

    if (mysqli_num_rows($result) > 0) {
        echo "<table border='1'>";
        echo "<tr><th>Exam ID</th><th>Out of 15</th></tr>";

        while ($row = mysqli_fetch_assoc($result)) {
            echo "<tr><td>" . $row["exam_id"] . "</td><td>" . $row["total_marks"] . "</td></tr>";
            $total_marks = $row["total_marks"];

            $query = "INSERT INTO result (exam_id, user_id, total_marks) VALUES ('$examid', '$userid', '$total_marks')";
            $resultt = mysqli_query($conn, $query);
            if (!$resultt) {
                echo "Error: " . mysqli_error($conn);
            }
        }

        echo "</table>";
    } else {
        echo "0 results";
    }
} else {
    echo "Exam ID is not set in session.";
}

$preservedSessions = array('userid', 'username', 'usercategory', 'status', 'courseid', 'mono', 'email');
unsetSessionsExcept($preservedSessions);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f8f8;
        }

        h1 {
            margin-top: 20px;
            text-align: center;
        }

        table {
            width: 30%; 
            border-collapse: collapse;
            border-spacing: 0;
            margin: 300px auto; 
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #f5f5f5;
        }

        .header {
            position: absolute;
            top: 5px;
            right: 5px;
        }

        .header button {
            display: inline-block;
        }

        button {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="header">
        <button onclick="home()">Home</button><br>
    </div>

    <script>
        function home() {
            window.location.href = 'student_interface.php';
        }
    </script>

</body>
</html>
