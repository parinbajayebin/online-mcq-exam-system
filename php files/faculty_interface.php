<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="faculty.css?v=1.0">
</head>
<body>
  
<div class="header">
    <button id="myBtn">Profile</button>
</div>

<?php
session_start();
$userid = $_SESSION['userid'];
$username = $_SESSION['username'];
$email = $_SESSION['email'];
$mobileno = $_SESSION['mono'];
?>

<div id="myModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <center><h2>User Profile</h2>
        <table>
            <tr>
                <th>User ID:</th>
                <td><?php echo $userid; ?></td>
            </tr>
            <tr>
                <th>Name:</th>
                <td><?php echo $username; ?></td>
            </tr>
            <tr>
                <th>Email:</th>
                <td><?php echo $email; ?></td>
            </tr>
            <tr>
                <th>Mobile No:</th>
                <td><?php echo $mobileno; ?></td>
            </tr>
        </table></center><br>
        <form method="post" action="edit_profile.php">
            <button type="submit" name="edit_profile">Edit Profile</button>
        </form><br>
        <form method="post" action="logout.php">
            <button type="submit" name="logout">Logout</button>
        </form>
    </div>
</div>

    <form method="post" id="actionForm">
        <button type="submit" name="upload_csv" style="margin: 40px;">Upload CSV</button>
        <button type="submit" name="view_student" style="margin: 40px;">View Student</button>
    </form>

<script>
    var modal = document.getElementById("myModal");
    var btn = document.getElementById("myBtn");
    var span = document.getElementsByClassName("close")[0];

    btn.onclick = function() {
        modal.style.display = "block";
    }

    span.onclick = function() {
        modal.style.display = "none";
    }

    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
</script>

<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (isset($_POST['upload_csv'])) {
        header('Location: faculty_course.php');
        exit();
    } elseif (isset($_POST['view_student'])) {
        header('Location: view_student.php');
        exit();
    }
}
?>

</body>
</html>
