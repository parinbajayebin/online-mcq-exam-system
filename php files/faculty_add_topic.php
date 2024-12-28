<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Topic</title>
    <link rel="stylesheet" href="faculty.css?v=1.0">
</head>
<body>
<?php
session_start();
require_once("conn.php");

$addtopic = "";
$addtopicErr = "";
$flag = 0;

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (empty($_POST["addtopic"])) {
        $addtopicErr = "Add Topic first..";
    } else {
        $addtopic = input_data($_POST["addtopic"]);

        // Check if the topic already exists
        $query = "SELECT * FROM topic WHERE topic_name = '$addtopic'";
        $result = mysqli_query($conn, $query);

        if (mysqli_num_rows($result) > 0) {
            $flag = 1;
        } else {
            $flag = 0;
        }

        $usersubject = $_SESSION['usersubjectupload'];
        $query = "SELECT * FROM subject WHERE subject_name = '$usersubject'";
        $result1 = mysqli_query($conn, $query);

        if ($row = mysqli_fetch_assoc($result1)) {
            $subject_id = $row['subject_id'];
        }

        if ($flag == 0) {
            $query1 = "INSERT INTO topic(topic_name, subject_id) VALUES ('$addtopic', '$subject_id')";
            if (mysqli_query($conn, $query1)) {
                echo "<script type='text/javascript'>
                    alert('Topic Added Successfully.');
                    window.location = 'faculty_topic.php';
                </script>";
            } else {
                echo "<script type='text/javascript'>
                    alert('Error adding topic.');
                </script>";
            }
        } else {
            echo "<script type='text/javascript'>
                alert('Topic is already there.');
            </script>";
        }
    }
}

function input_data($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}
?>

<div class="header">
    <button onclick="goBack()">Back</button><br>
</div>

<div class="container">
<form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
Add Topic Name:<br><br>
    <input type="text" name="addtopic" value="<?php echo $addtopic; ?>">
    <span class="error"><?php echo $addtopicErr; ?></span><br><br>
    <button type="submit" name="submit">Add</button>
</form>
</div>

<script>
    function goBack() {
        window.history.back();
    }
</script>

</body>
</html>
