package com.example.Controlleur.Avion;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.Modele.ModeleAvion;
import com.example.Modele.ModeleVol;

public class Form extends HttpServlet{

    private ModeleAvion modeleAvion = new ModeleAvion();
    private ModeleVol modeleVol= new ModeleVol();
    private String id;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idModifier = req.getParameter("id_modifier");
        this.id = idModifier;
        String idSupprimer = req.getParameter("id_supprimer");
        String idVol = req.getParameter("id_vol");
        try {
            String[] allIdVol = modeleVol.getAllID();
            req.setAttribute("allIdVol", allIdVol);
        } catch (SQLException e1) {
            e1.printStackTrace();
        }
        if (idModifier != null) {
            try {
                String[][] value = modeleAvion.getValue(idModifier);
                req.setAttribute("nVol", value[0][1]);
                req.setAttribute("nbPlaces", value[0][2]);
                req.setAttribute("design", value[0][3]);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            this.getServletContext().getRequestDispatcher("/Vue/Avion/formulaire.jsp").forward(req, resp);
        }
        if(idModifier == null && idSupprimer == null && idVol == null) {
            this.getServletContext().getRequestDispatcher("/Vue/Avion/formulaire.jsp").forward(req, resp);
        }
        if(idSupprimer != null && idVol != null){
            try {
                modeleAvion.Supprimer(idSupprimer, idVol);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            this.getServletContext().getRequestDispatcher("/avion").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nVol = req.getParameter("nVol");
        String nbPlaces = req.getParameter("nbPlaces");
        String design = req.getParameter("design");
        try {
            if (this.id == null) {
                modeleAvion.Ajout(design, nbPlaces, nVol);
            } else {
                modeleAvion.Update(design, nbPlaces, nVol, this.id);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        this.getServletContext().getRequestDispatcher("/avion").forward(req, resp);
    }

}

