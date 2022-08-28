package com.example.Controlleur.Vol;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.Modele.ModeleVol;

public class Form extends HttpServlet{

    private ModeleVol modeleVol = new ModeleVol();
    private String id;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idModifier = req.getParameter("id_modifier");
        this.id = idModifier;
        String idSupprimer = req.getParameter("id_supprimer");
        if (idModifier != null) {
            try {
                String[][] value = modeleVol.getValue(idModifier);
                req.setAttribute("villeDepart", value[0][1]);
                req.setAttribute("villeArrivee", value[0][2]);
                req.setAttribute("frais", value[0][3]);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            this.getServletContext().getRequestDispatcher("/Vue/Vol/formulaire.jsp").forward(req, resp);
        }
        if(idModifier == null && idSupprimer == null) {
            this.getServletContext().getRequestDispatcher("/Vue/Vol/formulaire.jsp").forward(req, resp);
        }
        if(idSupprimer != null){
            try {
                modeleVol.Supprimer(idSupprimer);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            this.getServletContext().getRequestDispatcher("/vol").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String villeDepart = req.getParameter("villeDepart");
        String villeArrivee = req.getParameter("villeArrivee");
        String frais = req.getParameter("frais");
        try {
            if (this.id == null) {
                modeleVol.Ajout(villeDepart, villeArrivee, frais);
            } else {
                modeleVol.Update(villeDepart, villeArrivee, frais, this.id);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        this.getServletContext().getRequestDispatcher("/vol").forward(req, resp);
    }

}
