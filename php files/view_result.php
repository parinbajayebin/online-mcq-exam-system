<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Details</title>
    <link rel="stylesheet" href="view_student.css?v=1.0">
</head>
<body>
<div class="header">
    <button onclick="home()">Home</button><br>
</div>
<br><br><br>
<h1>Your Progress</h1>
<br>
<?php
require_once("conn.php");
session_start();

if (!isset($_SESSION["courseid"]) || !isset($_SESSION["userid"])) {
    echo "Session variables are not set.";
    exit;
}

$records_per_page = 4;
$current_page = isset($_GET['page']) && is_numeric($_GET['page']) ? intval($_GET['page']) : 1;
$start_from = ($current_page - 1) * $records_per_page;

$courseid = mysqli_real_escape_string($conn, $_SESSION["courseid"]);
$userid = mysqli_real_escape_string($conn, $_SESSION["userid"]);

$query = "SELECT * FROM exam WHERE course_id='$courseid' AND user_id='$userid' LIMIT $start_from, $records_per_page";
$result = mysqli_query($conn, $query);

if (!$result) {
    echo "Error executing query: " . mysqli_error($conn);
    exit;
}

if (mysqli_num_rows($result) == 0) {
    echo "No records found.";
    exit;
}

echo "<table>";
echo "<tr><th>Name</th><th>Course</th><th>Subject</th><th>Topic</th><th>Exam ID</th><th>Date</th><th>Result ID</th><th>Total Marks</th></tr>";

while ($record = mysqli_fetch_assoc($result)) {
    $courseid = mysqli_real_escape_string($conn, $record['course_id']);
    $subjectid = mysqli_real_escape_string($conn, $record['subject_id']);
    $topicid = mysqli_real_escape_string($conn, $record['topic_id']);
    $userid = mysqli_real_escape_string($conn, $record['user_id']);
    $examid = mysqli_real_escape_string($conn, $record['exam_id']);
    $exam_date = htmlspecialchars($record['exam_date']);

    // Fetch course name
    $query1 = "SELECT course_name FROM course WHERE course_id='$courseid'";
    $result1 = mysqli_query($conn, $query1);
    $coursename = mysqli_fetch_assoc($result1)['course_name'];

    // Fetch subject name
    $query2 = "SELECT subject_name FROM subject WHERE subject_id='$subjectid'";
    $result2 = mysqli_query($conn, $query2);
    $subjectname = mysqli_fetch_assoc($result2)['subject_name'];

    // Fetch topic name
    $query3 = "SELECT topic_name FROM topic WHERE topic_id='$topicid'";
    $result3 = mysqli_query($conn, $query3);
    $topicname = mysqli_fetch_assoc($result3)['topic_name'];

    // Fetch user name
    $query4 = "SELECT name FROM user WHERE user_id='$userid'";
    $result4 = mysqli_query($conn, $query4);
    $username = mysqli_fetch_assoc($result4)['name'];

    // Fetch result details
    $query5 = "SELECT total_marks, result_id FROM result WHERE exam_id='$examid'";
    $result5 = mysqli_query($conn, $query5);
    $result_details = mysqli_fetch_assoc($result5);
    $total_marks = htmlspecialchars($result_details['total_marks']);
    $result_id = htmlspecialchars($result_details['result_id']);

    echo "<tr>";
    echo "<td>" . htmlspecialchars($username) . "</td>";
    echo "<td>" . htmlspecialchars($coursename) . "</td>";
    echo "<td>" . htmlspecialchars($subjectname) . "</td>";
    echo "<td>" . htmlspecialchars($topicname) . "</td>";
    echo "<td>" . htmlspecialchars($examid) . "</td>";
    echo "<td>" . htmlspecialchars($exam_date) . "</td>";
    echo "<td>" . htmlspecialchars($result_id) . "</td>";
    echo "<td>" . htmlspecialchars($total_marks) . "</td>";
    echo "</tr>";
}
echo "</table>";

// Pagination
$query = "SELECT COUNT(*) AS total FROM exam WHERE course_id='$courseid' AND user_id='$userid'";
$result = mysqli_query($conn, $query);
$row = mysqli_fetch_assoc($result);
$total_records = $row['total'];
$total_pages = ceil($total_records / $records_per_page);

echo "<div class='pagination'>";
for ($i = 1; $i <= $total_pages; $i++) {
    echo "<a href='?page=$i'>$i</a> ";
}
echo "</div>";

mysqli_close($conn);
?>

<script>
    function home() {
        window.location.href = 'student_interface.php';
    }
</script>

</body>
</html>
