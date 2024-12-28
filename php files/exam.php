<?php
session_start();
require 'conn.php'; 

$topic_id = $_SESSION['usertopicid'];
$difficulty_level = $_SESSION['user_exam_category'];

if (!isset($_SESSION['questions'])) {
    $query = "SELECT * FROM mcq WHERE difficulty_level = '$difficulty_level' ORDER BY RAND() LIMIT 15";
    $result = mysqli_query($conn, $query);
    $questions = mysqli_fetch_all($result, MYSQLI_ASSOC);
    $_SESSION['questions'] = $questions;
    $_SESSION['current_question'] = 0;
    $_SESSION['score'] = 0;
    $_SESSION['answers'] = array();
    $_SESSION['show_correct_answer'] = false;
    $_SESSION['option_disabled'] = false; 
}

$current_question_index = $_SESSION['current_question'];
$current_question = $_SESSION['questions'][$current_question_index];
$show_correct_answer = $_SESSION['show_correct_answer'] ?? false;
$option_selected = $_SESSION['option_selected'] ?? false; 
$exam_id = $_SESSION['userexamid'];

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (isset($_POST['option'])) {
        $selected_option = mysqli_real_escape_string($conn, $_POST['option']);
        $_SESSION['option_selected'] = true; 

        $correct_answer = mysqli_real_escape_string($conn, $current_question['correct_answer']);

        if (!empty($selected_option)) {
            $_SESSION['answers'][$current_question_index] = $selected_option;

            $mcq_id = $current_question['mcq_id'];
            $insert_query = "INSERT INTO exam_question (exam_id, mcq_id, user_answer, user_answer_marks) VALUES ('$exam_id','$mcq_id', '$selected_option', 0)";
            $insert_result = mysqli_query($conn, $insert_query);

            if (!$insert_result) {
                echo "Error: " . mysqli_error($conn);
            }

            if ($selected_option == $correct_answer) {
                $_SESSION['score'] += 1;
                $update_query = "UPDATE exam_question SET user_answer_marks = 1 WHERE mcq_id = '$mcq_id'";
                mysqli_query($conn, $update_query);
            }
            $_SESSION['show_correct_answer'] = true;
        }
    }

    if (isset($_POST['next'])) {
        $_SESSION['current_question'] += 1;
        $_SESSION['show_correct_answer'] = false; 
        $_SESSION['option_selected'] = false; 
        $_SESSION['option_disabled'] = false; 
    }

    if (isset($_POST['submit']) && !$_SESSION['option_selected']) {
        $_SESSION['show_correct_answer'] = true;
        $mcq_id = $current_question['mcq_id'];
        $insert_query = "INSERT INTO exam_question (exam_id, mcq_id, user_answer, user_answer_marks) VALUES ('$exam_id','$mcq_id', NULL, 0)";
        $insert_result = mysqli_query($conn, $insert_query);
        if (!$insert_result) {
            echo "Error: " . mysqli_error($conn);
        }
    }

    if (isset($_POST['submit'])) {
        $_SESSION['option_disabled'] = true;
    }

    if ($_SESSION['current_question'] >= count($_SESSION['questions'])) {
        header("Location: result.php");
        exit;
    } else {
        header("Location: {$_SERVER['REQUEST_URI']}");
        exit;
    }
}
?>

<!DOCTYPE html>
<html>

<head>
    <title>Quiz</title>
    <link rel="stylesheet" href="exam.css?v=1.0">
    <style>
        #timer {
            color: red;
            font-weight: bold;
            font-size: 18px;
            font-family:Cursive;
            margin-bottom: 15px;
        }
    </style>
    <script>
        let timer;
        let countdown;

        function startTimer(duration) {
            timer = duration;
            countdown = setInterval(function () {
                timer--;
                let minutes = Math.floor(timer / 60);
                let seconds = timer % 60;

                document.getElementById("timer").innerHTML = `${minutes}:${seconds < 10 ? '0' : ''}${seconds}`;

                if (timer <= 0) {
                    clearInterval(countdown);
                    document.getElementById("submitBtn").click(); 
                }
            }, 1000);
        }

        window.onload = function () {
            startTimer(15);
        }
    </script>
</head>

<body>
    <form id="quizForm" method="POST">
        <h2>Question <?php echo $current_question_index + 1; ?>:</h2>
        <p class="question"><?php echo htmlspecialchars($current_question['question']); ?></p>
        <div id="timer" style="<?php echo $show_correct_answer ? 'display: none;' : ''; ?>">0:15</div> 
        <div class="options">
            <input type="radio" id="option1" name="option" value="<?php echo htmlspecialchars($current_question['option1']); ?>" <?php echo ($_SESSION['option_disabled']) ? 'disabled' : ''; ?>>
            <label for="option1"><?php echo htmlspecialchars($current_question['option1']); ?></label><br>

            <input type="radio" id="option2" name="option" value="<?php echo htmlspecialchars($current_question['option2']); ?>" <?php echo ($_SESSION['option_disabled']) ? 'disabled' : ''; ?>>
            <label for="option2"><?php echo htmlspecialchars($current_question['option2']); ?></label><br>

            <input type="radio" id="option3" name="option" value="<?php echo htmlspecialchars($current_question['option3']); ?>" <?php echo ($_SESSION['option_disabled']) ? 'disabled' : ''; ?>>
            <label for="option3"><?php echo htmlspecialchars($current_question['option3']); ?></label><br>

            <input type="radio" id="option4" name="option" value="<?php echo htmlspecialchars($current_question['option4']); ?>" <?php echo ($_SESSION['option_disabled']) ? 'disabled' : ''; ?>>
            <label for="option4"><?php echo htmlspecialchars($current_question['option4']); ?></label><br>
        </div>
        <?php if (!$option_selected && !$show_correct_answer) : ?>
            <button type="submit" name="submit" id="submitBtn">Submit</button>
        <?php elseif ($show_correct_answer) : ?>
            <button type="submit" name="next">Next</button>
            <p class="correct-answer">Correct Answer: <?php echo htmlspecialchars($current_question['correct_answer']); ?></p>
        <?php endif; ?>
    </form>
</body>

</html>
