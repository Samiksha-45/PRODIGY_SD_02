<!-- index.jsp -->
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Guess the Number Game</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
      background-color: #f4f4f4;
    }
    .form-container {
      background-color: #ffffff;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
      text-align: center;
      width: 300px;
    }
    h2 {
      margin: 0 0 20px;
      color: #333;
    }
    label, input, button, p {
      display: block;
      width: 100%;
      margin-bottom: 10px;
    }
    input[type="number"] {
      padding: 8px;
      font-size: 16px;
      border: 1px solid #ccc;
      border-radius: 4px;
      width: calc(100% - 20px);
      margin: 0 auto;
    }
    button {
      padding: 10px;
      background-color: pink;
      color: black;
      font-size: 16px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }
    button:hover {
      background-color: lightgreen;
    }
    .result {
      font-size: 1rem;
      color: #333;
    }
  </style>
</head>
<body>

  <div class="form-container">
    <h2>Guess the Number Game</h2>
    <form action="GuessNumberGame" method="post">
      <label for="numberInput">Enter a Number (1-100):</label>
      <input type="number" id="numberInput" name="numberInput" required min="1" max="100"><br>
      <button type="submit">Submit</button>
    </form>

    <!-- Display the result message here -->
    <p class="result">
      <strong>Result:</strong> 
      <%= request.getAttribute("result") != null ? request.getAttribute("result") : "Make your first guess!" %>
    </p>
  </div>

</body>
</html>
