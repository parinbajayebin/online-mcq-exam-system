<?php
require_once("conn.php");
session_start();

$usertopic = "";
$usertopicErr = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (empty($_POST["user_topic"])) {  
        $usertopicErr = "Select in which Topic you want to conduct the exam..";  
    } else {  
        $usertopic = input_data($_POST["user_topic"]);  
    }       
}

function input_data($data) {  
    $data = trim($data);  
    $data = stripslashes($data);  
    $data = htmlspecialchars($data);  
    return $data;  
} 

$usersubject = $_SESSION['usersubjectupload'];

$query = "SELECT * from subject";
$result1 = mysqli_query($conn, $query);
while ($pow = mysqli_fetch_assoc($result1)) {
    if ($pow['subject_name'] == $usersubject) {
        $subject_id = $pow['subject_id'];
    }
}
$query1 = "SELECT * from topic where subject_id=" . $subject_id;
$result = mysqli_query($conn, $query1);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="student.css?v=1.0">
</head>
<body>
<div class="header">
    <button onclick="goBack()">Back</button><br>
</div>

<div class="container">
    <form method="post">
        Please select the Topic in which you want to conduct the exam:
        <br><br>
        <select name="user_topic" id="topic">
            <?php
            if (mysqli_num_rows($result) > 0) {
                echo "<option value=''>Select Topic</option>";
                while ($row = mysqli_fetch_assoc($result)) {
                    echo "<option value='" . $row["topic_name"] . "'>" . $row["topic_name"] . "</option>";
                }
            } else {
                echo "<option>No topics found</option>";
            }
            ?>
        </select>
        <span class="error"><?php echo $usertopicErr; ?></span><br><br>
        <button type="submit" name="submit">Submit</button>
    </form>
</div>

<?php
if (isset($_POST['submit'])) {
    if (empty($usertopicErr)) {
        $_SESSION['usertopicupload'] = $usertopic;

        $usercourseid=$_SESSION['courseid'];

        $subjectname = $_SESSION['usersubjectupload'];
        $query1 = "SELECT * FROM subject WHERE subject_name='$subjectname'";
        $result1 = mysqli_query($conn, $query1);
        while ($row1 = mysqli_fetch_assoc($result1)) {
            $usersubjectid = $row1['subject_id'];
        }

        $topicname = $_SESSION['usertopicupload'];
        $query2 = "SELECT * FROM topic WHERE topic_name='$topicname'";
        $result2 = mysqli_query($conn, $query2);
        while ($row2 = mysqli_fetch_assoc($result2)) {
            $usertopicid = $row2['topic_id'];
        }

        $_SESSION['usertopicid'] = $usertopicid;

        $userid = $_SESSION['userid'];

        // Fetch existing result_ids and their total_marks
        $query3 = "SELECT total_marks FROM result 
                   JOIN exam ON result.exam_id = exam.exam_id 
                   WHERE exam.user_id='$userid' 
                   AND exam.course_id='$usercourseid' 
                   AND exam.subject_id='$usersubjectid' 
                   AND exam.topic_id='$usertopicid'";
        $result3 = mysqli_query($conn, $query3);
        
        $maxTotalMarks = 0;
        $hasResults = false;
        while ($row3 = mysqli_fetch_assoc($result3)) {
            $hasResults = true;
            if ($row3['total_marks'] > $maxTotalMarks) {
                $maxTotalMarks = $row3['total_marks'];
            }
        }

        // Determine user_exam_category
        if (!$hasResults) {
            $userExamCategory = "easy";
        } else {
            if ($maxTotalMarks > 0 && $maxTotalMarks < 8) {
                $userExamCategory = "easy";
            } elseif ($maxTotalMarks >= 8 && $maxTotalMarks < 12) {
                $userExamCategory = "medium";
            } else {
                $userExamCategory = "hard";
            }
        }

        $_SESSION['user_exam_category'] = $userExamCategory;

        // Insert new exam
        $query4 = "INSERT INTO exam(user_id, course_id, subject_id, topic_id, exam_date) 
                   VALUES('$userid', '$usercourseid', '$usersubjectid', '$usertopicid', NOW())";
        if ($re=mysqli_query($conn, $query4)) {
            $exam_id = mysqli_insert_id($conn);
            $_SESSION['userexamid'] = $exam_id;
            header("Location: exam_instruction.php?category=$userExamCategory");
            exit();
        }

    }
}
?>

<script>
    function goBack() {
        window.history.back();
    }
</script>

</body>
</html>
