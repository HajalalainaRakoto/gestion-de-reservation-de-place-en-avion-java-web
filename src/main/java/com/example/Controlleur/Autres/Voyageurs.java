package com.example.Controlleur.Autres;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.Modele.Modele;
import com.example.Modele.ModelePlace;

public class Voyageurs extends HttpServlet {

    private ModelePlace modelePlace = new ModelePlace();
    private Modele modele = new Modele();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nAvion = req.getParameter("nAvion");
        req.setAttribute("nAvion", nAvion);
        try {
            String[][] visualisation = modele.getAllData(nAvion);
            req.setAttribute("visualisation", visualisation);
            String[][] recetteAnneeMois = modele.recetteAnneeMois(nAvion);
            req.setAttribute("recetteAnneeMois", recetteAnneeMois);
            String nbAvionDisponible = modelePlace.NombrePlace(nAvion, false);
            req.setAttribute("nbAvionDisponible", nbAvionDisponible);
            String nbAvionOccupe = modelePlace.NombrePlace(nAvion, true);
            req.setAttribute("nbAvionOccupe", nbAvionOccupe);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        this.getServletContext().getRequestDispatcher("/Vue/Autres/voyageurs.jsp").forward(req, resp);
    }

    // @Override
    // protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    //     String nAvion = req.getParameter("nAvion");
    //     req.setAttribute("nAvion", nAvion);
    //     String[] allIdAvion;
    //     try {
    //         String[][] visualisation = modele.getAllData(nAvion);
    //         req.setAttribute("visualisation", visualisation);
    //         allIdAvion = modeleAvion.getAllID();
    //         req.setAttribute("allIdAvion", allIdAvion);
    //         String nbAvionDisponible = modelePlace.NombrePlace(nAvion, false);
    //         req.setAttribute("nbAvionDisponible", nbAvionDisponible);
    //         String nbAvionOccupe = modelePlace.NombrePlace(nAvion, true);
    //         req.setAttribute("nbAvionOccupe", nbAvionOccupe);
    //     } catch (SQLException e) {
    //         e.printStackTrace();
    //     }
    //     this.getServletContext().getRequestDispatcher("/Vue/Autres/voyageurs.jsp").forward(req, resp);
    // }

}
