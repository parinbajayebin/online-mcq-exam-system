<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Subject</title>
    <link rel="stylesheet" href="faculty.css?v=1.0">
</head>
<body>
<?php
session_start();
require_once("conn.php");

$addsubject = "";
$addsubjectErr = "";
$flag = 0;

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (empty($_POST["addsub"])) {
        $addsubjectErr = "Add subject first..";
    } else {
        $addsubject = input_data($_POST["addsub"]);

        $query = "SELECT * FROM subject WHERE subject_name = '$addsubject'";
        $result = mysqli_query($conn, $query);

        if (mysqli_num_rows($result) > 0) {
            $flag = 1;
        } else {
            $flag = 0;
        }

        $usercourse = $_SESSION['usercourseupload'];
        $query = "SELECT * FROM course WHERE course_name = '$usercourse'";
        $result1 = mysqli_query($conn, $query);

        if ($row = mysqli_fetch_assoc($result1)) {
            $course_id = $row['course_id'];
        }

        if ($flag == 0) {
            $query = "INSERT INTO subject(subject_name, course_id) VALUES ('$addsubject', '$course_id')";
            if (mysqli_query($conn, $query)) {
                echo "<script type='text/javascript'>
                    alert('Subject Added Successfully.');
                    window.location = 'faculty_subject.php';
                </script>";
            } else {
                echo "<script type='text/javascript'>
                    alert('Error adding subject.');
                </script>";
            }
        } else {
            echo "<script type='text/javascript'>
                alert('Subject is already there.');
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
    Add Subject Name:<br><br>
    <input type="text" name="addsub" value="<?php echo $addsubject; ?>">
    <span class="error"><?php echo $addsubjectErr; ?></span><br><br>
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
