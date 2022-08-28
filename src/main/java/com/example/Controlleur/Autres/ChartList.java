package com.example.Controlleur.Autres;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.SQLException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.Modele.Modele;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtils;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.labels.StandardPieSectionLabelGenerator;
import org.jfree.chart.plot.PiePlot;
import org.jfree.data.general.DefaultPieDataset;

public class ChartList extends HttpServlet {

    private Modele modele = new Modele();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String annee = request.getParameter("annee");
        response.setContentType("image/png");

        OutputStream os = response.getOutputStream();

        JFreeChart chart = getChart(annee);
        int width = 500;
        int height = 350;

        ChartUtils.writeChartAsPNG(os, chart, width, height);
    }

    public JFreeChart getChart(String annee) {
        String[][] data;
        try {
            DefaultPieDataset dataset = new DefaultPieDataset();
            data = modele.rechercheAnnee(annee);
            for (int i = 0; i < data.length; i++) {
                int k = Integer.valueOf(data[i][1]).intValue();
                String l = "Avion numéro " + data[i][0];
                dataset.setValue(l, k);
            }
            String title = "Recette " + annee;

            JFreeChart chart = ChartFactory.createPieChart(title, dataset, true, true, true);
            PiePlot config = (PiePlot) chart.getPlot();
            config.setLabelGenerator(new StandardPieSectionLabelGenerator("{0} : {1}"));

            chart.setBorderVisible(false);
            return chart;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

}
