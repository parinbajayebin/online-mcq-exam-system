<?php
session_start();
require 'conn.php'; // Include your database connection script

// Fetch topic_id from session
$topic_id = $_SESSION['usertopicid'];
$difficulty_level=$_SESSION['user_exam_category'];

// Fetch 15 random easy difficulty questions if not already fetched
if (!isset($_SESSION['questions'])) {
    $query = "SELECT * FROM mcq WHERE difficulty_level = '$difficulty_level' ORDER BY RAND() LIMIT 15";
    $result = mysqli_query($conn, $query);
    $questions = mysqli_fetch_all($result, MYSQLI_ASSOC);
    $_SESSION['questions'] = $questions;
    $_SESSION['current_question'] = 0;
    $_SESSION['score'] = 0;
    $_SESSION['answers'] = array();
    $_SESSION['show_correct_answer'] = false;
}

// Initialize variables
$current_question_index = $_SESSION['current_question'];
$current_question = $_SESSION['questions'][$current_question_index];
$show_correct_answer = $_SESSION['show_correct_answer'] ?? false;
$option_selected = $_SESSION['option_selected'] ?? false; // Get option_selected from session
$exam_id = $_SESSION['userexamid'];

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (isset($_POST['option'])) {
        $selected_option = mysqli_real_escape_string($conn, $_POST['option']);
        $_SESSION['option_selected'] = true; // Set option_selected to true if an option is selected

        $correct_answer = mysqli_real_escape_string($conn, $current_question['correct_answer']);

        // Store user answer if an option was selected
        if (!empty($selected_option)) {
            $_SESSION['answers'][$current_question_index] = $selected_option;

            // Insert mcq_id, user selected answer, and initialize user_answer_marks in exam_question table
            $mcq_id = $current_question['mcq_id'];
            $insert_query = "INSERT INTO exam_question (exam_id, mcq_id, user_answer, user_answer_marks) VALUES ('$exam_id','$mcq_id', '$selected_option', 0)";
            $insert_result = mysqli_query($conn, $insert_query);

            if (!$insert_result) {
                echo "Error: " . mysqli_error($conn);
            }

            // Check if the selected option is correct
            if ($selected_option == $correct_answer) {
                $_SESSION['score'] += 1;
                // Update user_answer_marks to 1 if answer is correct
                $update_query = "UPDATE exam_question SET user_answer_marks = 1 WHERE mcq_id = '$mcq_id'";
                mysqli_query($conn, $update_query);
            }
            $_SESSION['show_correct_answer'] = true;
        }
    }

    // Move to the next question
    if (isset($_POST['next'])) {
        $_SESSION['current_question'] += 1;
        $_SESSION['show_correct_answer'] = false; // Hide correct answer for the next question
        $_SESSION['option_selected'] = false; // Reset option selected
        $_SESSION['option_disabled'] = false; // Reset option disabled
    }

    // If "Submit" button is clicked without selecting an option, show the correct answer and proceed to the next question
    if (isset($_POST['submit']) && !$_SESSION['option_selected']) {
        // Show the correct answer
        $_SESSION['show_correct_answer'] = true;
        // Store null value for the user's answer in exam_question table
        $mcq_id = $current_question['mcq_id'];
        $insert_query = "INSERT INTO exam_question (exam_id, mcq_id, user_answer, user_answer_marks) VALUES ('$exam_id','$mcq_id', NULL, 0)";
        $insert_result = mysqli_query($conn, $insert_query);
        if (!$insert_result) {
            echo "Error: " . mysqli_error($conn);
        }
    }

    // Set option_disabled based on whether the "Submit" button is clicked
    if (isset($_POST['submit'])) {
        $_SESSION['option_disabled'] = true;
    }

    // Redirect to prevent form resubmission
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
</head>

<body>
    <form id="quizForm" method="POST">
        <h2>Question <?php echo $current_question_index + 1; ?>:</h2>
        <p class="question"><?php echo htmlspecialchars($current_question['question']); ?></p>
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
            <button type="submit" name="submit">Submit</button>
        <?php elseif ($show_correct_answer) : ?>
            <button type="submit" name="next">Next</button>
            <p class="correct-answer">Correct Answer: <?php echo htmlspecialchars($current_question['correct_answer']); ?></p>
        <?php endif; ?>
    </form>
</body>

</html>
