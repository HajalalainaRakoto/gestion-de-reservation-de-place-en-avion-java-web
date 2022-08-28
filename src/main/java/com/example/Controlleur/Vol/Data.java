package com.example.Controlleur.Vol;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.Modele.ModeleVol;

public class Data extends HttpServlet {

    private ModeleVol modeleVol = new ModeleVol();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String[][] data = modeleVol.getData();
            req.setAttribute("data", data);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        this.getServletContext().getRequestDispatcher("/Vue/Vol/vol.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }

}
