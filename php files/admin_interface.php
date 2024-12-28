<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pending and Approved Users</title>
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
            width: 90%;
            border-collapse: collapse;
            border-spacing: 0;
            margin-top: 20px;
            margin-left: 80px;

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

        form {
            display: inline-block;
        }

        input[type="submit"] {
            border: 2px solid #007bff;
            background-color: transparent;
            color: #007bff;
            padding: 10px 10px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 6px;
            transition: all 0.3s ease;
            outline: none;
        }

        input[type="submit"]:hover {
            background-color: #007bff;
            color: #fff;
        }

        .pagination {
            text-align: center;
            margin-top: 20px;
        }

        .pagination a {
            color: #007bff;
            padding: 8px 16px;
            text-decoration: none;
            transition: background-color 0.3s;
        }

        .pagination a.active {
            background-color: #007bff;
            color: white;
        }

        .pagination a:hover:not(.active) {
            background-color: #ddd;
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
    <button onclick="logout()">Log Out</button><br>
</div>
<br>
    <br>
    <h1>Pending List</h1>
    <br>
    <?php
    require_once("conn.php");
    
    $records_per_page = 2; // Define the number of records per page
    $current_page = isset($_GET['page']) ? intval($_GET['page']) : 1;
    $start_from = ($current_page - 1) * $records_per_page;

    $fetch = "SELECT * FROM user WHERE status = 'pending' LIMIT $start_from, $records_per_page";
    $result = mysqli_query($conn, $fetch);

    echo "<table>";
    echo "<tr><th>Name</th><th>Username</th><th>Mobile No</th><th>User Category</th><th>Status</th></tr>";

    while($record = mysqli_fetch_assoc($result)) {
        echo "<tr>";
        echo "<td>" . htmlspecialchars($record["name"]) . "</td>";
        echo "<td>" . htmlspecialchars($record["username"]) . "</td>";
        echo "<td>" . htmlspecialchars($record["mobileno"]) . "</td>";
        echo "<td>" . htmlspecialchars($record["user_category"]) . "</td>";
        echo "<td>";
        echo "<form action='admin_interface.php' method='POST'>";
        echo "<input type='hidden' name='id' value='" . $record['user_id'] . "'>";
        echo "<input type='submit' name='approve' value='Approve'>";
        echo "<input type='submit' name='reject' value='Reject'> ";
        echo "</form>";
        echo "</td>";
        echo "</tr>";
    }
    echo "</table>";

    $query = "SELECT COUNT(*) AS total FROM user WHERE status = 'pending'";
    $result = mysqli_query($conn, $query);
    $row = mysqli_fetch_assoc($result);
    $total_records = $row['total'];
    $total_pages = ceil($total_records / $records_per_page);

    echo "<div class='pagination'>";
    for ($i = 1; $i <= $total_pages; $i++) {
        echo "<a href='?page=$i'>$i</a> ";
    }
    echo "</div>";

    if(isset($_POST['approve'])) {
        $id = mysqli_real_escape_string($conn, $_POST['id']);
        $query = "UPDATE user SET status = 'approved' WHERE user_id = '$id'";
        mysqli_query($conn, $query);
        header("location: admin_interface.php");
    }

    if(isset($_POST['reject'])) {
        $id = mysqli_real_escape_string($conn, $_POST['id']);
        $query = "DELETE FROM user WHERE user_id = '$id'";
        mysqli_query($conn, $query);
        header("location: admin_interface.php");
    }
    ?>

    <br>
    <h1>Approval List</h1>
    <br>
    <?php
    $records_per_page = 2;
    $current_page = isset($_GET['page']) && is_numeric($_GET['page']) ? intval($_GET['page']) : 1;
    $start_from = ($current_page - 1) * $records_per_page;

    $query2 = "SELECT * FROM user WHERE status = 'approved' LIMIT $start_from, $records_per_page";
    $result = mysqli_query($conn, $query2);

    echo "<table>";
    echo "<tr><th>Name</th><th>Username</th><th>Mobile No</th><th>User Category</th><th>Status</th></tr>";

    while($record = mysqli_fetch_assoc($result)) {
        echo "<tr>";
        echo "<td>" . htmlspecialchars($record["name"]) . "</td>";
        echo "<td>" . htmlspecialchars($record["username"]) . "</td>";
        echo "<td>" . htmlspecialchars($record["mobileno"]) . "</td>";
        echo "<td>" . htmlspecialchars($record["user_category"]) . "</td>";
        echo "<td>" . htmlspecialchars($record["status"]) . "</td>";
        echo "</tr>";
    }
    echo "</table>";

    $query = "SELECT COUNT(*) AS total FROM user WHERE status = 'approved'";
    $result = mysqli_query($conn, $query);
    $row = mysqli_fetch_assoc($result);
    $total_records = $row['total'];
    $total_pages = ceil($total_records / $records_per_page);

    echo "<div class='pagination'>";
    for ($i = 1; $i <= $total_pages; $i++) {
        echo "<a href='?page=$i'>$i</a> ";
    }
    echo "</div>";
    ?>

<script>
    function logout() {
        window.location.href = 'logout.php';
    }
</script>

</body>
</html>
