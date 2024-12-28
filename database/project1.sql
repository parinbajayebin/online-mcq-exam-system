-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 26, 2024 at 09:46 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project1`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_id` int(11) NOT NULL,
  `course_name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_id`, `course_name`) VALUES
(1, 'msccs'),
(2, 'aiml'),
(3, 'mca');

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

CREATE TABLE `exam` (
  `exam_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `exam_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exam`
--

INSERT INTO `exam` (`exam_id`, `user_id`, `course_id`, `subject_id`, `topic_id`, `exam_date`) VALUES
(1, 1, 1, 1, 3, '2024-06-27 01:13:09');

-- --------------------------------------------------------

--
-- Table structure for table `exam_question`
--

CREATE TABLE `exam_question` (
  `exam_mcq_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `mcq_id` int(11) NOT NULL,
  `user_answer` longtext DEFAULT NULL,
  `user_answer_marks` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exam_question`
--

INSERT INTO `exam_question` (`exam_mcq_id`, `exam_id`, `mcq_id`, `user_answer`, `user_answer_marks`) VALUES
(1, 1, 111, NULL, 0),
(2, 1, 138, '10', 1),
(3, 1, 125, 'merge', 0),
(4, 1, 85, 'Deletion of a specific node', 1),
(5, 1, 93, '?union, intersection', 1),
(6, 1, 128, 'dummy', 0),
(7, 1, 130, 'Primitive list', 0),
(8, 1, 116, 'circular linked list', 0),
(9, 1, 60, NULL, 0),
(10, 1, 5, 'It points to the last node ', 1),
(11, 1, 105, 'Insertion at the end', 0),
(12, 1, 137, 'insertion at the back', 0),
(13, 1, 146, 'Reverses the elements of two singly linked lists', 0),
(14, 1, 7, 'circular linked list ', 0),
(15, 1, 101, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mcq`
--

CREATE TABLE `mcq` (
  `mcq_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `question` longtext NOT NULL,
  `option1` longtext NOT NULL,
  `option2` longtext NOT NULL,
  `option3` longtext NOT NULL,
  `option4` longtext NOT NULL,
  `correct_answer` longtext NOT NULL,
  `question_category` enum('memorybased','understanding','fillups','example') NOT NULL,
  `difficulty_level` enum('easy','medium','hard') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mcq`
--

INSERT INTO `mcq` (`mcq_id`, `topic_id`, `question`, `option1`, `option2`, `option3`, `option4`, `correct_answer`, `question_category`, `difficulty_level`) VALUES
(1, 3, 'What is a linked list?', ' A linear data structure', 'A sorting algorithm', 'A type of tree structure', 'A database query language', ' A linear data structure', 'memorybased', 'easy'),
(2, 3, 'Which of the following is true about a singly linked list?', 'Each node has two pointers', 'Traversal can only be done in one direction', ' It requires less memory than a doubly linked list', 'Deletion at the middle requires O(1) time complexity', 'Traversal can only be done in one direction', 'memorybased', 'easy'),
(3, 3, 'What is the time complexity of inserting a node at the beginning of a linked list', 'O(1)', 'O(log n)', 'O(n)', 'O(n log n)', 'O(1)', 'memorybased', 'medium'),
(4, 3, 'Which of the following is not an advantage of a linked list over an array?', 'Dynamic size', 'Ease of insertion/deletion at any position', 'Random access of elements', 'Efficient memory utilization', 'Random access of elements', 'memorybased', 'medium'),
(5, 3, 'What is the purpose of a tail pointer in a linked list? ', ' It points to the previous node ', 'It points to the next node ', 'It points to the last node ', 'It points to the first node ', 'It points to the last node ', 'memorybased', 'easy'),
(6, 3, 'In a circular linked list, how does the last node point to the first node?', 'NULL pointer', 'It points to the previous node ', 'it points to a special marker indicating the end', 'it directly points to first node', 'it directly points to first node', 'understanding', 'medium'),
(7, 3, 'Which type of linked list allows traversal in both directions?', 'singly linked list', 'doubly linked list', 'circular linked list ', 'skip list', 'doubly linked list', 'memorybased', 'easy'),
(8, 3, 'What is a dummy node in a linked list?', 'A node with null pointers', 'A node with data equal to zero', 'A node used as a placeholder', 'A node that is disconnected from the list', 'A node used as a placeholder', 'memorybased', 'medium'),
(9, 3, 'How is memory allocated for nodes in a linked list?', 'Contiguous allocation', 'Stack allocation', 'Heap allocation', 'Global allocation', 'Heap allocation', 'memorybased', 'easy'),
(10, 3, 'Which operation in a linked list has the highest time complexity?', 'Insertion at the beginning', 'Insertion at the end', 'Deletion at the beginning', 'Deletion at the end', 'Deletion at the end', 'understanding', 'hard'),
(11, 3, 'What is the memory overhead for each node in a singly linked list in a 32-bit system?', '4 bytes', '8 bytes', '12 bytes', '16 bytes', '4 bytes', 'memorybased', 'hard'),
(12, 3, 'How does memory allocation for nodes in a linked list differ from arrays?', 'Nodes are allocated contiguously in memory', 'Nodes are allocated on the stack', 'Nodes are allocated dynamically on the heap', 'Nodes are allocated statically', 'Nodes are allocated dynamically on the heap', 'memorybased', 'medium'),
(13, 3, 'What is the significance of the \"next\" pointer in a linked list node?', 'It stores the value of the node', 'It points to the previous node', 'It points to the next node in the sequence', 'It contains metadata about the node', 'It points to the next node in the sequence', 'memorybased', 'easy'),
(14, 3, 'In a doubly linked list, how much additional memory is required per node compared to a singly linked list?', 'Same amount', 'Half amount', 'Twice the amount', 'Three times the amount', 'Twice the amount', 'memorybased', 'medium'),
(15, 3, 'When a node is dynamically allocated for a linked list, what type of memory allocation function is commonly used?', 'malloc()', 'free()', 'realloc()', 'calloc()', 'malloc()', 'memorybased', 'easy'),
(16, 3, 'What is the term for memory leaks that can occur in linked lists?', 'Segmentation fault', 'Memory fragmentation', 'Memory leak', 'Dangling pointer', 'Memory leak', 'memorybased', 'hard'),
(17, 3, 'How does the memory usage of a linked list compare to that of an array when it comes to dynamic resizing?', 'Linked list consumes more memory', 'Array consumes more memory', 'Both consume the same amount of memory', 'It depends on the implementation', '. Linked list consumes more memory', 'understanding', 'medium'),
(18, 3, 'What happens if memory allocation fails during node creation in a linked list?', 'Program crashes', ' Operating system reallocates memory', 'Null pointer is returned', 'Garbage collector intervenes', 'Null pointer is returned', 'understanding', 'easy'),
(19, 3, 'How does memory fragmentation impact the performance of a linked list?', 'It improves performance', 'It degrades performance', 'It has no impact', 'It depends on the size of the list', 'It degrades performance', 'memorybased', 'hard'),
(20, 3, 'What is the role of the memory management system in a linked list?', 'To allocate memory for nodes', 'To deallocate memory for nodes', 'To manage memory leaks', 'All of the above', 'All of the above', 'memorybased', 'medium'),
(21, 3, 'In a singly linked list, how many pointers does each node typically contain?', 'one', 'two', 'three', 'four', 'one', 'memorybased', 'easy'),
(22, 3, 'When a node is deleted from a linked list, what happens to its memory?', 'It is immediately deallocated', 'It becomes inaccessible but remains in memory until garbage collected', 'It remains intact but with no references', 'It is marked for deletion by the operating system', 'It becomes inaccessible but remains in memory until garbage collected', 'understanding', 'medium'),
(23, 3, 'What is the impact of memory fragmentation on linked list operations?', 'It has no impact', 'It may slow down traversal and manipulation operations', 'It improves memory allocation efficiency', 'It reduces memory consumption', 'It may slow down traversal and manipulation operations', 'memorybased', 'hard'),
(24, 3, 'In a circular linked list, how is the end of the list identified?', 'By a null pointer', 'By a special marker indicating the end', 'By the last node pointing to the first node', 'By the last node pointing to null', 'By the last node pointing to the first node', 'memorybased', 'easy'),
(25, 3, 'What is the significance of the \"data\" field in a linked list node?', 'It points to the previous node', 'It contains the value of the node', 'It points to the next node', 'It serves as metadata for memory management', 'It contains the value of the node', 'memorybased', 'easy'),
(26, 3, 'When a new node is inserted into a linked list, how is memory allocated for it?', 'Memory is allocated statically', 'Memory is allocated on the heap using malloc or similar functions', 'Memory is allocated on the stack', 'Memory is allocated on the globally', 'Memory is allocated on the heap using malloc or similar functions', 'memorybased', 'medium'),
(27, 3, 'What is the purpose of a \"dummy\" node in some linked list implementations?', 'To store special metadata', 'To serve as a placeholder for insertion operations', 'To mark the end of the list', 'To improve memory management efficiency', 'To serve as a placeholder for insertion operations', 'memorybased', 'hard'),
(28, 3, 'How does memory management in a linked list differ from that in an array?', 'Linked lists require manual memory management', 'Arrays require manual memory management', 'Both use automatic memory management', 'Neither requires memory management', 'Linked lists require manual memory management', 'memorybased', 'easy'),
(29, 3, 'the number of comparisons needed to search a singly linked list of length n for a given element is_____', 'log(2*n)', 'n/2', 'log(2*n)-1', 'n', 'n', 'fillups', 'medium'),
(30, 3, 'Which of the following information is stored in a doubly-linked list?s nodes?', 'value of node', 'address of the nest node ', 'address of the previous node ', 'All of the above', 'All of the above', 'memorybased', 'easy'),
(31, 3, 'Which of the following are applications of linked lists?', 'implementing file systems', 'chaining in hash tables ', 'binary tree implementation', 'All of the above', 'All of the above', 'memorybased', 'medium'),
(32, 3, 'Insertion of an element at the middle of a linked list requires the modification of how many pointers?', '2', '1', '3', '4', '2', 'understanding', 'easy'),
(33, 3, 'Insertion of an element at the ends of a linked list requires the modification of how many pointers?', '2', '1', '3', '4', '1', 'understanding', 'easy'),
(34, 3, 'Which of the following algorithms is not feasible to implement in a linked list?', 'linear search', 'merge sort', 'insertion sort', 'binary search', 'binary search', 'memorybased', 'medium'),
(35, 3, 'Which of the following can be done with LinkedList?', 'Implementation of Stacks and Queues.', 'Implementation of Binary Trees.', 'Implementation of Data Structures that can simulate Dynamic Arrays.', 'All of the above.', 'All of the above.', 'memorybased', 'easy'),
(36, 3, 'A linked list node can be implemented using?', 'struct', 'class ', 'both a and b', 'none of the above', 'both a and b', 'memorybased', 'easy'),
(37, 3, 'Polynomial addition can be implemented using which of the following structure?', 'Linked List', 'Trees', 'Stacks', 'none of the above', 'trees', 'memorybased', 'medium'),
(38, 3, 'A linked list in which none of the nodes contains a NULL pointer is?', 'singly linked list', 'doubly linked list', 'circular linked list ', 'none of the above', 'circular linked list', 'memorybased', 'medium'),
(39, 3, 'Which of the following sorting algorithms can be applied to linked lists?', 'merge sort', 'Insertion sort', 'quick sort', 'all of the above', 'all of the above', 'memorybased', 'easy'),
(40, 3, 'The type of pointer used to point to the address of the next element in a linked list?', 'pointer to character', 'pointer to integer', 'pointer to node ', 'none of the above', 'pointer to node', 'understanding', 'hard'),
(41, 3, 'Which of the following is optimal to find an element at kth position at the linked list?', 'singly linked list', 'doubly linked list', 'circular linked list ', 'array implementation of linked list', 'array implementation of linked list', 'understanding', 'hard'),
(42, 3, '____is the time complexity of adding 2 numbers as a linked list?', 'O(max(n,m))', 'O(n+m)', 'O(min(n,m))', 'none of the above', 'O(max(n,m))', 'fillups', 'hard'),
(43, 3, 'Rotating a linked list by some places clockwise will take a time complexity of?', 'O(1)', 'O(n)1', 'O(n^2)', 'none of the above', 'O(n)', 'understanding', 'hard'),
(44, 3, 'In a circular linked list insertion of a record requires the modification of?', '1 pointer', '2 pointer', '3 pointer ', '4 pointer', '2 pointer', 'understanding', 'medium'),
(45, 3, 'Rotating a linked list by some places clockwise will take a space complexity of?', 'O(1)', 'O(n)', 'O(n^2)', 'none of the above', 'O(1)', 'understanding', 'hard'),
(46, 3, 'How can we destroy a linked  list pointer in C++?', 'delete keyword', 'free keyword', 'calloc', 'malloc', 'delete keyword', 'memorybased', 'easy'),
(47, 3, 'What is the space complexity for deleting a linked list?', 'O(1)', 'O(n)', 'O(n^2)', 'none of the above', 'O(1)', 'understanding', 'medium'),
(48, 3, 'Which of the following linked list operation takes O(1) time?', 'insert element at start of the linked list', 'insert element at the end of the linked list', 'find length of the linked list', 'none of the above', 'insert element at start of the linked list', 'memorybased', 'medium'),
(49, 3, 'Which algorithms can be used to sort a random linked list with minimum time complexity?', 'insertion sort', 'quick sort', 'heap sort', 'merge sort', 'merge sort', 'memorybased', 'hard'),
(50, 3, 'Pointer to a node Y in a singly linked list. A pointer to the head node is not given if one point is given. Can we delete node Y from the given linked list?', ' Yes, if Y is not the last node.', 'Yes, if the size of the linked list is even.', ' Yes, if the size of the linked list is odd.', ' Yes, if Y is not the first node.?', 'Yes, if Y is not the last node.', 'understanding', 'hard'),
(51, 3, 'Where you given pointers to the first and last nodes of a singly linked list, an Option that depends on the linked list\'s length?', 'Delete the first element.', ' Insert a new element as the first element.', 'Delete the last element.', 'Add element at the end of the list.', 'Delete the last element.', 'understanding', 'hard'),
(52, 3, 'In C++, how do you allocate memory for a new node in a linked list?', 'Using the new keyword', 'Using the malloc keyword', 'Using the delete keyword', 'Using the free() keyword', 'Using the new keyword', 'memorybased', 'easy'),
(53, 3, 'Which operation in a linked list requires traversal through the entire list?', 'Insertion at the beginning', 'Insertion at the end', 'Deletion at the beginning', 'Deletion at the end', 'Deletion at the end', 'understanding', 'medium'),
(54, 3, 'What is the purpose of the head pointer in a linked list?', 'To store the value of the first node', 'To store the value of the last node', 'To point to the previous node', 'To point to the first node', 'To point to the first node', 'memorybased', 'easy'),
(55, 3, 'Which of the following is an advantage of a doubly linked list over a singly linked list', 'Efficient memory usage', 'Ease of insertion at the beginning', 'Ability to traverse in both directions', 'Simplicity of implementation', 'Ability to traverse in both directions', 'memorybased', 'medium'),
(56, 3, 'What is a node in a linked list?', 'A data structure to store multiple values', 'A container to hold pointers', 'A data structure representing an element in the list', 'A reserved memory location', 'A data structure representing an element in the list', 'memorybased', 'easy'),
(57, 3, 'Which operation in a linked list can be performed in constant time (O(1))?', 'Insertion at the beginning', 'Insertion at the end', 'Deletion at the beginning', 'Deletion at the end', 'Insertion at the beginning', 'memorybased', 'hard'),
(58, 3, 'What happens if memory allocation fails during the creation of a new node in a linked list?', 'The program crashes', 'Null pointer is returned', 'Operating system reallocates memory', 'Garbage collector intervenes', 'Null pointer is returned', 'understanding', 'easy'),
(59, 3, 'How can you determine if a linked list contains a cycle in C++?', 'By using the std::find algorithm', 'By using a hash table to store visited nodes', 'By checking for duplicate elements', 'By using the Floyd\'s Tortoise and Hare algorithm', 'By using the Floyd\'s Tortoise and Hare algorithm', 'understanding', 'medium'),
(60, 3, 'What is the purpose of the tail pointer in a linked list?', 'To store the value of the last node', 'To point to the previous node', 'To store the length of the list', 'To point to the next node', 'To store the value of the last node', 'understanding', 'easy'),
(61, 3, 'How do you remove duplicates from an unsorted linked list in C++?', 'Using sorting algorithms like quicksort', 'Using the std::unique algorithm', 'By iterating through the list and using a hash table to track duplicate values', 'By comparing adjacent elements and removing duplicates', 'By iterating through the list and using a hash table to track duplicate values', 'understanding', 'medium'),
(62, 3, 'Which of the following operations on a singly linked list requires traversal from the head to the tail?', 'Insertion at the beginning', 'Insertion at the end', 'Deletion at the beginning', 'Deletion at the end', 'Insertion at the end', 'understanding', 'medium'),
(63, 3, 'How can you reverse a linked list in C++?', 'By using recursion', 'By using iteration', '. By swapping pointers', 'All of the above', 'All of the above', 'memorybased', 'easy'),
(64, 3, 'How does the size of a linked list affect the performance of operations in C++?', 'Larger size improves performance', 'Smaller size improves performance', 'Size has no significant impact on performance', 'It depends on the specific operation', 'It depends on the specific operation', 'understanding', 'medium'),
(65, 3, 'How can you detect and remove loops/cycles in a linked list efficiently in C++?', 'Using two pointers, one moving twice as fast as the other', 'Using recursion', 'Using a stack to track visited nodes', 'By sorting the list and removing duplicate values', 'Using two pointers, one moving twice as fast as the other', 'memorybased', 'medium'),
(66, 3, 'What is the significance of the XOR linked list in C++?', 'It uses bitwise XOR operation for pointer manipulation', 'It allows constant-time insertion and deletion at any position', 'It is a self-balancing binary search tree', 'It supports parallel processing', 'It uses bitwise XOR operation for pointer manipulation', 'memorybased', 'hard'),
(67, 3, 'What is the role of the dummy node in some linked list algorithms in C++?', 'To mark the end of the list', 'To serve as a placeholder for operations', 'To optimize memory allocation', 'To improve performance by reducing pointer manipulation', 'To serve as a placeholder for operations', 'understanding', 'medium'),
(68, 3, 'How do you implement an efficient linked list that supports constant-time insertion, deletion, and search operations in C++?', 'By using a self-balancing binary search tree', 'By using a hash table', 'By using a skip list', 'By using a doubly linked list with additional indexing', 'By using a skip list', 'understanding', 'hard'),
(69, 3, 'What is the significance of the Flyweight pattern in linked list implementations in C++?', 'It reduces memory consumption by sharing common parts of state among multiple objects', 'It optimizes memory allocation for nodes', 'It ensures consistency in concurrent access to the list', 'It improves performance by using multithreading', 'It reduces memory consumption by sharing common parts of state among multiple objects', 'memorybased', 'hard'),
(70, 3, 'How can you efficiently detect and remove duplicates from a sorted linked list in C++?', 'By using a hash table to track visited nodes', 'By using a doubly linked list', 'By comparing adjacent elements and removing duplicates', 'By sorting the list and then removing duplicate values', 'By comparing adjacent elements and removing duplicates', 'understanding', 'medium'),
(71, 3, 'Which of the following is not a type of linked list?', 'Singly linked list', 'doubly linked list', 'circular linked list ', 'quad linked list', 'quad linked list', 'memorybased', 'easy'),
(72, 3, 'In a singly linked list, each node contains a reference/pointer to______', 'Both the previous and next nodes', 'Only the next node', 'Only the previous node', 'none of the above', 'Only the next node', 'fillups', 'easy'),
(73, 3, '____ operation can be performed efficiently in a singly linked list?', 'Finding the middle element', 'Removing the last element', 'Reversing the list', 'Searching for an element by index', 'Finding the middle element', 'fillups', 'medium'),
(74, 3, 'What is a disadvantage of using a singly linked list compared to an array?', 'Dynamic memory allocation', 'Contiguous memory allocation', 'Random access to elements', 'Insertion and deletion at arbitrary positions', 'Random access to elements', 'memorybased', 'medium'),
(75, 3, '______ of the following operations cannot be performed efficiently in a singly linked list?', 'Insertion at the end of the list', 'Deletion of a node with a given value', 'Finding the maximum element', 'Concatenating two lists', 'Finding the maximum element', 'fillups', 'medium'),
(76, 3, 'In C++, when dynamically allocating memory for a new node in a linked list, which operator is used?', '*', '->\'', '&', '::', '*', 'example', 'easy'),
(77, 3, 'After dynamically allocating memory for a new node in a linked list, what should be done to deallocate the memory when the node is no longer needed?', 'Use the delete keyword', 'Use the free function', 'The memory is automatically deallocated', 'Use the remove keyword', 'Use the delete keyword', 'memorybased', 'medium'),
(78, 3, 'When inserting a new node at the beginning of a linked list, what operation is performed to adjust the pointers/references?', 'Updating the next pointer of the new node', 'Updating the next pointer of the previous first node', 'Updating the next pointer of the last node', 'none of the above', 'Updating the next pointer of the new node', 'understanding', 'easy'),
(79, 3, 'In a circular linked list, how are the pointers/references of the last node adjusted to make the list circular?', 'Pointing to nullptr', 'Pointing to the first node', 'Pointing to the previous node', 'none of the above', 'Pointing to the first node', 'understanding', 'hard'),
(80, 3, 'In a doubly linked list, each node contains pointers/references to both the previous and next nodes. What advantage does this provide over a singly linked list?', 'Constant-time access to elements', 'Reduced memory usage', 'Faster insertion and deletion at arbitrary positions', 'Ability to traverse the list in both directions', 'Ability to traverse the list in both directions', 'memorybased', 'medium'),
(81, 3, 'Which of the following statements about circular linked lists is true?', 'Circular linked lists cannot contain loops', 'Circular linked lists do not have a beginning or end', 'Circular linked lists have a fixed size', 'Circular linked lists have no advantage over linear linked lists', 'Circular linked lists do not have a beginning or end', 'memorybased', 'medium'),
(82, 3, 'In a singly linked list, if a node has a pointer/reference to another node that is earlier in the list, what is this node called?', 'Forward node', 'Next node', 'Previous node', 'Backward node', 'previous node', 'memorybased', 'medium'),
(83, 3, 'Which of the following operations is not typically supported by a linked list?', 'Insertion at the beginning', 'Insertion at the end', 'Deletion of the middle element in constant time', 'Traversal from the end to the beginning', 'Deletion of the middle element in constant time', 'memorybased', 'easy'),
(84, 3, 'In a circular linked list, what is the condition to terminate a traversal?', 'When the current node is nullptr', 'When the current node\'s pointer/reference matches the head node\'s pointer/reference', 'When the current node\'s pointer/reference matches the tail node\'s pointer/reference', 'When the current node\'s pointer/reference is nullptr', 'When the current node\'s pointer/reference matches the head node\'s pointer/reference', 'understanding', 'easy'),
(85, 3, 'Which operation in a linked list requires traversing the entire list?', 'Insertion at the beginning', 'Insertion at the end', 'Deletion of a specific node', 'Accessing the last element', 'Deletion of a specific node', 'understanding', 'easy'),
(86, 3, 'What is the significance of the nullptr value in linked lists?', 'It represents the end of the list', 'It represents the beginning of the list', 'It indicates a memory leak', 'It denotes an empty list', 'It represents the end of the list', 'understanding', 'easy'),
(87, 3, 'How can memory leaks occur in a linked list?', 'By allocating memory using malloc instead of new', 'By not deallocating memory for unused nodes', 'By not initializing the head pointer', 'By using a stack-based memory allocation', 'By not deallocating memory for unused nodes', 'understanding', 'easy'),
(88, 3, 'How does the time complexity of inserting an element at the end of a linked list compare to that of inserting an element at the beginning?', 'Insertion at the end is faster', 'Insertion at the beginning is faster', 'Both operations have the same time complexity', 'Time complexity depends on the size of the list', 'Insertion at the end is faster', 'understanding', 'easy'),
(89, 3, '_____ is the role of the tail pointer in a linked list?', 'It points to the last node in the list', 'It points to the first node in the list', 'It indicates the size of the list', 'It is used for bidirectional traversal', 'It points to the last node in the list', 'fillups', 'easy'),
(90, 3, 'Why might a circular linked list be preferred over a linear linked list in certain applications?', 'It allows bidirectional traversal', 'It provides constant-time access to elements', 'It prevents memory fragmentation', 'It simplifies certain algorithms like round-robin scheduling', 'It simplifies certain algorithms like round-robin scheduling', 'understanding', 'easy'),
(91, 3, 'Assume that reference of head of following doubly linked list is passed to above function 1 <--> 2 <--> 3 <--> 4 <--> 5 <-->6. What should be the modified linked list after the function call?', '2 <--> 1 <--> 4 <--> 3 <--> 6 <-->5', '5 <--> 4 <--> 3 <--> 2 <--> 1 <-->6', '6 <--> 5 <--> 4 <--> 3 <--> 2 <--> 1', ' \n6 <--> 5 <--> 4 <--> 3 <--> 1 <--> 2', '6 <--> 5 <--> 4 <--> 3 <--> 2 <--> 1', 'example', 'easy'),
(92, 3, 'What is the output of following function in which start is pointing to the first node of the following linked list 1->2->3->4->5->6 ?', '1 4 6 6 4 1', '1 3 5 1 3 5', '1 2 3 5', '1 3 5 5 3 1', '1 3 5 5 3 1', 'example', 'easy'),
(93, 3, 'Suppose each set is represented as a linked list with elements in arbitrary order. Which of the operations among union, intersection, membership, cardinality will be the slowest?', 'union?', '?membership', 'cardinality', '?union, intersection', '?union, intersection', 'understanding', 'easy'),
(94, 3, 'Which of the following is an application of XOR-linked lists?', 'implementing stacks', 'implementing queues', 'memory-efficient linked list representation', 'Caching data structures', 'memory-efficient linked list representation', 'understanding', 'easy'),
(95, 3, 'Given pointer to a node X in a singly linked list. Only one pointer is given, pointer to head node is not given, can we delete the node X from given linked list?', 'Possible if X is not last node. Use following two steps (a) Copy the data of next of X to X. (b)Update the pointer of node X to the node after the next node. Delete next of X', 'Possible if X is not first node. Use following two steps (a) Copy the data of next of X to X. (b) Delete next of X.', 'Possible if size of linked list is odd', 'Possible if size of linked list is even.', 'Possible if X is not last node. Use following two steps (a) Copy the data of next of X to X. (b)Update the pointer of node X to the node after the next node. Delete next of X', 'understanding', 'easy'),
(96, 3, 'Is it possible to create a doubly linked list using only one pointer with every node.', 'not possible', 'yes,possible by storing XOR of addresses of previous and next nodes', 'Yes, possible by storing XOR of current node and next node', 'Yes, possible by storing XOR of current node and previous node', 'yes,possible by storing XOR of addresses of previous and next nodes', 'understanding', 'easy'),
(97, 3, 'The concatenation of two lists is to be performed in O(1) time. Which of the following implementations of a list should be used?', 'singly linked list', 'doubly linked list', 'circular doubly linked list', 'array implementation of linked list', 'circular doubly linklist', 'understanding', 'easy'),
(98, 3, 'In a doubly linked list, the number of pointers affected for an insertion operation will be', '5', '0', '1', 'none of the above', 'none of the above', 'understanding', 'easy'),
(99, 3, 'Consider an implementation of unsorted single linked list. Suppose it has its representation with a head and a tail pointer (i.e. pointers to the first and last nodes of the linked list). Given the representation, which of the following operation can not be implemented in O(1) time ?', 'Insertion at the front of the linked list', 'Insertion at the end of the linked list', 'Deletion of the front node of the linked list', 'Deletion of the last node of the linked list.', 'Deletion of the last node of the linked list.', 'understanding', 'easy'),
(100, 3, 'Consider a single linked list where F and L are pointers to the first and last elements respectively of the linked list. The time for performing which of the given operations depends on the length of the linked list?F->1->2->3->L', 'Delete the first element of the list', 'Interchange the first two elements of the list', 'Delete the last element of the list', 'Add an element at the end of the list', 'Delete the last element of the list', 'understanding', 'easy'),
(101, 3, 'Which of the following operations is performed more efficiently by doubly linked list than by linear linked list?', 'Deleting a node whose location is given', 'Searching an unsorted list for a given item', 'Inserting a node after the node with a given location', 'Traversing the list to process each node', 'Deleting a node whose location is given', 'understanding', 'easy'),
(102, 3, 'Which of the following operations cannot be performed efficiently on a singly linked list without using additional data structures?', 'Reversing the list', 'Finding the middle element', 'Detecting a cycle', 'Merging two sorted lists', 'Reversing the list', 'understanding', 'easy'),
(103, 3, 'What is the space complexity of a doubly linked list?', 'O(n)', 'O(2n)', 'O(1)', 'O(n^2)', 'O(n)', 'understanding', 'easy'),
(104, 3, 'Which of the following is NOT a possible implementation of a linked list?', 'Using arrays', 'Using static memory allocation', 'Using recursion', 'Using dynamic memory allocation', 'Using arrays', 'understanding', 'easy'),
(105, 3, 'In a sorted doubly linked list, which operation has the highest time complexity?', 'Insertion at the beginning', 'Searching for an element', 'Insertion at the end', 'Deletion of a given element', 'Searching for an element', 'understanding', 'easy'),
(106, 3, 'Which of the following statements is true about a self-adjusting linked list?', 'It automatically adjusts its size based on the number of elements.', 'It rearranges elements to optimize access patterns.', 'It has a fixed number of nodes.', ' It eliminates the need for pointers.', 'It rearranges elements to optimize access patterns.', 'understanding', 'easy'),
(107, 3, 'Which of the following techniques can be used to detect a cycle in a linked list?', 'Floyd?s Cycle Detection Algorithm', 'Depth-First Search (DFS)', 'Breadth-First Search (BFS)', 'All of the above', 'All of the above', 'memorybased', 'easy'),
(108, 3, 'Which of the following statements is true about a sentinel node in a linked list?', 'It contains data like other nodes.', 'It is always the last node in the list', 'It helps in detecting memory leaks.', 'It does not store data and is used as a placeholder.', 'It does not store data and is used as a placeholder.', 'understanding', 'easy'),
(109, 3, 'In a circular linked list, how can you find the length of the list without traversing it?', 'Counting the number of nodes until a NULL pointer is encountered', 'Using a global variable to store the length', 'Storing the length in the first node', 'Maintaining a separate counter variable updated during ', 'Storing the length in the first node', 'understanding', 'easy'),
(110, 3, 'Consider the following Node struct definition for a singly linked list:struct Node {\n    int data;\n    Node* next;\n};', 'Node* newNode = new Node; newnode->data=10;', 'node *newnode=new node(); newnode->data=10 newnode->next=NULL;', 'Node newNode; newnode.data=10; newnode.next=NULL', 'Node* newnode = new Node(); newnode->data=10;newnode->next=NULL;', 'Node* newnode = new Node(); newnode->data=10;newnode->next=NULL;', 'example', 'easy'),
(111, 3, 'In a singly linked list, each node contains ________ and a pointer to the ________ node.', 'data; next', 'pointers; next', 'pointers; previous', 'data; previous', 'data; next', 'fillups', 'easy'),
(112, 3, 'In a doubly linked list, each node contains pointers to both ________ and ________ nodes.', 'previous; next', 'backward; forward', 'front; back', 'next; previous', 'previous; next', 'fillups', 'easy'),
(113, 3, 'The operation of removing the first node from a linked list is called ________.', 'insertion at the beginning', 'deletion at the beginning', 'insertion at the end', 'deletion at the end', 'deletion at the beginning', 'fillups', 'easy'),
(114, 3, 'A circular linked list is a linked list in which the ________ of the last node points back to the ________ node.', 'previous pointer; first', 'next pointer; last', 'next pointer; first', 'previous pointer; last', 'next pointer; first', 'fillups', 'easy'),
(115, 3, 'In a singly linked list, the time complexity of searching for an element is ________', 'O(1)', 'O(n)', 'O(log n)', 'O(n^2)', 'O(n)', 'fillups', 'easy'),
(116, 3, 'A ________ allows traversal in both forward and backward directions.', 'singly linked list', 'doubly linked list', 'circular linked list', 'dynamic ', 'doubly linked list', 'fillups', 'easy'),
(117, 3, 'A ________ linked list is a variation of a linked list where each node contains the XOR of addresses of the ________ and ________ nodes.', 'doubly; previous; next', 'singly; previous; next', 'XOR; previous; next', 'doubly; next; previous', 'XOR; previous; next', 'fillups', 'easy'),
(118, 3, 'A ________ node in a linked list does not contain any data and is used as a placeholder.', 'sentinel', 'placeholder', 'dummy', 'null', 'sentinel', 'fillups', 'easy'),
(119, 3, 'In a circular linked list, the length of the list can be found by storing the length in the ________ node.', 'first', 'last', 'sentinel', 'current', 'first', 'fillups', 'easy'),
(120, 3, 'The time complexity of inserting a node at the end of a singly linked list is ________.', 'O(1)', 'O(n)', 'O(log n)', 'O(n^2)', 'O(n)', 'fillups', 'easy'),
(121, 3, 'The operation of adding a new node at the end of a linked list is called ________.', 'inserting at the beginning', 'deletion at the beginning', 'insertion at the end', 'deletion at the end', 'insertion at the end', 'fillups', 'easy'),
(122, 3, 'The process of reversing a linked list involves changing the ________ pointers of each node.', 'next', 'previous', 'both the next and the previous', 'data; previous', 'next pointer; first', 'fillups', 'easy'),
(123, 3, 'A ________ linked list is a type of linked list where the last node points to the first node.', 'Circular ', 'doubly linked list', 'singly', 'linear', 'circular', 'fillups', 'easy'),
(124, 3, 'In a circular doubly linked list, the ________ of the first node points to the last node.', ' previous pointer', 'next pointer', 'both previous and next pointers', 'data', ' previous pointer', 'fillups', 'easy'),
(125, 3, 'The process of inserting a new node between two existing nodes in a linked list is called ________.', 'split', 'splice', 'merge', 'concatenate', 'splice', 'fillups', 'easy'),
(126, 3, 'The time complexity of deleting a node from the middle of a singly linked list is ________.', 'O(1)', 'O(n)', 'O(log n)', 'O(n^2)', 'O(n)', 'fillups', 'easy'),
(127, 3, 'In a doubly linked list, the process of removing the first node involves updating the ________ pointer of the second node.', 'next', 'previous', 'both next and previous', 'data', 'previous', 'fillups', 'easy'),
(128, 3, 'A ________ node in a linked list is a special node used to mark the end of the list.', 'sentinel', 'placeholder', 'dummy', 'terminator', 'sentinel', 'fillups', 'easy'),
(129, 3, '________ is not the following application of linked list', 'to implement files', 'for seperate chaining in hash tables', 'Random access of elements', 'more than one of the above', 'Random access of elements', 'fillups', 'easy'),
(130, 3, 'A linear collection of data elements where the linear node is given by means of pointer is called______', '?Linked list', '?Node list', 'Primitive list', 'Unordered list', '?Linked list', 'fillups', 'easy'),
(131, 3, 'The concatenation of two lists can be performed in O(1) time. Which of the following variation of the linked list can be used_______', 'singly linked list', 'Circular doubly linked list', 'doubly linked list', 'Array implementation of list', 'Circular doubly linked list', 'fillups', 'easy'),
(132, 3, '______ c code is used to create new node?', 'ptr = (NODE*)malloc(sizeof(NODE));', '?ptr = (NODE*)malloc(NODE);', 'ptr = (NODE*)malloc(sizeof(NODE*));', '?ptr = (NODE)malloc(sizeof(NODE));', 'ptr = (NODE*)malloc(sizeof(NODE));', 'fillups', 'easy'),
(133, 3, '________ differentiates a circular linked list from a normal linked list?', 'You cannot have the ?next? pointer point to null in a circular linked list', '?It is faster to traverse the circular linked list', '?In a circular linked list, each node points to the previous node instead of the next nod', 'Head node is known in circular linked list', 'You cannot have the ?next? pointer point to null in a circular linked list', 'fillups', 'easy'),
(134, 3, '_____ application makes use of a circular linked list?', '?Undo operation in a text editor', 'Recursive function calls', 'Allocating CPU to resources', 'Implement Hash Tables', 'Allocating CPU to resources', 'fillups', 'easy'),
(135, 3, 'The process of removing a specific node from a linked list involves updating the ________ pointers of adjacent nodes.', 'adjacent', 'neighboring', 'preceding', 'succeeding', 'preceding', 'fillups', 'easy'),
(136, 3, 'In a circular linked list, the length of the list can be found by storing the length in the ________ node.', 'primary', 'central', 'sentinel', 'anchor', 'sentinel', 'fillups', 'easy'),
(137, 3, 'The process of removing the first node from a linked list is called ________.', 'deletion at the front', 'deletion at the back', 'insertion at the front', 'insertion at the back', 'deletion at the front', 'fillups', 'easy'),
(138, 3, 'What will be the output of the following C++ code snippet?#include <iostream>\n\nstruct Node {\n    int data;\n    Node* next;\n};\n\nint main() {\n    Node* head = nullptr;\n    head = new Node;\n    head->data = 10;\n    head->next = nullptr;\n    std::cout << head->data << std::endl;\n    return 0;\n}', '10', 'garbage value', 'compliation error', 'segmentation fault', '10', 'example', 'easy'),
(139, 3, 'What does the following C++ code snippet do?Node* reverseList(Node* head) {\n    Node *prev = nullptr, *curr = head, *next = nullptr;\n    while (curr != nullptr) {\n        next = curr->next;\n        curr->next = prev;\n        prev = curr;\n        curr = next;\n    }\n    return prev;\n}', 'Reverses a singly linked list', 'Inserts a node at the end of a linked list', 'Deletes the last node of a linked list', 'Reverses a doubly linked list', 'Reverses a singly linked list', 'example', 'easy'),
(140, 3, 'What will be the output of the following C++ code snippet?#include <iostream>\n\nstruct Node {\n    int data;\n    Node* next;\n};\n\nvoid printList(Node* head) {\n    while (head != nullptr) {\n        std::cout << head->data << \" \";\n        head = head->next;\n    }\n    std::cout << std::endl;\n}\n\nint main() {\n    Node* head = nullptr;\n    head = new Node;\n    head->data = 10;\n    head->next = nullptr;\n    Node* second = new Node;\n    second->data = 20;\n    second->next = nullptr;\n    head->next = second;\n    printList(head);\n    return 0;\n}\n', '10', '20', '10 20', 'compilation error', '10 20', 'example', 'easy'),
(141, 3, 'What does the following C++ code snippet do?void deleteList(Node* head) {\n    Node* temp;\n    while (head != nullptr) {\n        temp = head;\n        head = head->next;\n        delete temp;\n    }\n}', 'Deletes the first node of the linked lis', 'Deletes the last node of the linked list', 'Deletes the entire linked list', 'Deletes the second node of the linked list', 'Deletes the entire linked list', 'example', 'easy'),
(142, 3, 'Node* findMiddle(Node* head) { Node *slow = head, *fast = head; while (fast != nullptr && fast->next != nullptr) { slow = slow->next; fast = fast->next->next; } return slow; }', 'Finds the middle element of a singly linked list', 'Finds the middle element of a doubly linked list', 'Finds the last element of a singly linked list', 'Finds the first element of a singly linked list', 'Finds the middle element of a singly linked list', 'example', 'easy'),
(143, 3, 'What does the following C++ code snippet do?bool detectLoop(Node* head) {\n    Node *slow = head, *fast = head;\n    while (fast != nullptr && fast->next != nullptr) {\n        slow = slow->next;\n        fast = fast->next->next;\n        if (slow == fast) {\n            return true;\n        }\n    }\n    return false;\n}', 'Detects whether there is a loop in the linked lis', 'Deletes the loop in the linked list', 'Reverses the linked list', 'Finds the middle element of the linked list', 'Detects whether there is a loop in the linked lis', 'example', 'easy'),
(144, 3, 'Node* findNthNodeFromEnd(Node* head, int n) { Node *fast = head, *slow = head; for (int i = 0; i < n; ++i) { if (fast == nullptr) return nullptr; fast = fast->next; } while (fast != nullptr) { slow = slow->next; fast = fast->next; } return slow; }', 'Finds the nth node from the beginning of the linked list', 'Finds the nth node from the end of the linked list', 'Deletes the nth node from the end of the linked list', 'Deletes the nth node from the beginning of the linked list', 'Finds the nth node from the end of the linked list', 'example', 'easy'),
(145, 3, 'What will be the output of the following C++ code snippet?#include <iostream>\n\nstruct Node {\n    int data;\n    Node* next;\n};\n\nvoid printList(Node* head) {\n    while (head != nullptr) {\n        std::cout << head->data << \" \";\n        head = head->next;\n    }\n    std::cout << std::endl;\n}\n\nvoid deleteList(Node* head) {\n    if (head == nullptr) return;\n    deleteList(head->next);\n    delete head;\n}\n\nint main() {\n    Node* head = new Node;\n    head->data = 10;\n    head->next = nullptr;\n    Node* second = new Node;\n    second->data = 20;\n    second->next = nullptr;\n    head->next = second;\n    deleteList(head);\n    printList(head);\n    return 0;\n}', '10 20', 'garbage value', 'empty output', 'segmentation fault', 'segmentation fault', 'example', 'easy'),
(146, 3, 'What does the following C++ code snippet do?Node* mergeLists(Node* list1, Node* list2) {\n    if (list1 == nullptr) return list2;\n    if (list2 == nullptr) return list1;\n    if (list1->data < list2->data) {\n        list1->next = mergeLists(list1->next, list2);\n        return list1;\n    } else {\n        list2->next = mergeLists(list1, list2->next);\n        return list2;\n    }\n}\n', 'Merges two singly linked lists into one', 'Reverses the elements of two singly linked lists', 'Splits a singly linked list into two lists', 'Deletes the common elements from two singly linked lists', 'Merges two singly linked lists into one', 'example', 'easy'),
(147, 3, 'What does the following C++ code snippet do?Node* findIntersection(Node* list1, Node* list2) {\n    Node* head = nullptr;\n    Node* tail = nullptr;\n    while (list1 != nullptr && list2 != nullptr) {\n        if (list1->data == list2->data) {\n            if (head == nullptr) {\n                head = tail = new Node;\n                head->data = list1->data;\n            } else {\n                tail->next = new Node;\n                tail = tail->next;\n                tail->data = list1->data;\n            }\n            list1 = list1->next;\n            list2 = list2->next;\n        } else if (list1->data < list2->data) {\n            list1 = list1->next;\n        } else {\n            list2 = list2->next;\n        }\n    }\n    return head;\n}\n', 'Finds the common elements between two linked lists', 'Reverses the elements of two linked lists', 'Deletes the elements that are common between two linked lists', 'Merges two linked lists into one', 'Finds the common elements between two linked lists', 'example', 'easy'),
(148, 3, 'What will be the output of the following C++ code snippet?#include <iostream>\n\nstruct Node {\n    int data;\n    Node* next;\n};\n\nNode* deleteAlternateNodes(Node* head) {\n    Node* current = head;\n    while (current != nullptr && current->next != nullptr) {\n        Node* temp = current->next;\n        current->next = temp->next;\n        delete temp;\n        current = current->next;\n    }\n    return head;\n}\n\nvoid printList(Node* head) {\n    while (head != nullptr) {\n        std::cout << head->data << \" \";\n        head = head->next;\n    }\n    std::cout << std::endl;\n}\n\nint main() {\n    Node* head = new Node;\n    head->data = 10;\n    head->next = new Node;\n    head->next->data = 20;\n    head->next->next = new Node;\n    head->next->next->data = 30;\n    head->next->next->next = nullptr;\n    head = deleteAlternateNodes(head);\n    printList(head);\n    return 0;\n}\n', '10 30', '20', '10 20 30', 'complilation error', '10 20 30', 'example', 'easy'),
(149, 3, 'What does the following C++ code snippet do?Node* reverseKGroup(Node* head, int k) {\n    Node* current = head;\n    Node* next = nullptr;\n    Node* prev = nullptr;\n    int count = 0;\n\n    while (current != nullptr && count < k) {\n        next = current->next;\n        current->next = prev;\n        prev = current;\n        current = next;\n        count++;\n    }\n\n    if (next != nullptr) {\n        head->next = reverseKGroup(next, k);\n    }\n\n    return prev;\n}\n', 'Reverses every K nodes in a linked list', 'Deletes every K nodes in a linked list', 'Inserts every K nodes in a linked li', 'Reverses the entire linked list', 'Reverses every K nodes in a linked list', 'example', 'easy'),
(150, 3, 'What does the following C++ code snippet do?Node* deleteDuplicates(Node* head) {\n    Node* current = head;\n    while (current != nullptr && current->next != nullptr) {\n        if (current->data == current->next->data) {\n            Node* temp = current->next;\n            current->next = current->next->next;\n            delete temp;\n        } else {\n            current = current->next;\n        }\n    }\n    return head;\n}\n', 'Deletes all nodes with duplicate values in the linked list', 'Deletes the last occurrence of each value in the linked list', 'Deletes the first occurrence of each value in the linked list', 'Deletes all nodes except the first occurrence of each value in the linked list', 'Deletes all nodes with duplicate values in the linked list', 'example', 'easy');

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `result_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `total_marks` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `result`
--

INSERT INTO `result` (`result_id`, `user_id`, `exam_id`, `total_marks`) VALUES
(1, 1, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `subject_id` int(11) NOT NULL,
  `subject_name` varchar(25) NOT NULL,
  `course_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`subject_id`, `subject_name`, `course_id`) VALUES
(1, 'oocp', 1),
(2, 'dbms', 1),
(3, 'ml', 2),
(4, 'soad', 1);

-- --------------------------------------------------------

--
-- Table structure for table `topic`
--

CREATE TABLE `topic` (
  `topic_id` int(11) NOT NULL,
  `topic_name` varchar(25) NOT NULL,
  `subject_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `topic`
--

INSERT INTO `topic` (`topic_id`, `topic_name`, `subject_id`) VALUES
(1, 'array', 1),
(2, 'inheritance', 1),
(3, 'linked list', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `mobileno` text NOT NULL,
  `email` varchar(45) NOT NULL,
  `user_category` enum('admin','student','faculty') NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` longtext NOT NULL,
  `passkey` varchar(20) NOT NULL,
  `passkeyval` varchar(30) NOT NULL,
  `status` enum('approved','pending') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `course_id`, `name`, `mobileno`, `email`, `user_category`, `username`, `password`, `passkey`, `passkeyval`, `status`) VALUES
(1, 1, 'Parin Dhavalbhai Makwana', '8320960851', 'parin@gmail.com', 'student', 'parin_210', '$2y$10$3gjiBxz9oZ.fdpA61zoYY.QME5hJV7WV/BCPugrTTvKDOnb2ZlynC', 'favbook', 'dbms', 'approved'),
(2, 1, 'Maitry Jhaveri', '9624355944', 'maitry@gmail.com', 'admin', 'admin', '$2y$10$xmV/H1EABHoEoloAaFeatORR/S.iafJEq3Zq.jnHDAkJWPyyMsf/m', 'favbook', 'c++', 'approved'),
(3, 1, 'Maitry Jhaveri', '9714966068', 'maitry@gmail.com', 'faculty', 'maitry_jhaveri', '$2y$10$ZRSZYdj69rrbX7fI5hQ50eN8TpQKABF3qCqbQ1Dch.MarSzkNM/r.', 'favbook', 'c++', 'approved'),
(4, 1, 'Lamin Janka', '8320960851', 'lamin@gmail.com', 'student', 'lamin_16', '$2y$10$i4f9py6iHVwv8X0iANWbweO.GR3R7mOkLGZ6gbfxbmqz3X54Mq/uS', 'favmovie', 'fight club', 'approved'),
(5, 1, 'Ishika Thakkar', '8401698751', 'ishika@gmail.com', 'student', 'ishika_111', '$2y$10$sTvNAuBfMSvCBlakF5wKZegrysjvFpYnV87TGJ6cJhu4ma3aZs6qW', 'favbook', 'twisted love', 'approved'),
(6, 1, 'Juhi Modi', '9227455897', 'juhirollwala@gmail.com', 'student', 'juhi_20', '$2y$10$6p/RkgsX1M.U/d.o5rL39ea/dDZSfZ5s24a9.Ic2/DoU2fUFe6A6u', 'favteacher', 'maitry maam', 'approved'),
(7, 2, 'Manav Ghiya', '6353844120', 'manav@email.com', 'student', 'manav_123', '$2y$10$Jq14ZhjFbN3dwdSvzLpfReziin1iNiulesheHWpUVrXoiGzPGvsw6', 'favteacher', 'monali maam', 'approved'),
(8, 2, 'Purav Shah', '9874522844', 'purav@gmail.com', 'student', 'purav_239', '$2y$10$gCipjbtNKTw1UZQdBqdluemDBKHXMDiIrzgkvXJul7f9UfwPHD5dS', 'favmovie', 'welcome', 'approved'),
(9, 2, 'Eric', '9173745154', 'eric@rollwala.com', 'faculty', 'eric@aiml', '$2y$10$gHpe/FQ5AWjosKBZYhuj/.yUgr8.ng/Oh5rHGTtrJrQvCRPnPU4aW', 'favmovie', 'fast &amp; furious', 'approved'),
(10, 3, 'Rohan Mehta', '8745965810', 'rohanmehta@gmail.com', 'student', 'rohan_mehta_123', '$2y$10$Gc4bFCaAMhr3Yo32eXTgXuOJaC7lO89ypeAPVt3E0Eos4FDMn18Ye', 'favbook', 'memories', 'pending'),
(11, 3, 'Jhanvi Thakkar', '8714966060', 'jhanvithakkar@gmail.com', 'faculty', 'jhanvi@m3hta', '$2y$10$Ur66o64/WXKGbYw/gpFtX.lbtYsu4ME1Mz3HiOOY2/0jWoq9x9ECG', 'favteacher', 'diksha maam', 'pending'),
(12, 1, 'Kajol', '9221477854', 'kajol@yahoo.com', 'student', 'kajol@123', '$2y$10$5FzNJmOG6EY4khJtF7wQ6.DrRt3IjDkOCPovAVSIEdLfvBnS5CpPe', 'favmovie', '3 idiots', 'pending'),
(13, 1, 'ashit', '8747454578', 'ashit@gmail.com', 'student', 'ashit_123', '$2y$10$SrXmOq8RJN0ZvzPPHML6RueyDyrOy3QqMZJhCV7qB44V.Ya7C4iEW', 'favteacher', 'c', 'approved');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `exam`
--
ALTER TABLE `exam`
  ADD PRIMARY KEY (`exam_id`),
  ADD KEY `exam_user_id` (`user_id`),
  ADD KEY `exam_course_id` (`course_id`),
  ADD KEY `exam_subject_id` (`subject_id`),
  ADD KEY `exam_topic_id` (`topic_id`);

--
-- Indexes for table `exam_question`
--
ALTER TABLE `exam_question`
  ADD PRIMARY KEY (`exam_mcq_id`),
  ADD KEY `exam_id` (`exam_id`),
  ADD KEY `mcq_id` (`mcq_id`);

--
-- Indexes for table `mcq`
--
ALTER TABLE `mcq`
  ADD PRIMARY KEY (`mcq_id`),
  ADD KEY `topic_id` (`topic_id`);

--
-- Indexes for table `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`result_id`),
  ADD KEY `result_user_id` (`user_id`),
  ADD KEY `result_exam_id` (`exam_id`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`subject_id`),
  ADD KEY `subject_course_id` (`course_id`);

--
-- Indexes for table `topic`
--
ALTER TABLE `topic`
  ADD PRIMARY KEY (`topic_id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `course_id` (`course_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `exam`
--
ALTER TABLE `exam`
  MODIFY `exam_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exam_question`
--
ALTER TABLE `exam_question`
  MODIFY `exam_mcq_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `mcq`
--
ALTER TABLE `mcq`
  MODIFY `mcq_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT for table `result`
--
ALTER TABLE `result`
  MODIFY `result_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `topic`
--
ALTER TABLE `topic`
  MODIFY `topic_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `exam`
--
ALTER TABLE `exam`
  ADD CONSTRAINT `exam_course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `exam_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `exam_topic_id` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`topic_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `exam_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `exam_question`
--
ALTER TABLE `exam_question`
  ADD CONSTRAINT `exam_id` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`exam_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mcq_id` FOREIGN KEY (`mcq_id`) REFERENCES `mcq` (`mcq_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mcq`
--
ALTER TABLE `mcq`
  ADD CONSTRAINT `topic_id` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`topic_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `result`
--
ALTER TABLE `result`
  ADD CONSTRAINT `result_exam_id` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`exam_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `result_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `subject`
--
ALTER TABLE `subject`
  ADD CONSTRAINT `subject_course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `topic`
--
ALTER TABLE `topic`
  ADD CONSTRAINT `topic_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `courseid` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
