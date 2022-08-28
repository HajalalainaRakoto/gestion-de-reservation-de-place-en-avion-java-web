package com.example.Controlleur.Reservation;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.Modele.ModeleAvion;
import com.example.Modele.ModelePlace;
import com.example.Modele.ModeleReservation;

public class Form extends HttpServlet {

    private ModeleReservation modeleReservation = new ModeleReservation();
    private ModeleAvion modeleAvion = new ModeleAvion();
    private ModelePlace modelePlace = new ModelePlace();
    private String id;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idModifier = req.getParameter("id_modifier");
        this.id = idModifier;
        String idSupprimer = req.getParameter("id_supprimer");
        String idPlace = req.getParameter("id_place");
        String ido = req.getParameter("ido");
        try {
            String[] allIdAvion = modeleAvion.getAllID();
            req.setAttribute("allIdAvion", allIdAvion);
            if (ido != null) {
                String[] allIdPlace = modelePlace.getAllId(ido);
                req.setAttribute("allIdPlace", allIdPlace);
            } else {
                String[] allIdPlace = modelePlace.getIdFalse(false);
                req.setAttribute("allIdPlace", allIdPlace);
            }
        } catch (SQLException e1) {
            e1.printStackTrace();
        }
        if (idModifier != null) {
            try {
                if (ido != null) {
                    String[] allIdPlace = modelePlace.getAllId(ido);
                    req.setAttribute("allIdPlace", allIdPlace);
                } else {
                    String[] allIdPlace = modelePlace.getIdFalse(true);
                    req.setAttribute("allIdPlace", allIdPlace);
                }
                String[][] value = modeleReservation.getValue(idModifier);
                req.setAttribute("nAvion", value[0][1]);
                req.setAttribute("nPlace", value[0][2]);
                req.setAttribute("dateReservation", value[0][3]);
                req.setAttribute("nomVoyageur", value[0][4]);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            this.getServletContext().getRequestDispatcher("/Vue/Reservation/formulaire.jsp").forward(req, resp);
        }
        if(idModifier == null && idSupprimer == null && idPlace == null) {
            this.getServletContext().getRequestDispatcher("/Vue/Reservation/formulaire.jsp").forward(req, resp);
        }
        if (idSupprimer != null && idPlace != null) {
            try {
                modeleReservation.Supprimer(idSupprimer, idPlace);
                this.getServletContext().getRequestDispatcher("/reservation").forward(req, resp);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nAvion = req.getParameter("nAvion");
        String nPlace = req.getParameter("nPlace");
        String dateReservation = req.getParameter("dateReservation");
        String nomVoyageur = req.getParameter("nomVoyageur");
        try {
            if (this.id == null) {
                modeleReservation.Ajout(nAvion, nPlace, dateReservation, nomVoyageur);
            } else {
                modeleReservation.Update(nAvion, nPlace, dateReservation, nomVoyageur, this.id);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        this.getServletContext().getRequestDispatcher("/reservation").forward(req, resp);
    }

}
