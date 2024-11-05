package com.ty;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/GuessNumberGame")
public class GuessNumberGame extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        // Retrieve or initialize the target random number
        Integer randomNumber = (Integer) session.getAttribute("randomNumber");
        if (randomNumber == null) {
            randomNumber = (int) (Math.random() * 100) + 1; // Random number between 1 and 100
            session.setAttribute("randomNumber", randomNumber);
        }

        // Retrieve or initialize the attempt count
        Integer attempts = (Integer) session.getAttribute("attempts");
        if (attempts == null) {
            attempts = 0;
        }
        attempts++;
        session.setAttribute("attempts", attempts);

        // Get the user's guess from the form input
        String userInput = request.getParameter("numberInput");
        int userGuess = Integer.parseInt(userInput);

        // Compare the guess with the random number
        String message;
        if (userGuess < randomNumber) {
            message = "Too low! Try again.";
        } else if (userGuess > randomNumber) {
            message = "Too high! Try again.";
        } else {
            message = "Congratulations! You guessed the correct number: " + randomNumber +
                      " in " + attempts + " attempts!";
            session.removeAttribute("randomNumber"); // Reset for a new game
            session.removeAttribute("attempts");
        }

        // Set the message and attempts as request attributes and forward to the JSP
        request.setAttribute("result", message);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
