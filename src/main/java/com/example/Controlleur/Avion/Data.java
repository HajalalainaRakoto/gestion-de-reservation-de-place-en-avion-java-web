package com.example.Controlleur.Avion;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.Modele.ModeleAvion;
import com.example.Modele.ModeleReservation;

public class Data extends HttpServlet {

    private ModeleAvion modeleAvion = new ModeleAvion();
    private ModeleReservation modeleReservation = new ModeleReservation();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String[] allAnnee = modeleReservation.getYear();
            req.setAttribute("allAnnee", allAnnee);
            String[][] data = modeleAvion.getData();
            req.setAttribute("data", data);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        this.getServletContext().getRequestDispatcher("/Vue/Avion/avion.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }

}
