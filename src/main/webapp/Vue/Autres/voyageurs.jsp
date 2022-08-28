<%@ page isELIgnored="false" %>
<%@ page pageEncoding="UTF-8" %>
<html>
    <head>
        <link rel="shortcut icon" type="image/ico" href="<%=request.getContextPath()%>/Image/logo.png">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/Css/bootstrap.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/Css/style.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/Css/Chart.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/Fontawesome/css/all.min.css">
        <script src="<%=request.getContextPath()%>/Js/Chart.min.js"></script>

        <title>Visualisation des voyageurs</title>
    </head>
    <body>


<div class="sidebar">
            <!-- Nav items -->
            <div class="nav-item title text-center mt-2">
                <a class="nav-link active" href="/demo">
                    <img src="<%=request.getContextPath()%>/Image/logo.png" height="120px"/>
                    <span class="nav-link-text"><br>SUJET 8</span>
                </a>
            </div>
            <ul class="navbar-nav ml-3">
                <div class="dropdown-divider"></div>
                <li class="nav-item rounded-pill m-3">
                    <a class="nav-link btn btn-info" role="button" data-toggle="modal" data-target="#exampleModal1">Avion</a>
                </li>
                <li class="nav-item rounded-pill m-3">
                    <a class="nav-link btn btn-info" role="button" data-toggle="modal" data-target="#exampleModal2">Vol</a>
                </li>
                <li class="nav-item rounded-pill m-3">
                    <a class="nav-link btn btn-info" role="button" data-toggle="modal" data-target="#exampleModal3">Réservation</a>
                </li>
            </ul>
        </div>

        <div class="content">
            <div class="top-menu">
                <nav class="navbar navbar-expand">
                    <ul class="navbar-nav mr-auto nav-top">
                        <li class="nav-item toggler active">
                            <span class="nav-link">
                                <i class="fas fas fa-bars" style="color: rgb(252, 174, 7)"></i>
                            </span>
                        </li>
                    </ul>
                </nav>
            </div>

            <section>
                <!-- Modal avion -->
                <div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">AVION</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                Informations sur les avions
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
                                <a type="button" href="/demo/ajouter/avion" class="btn btn-success">Nouveau</a>
                                <a type="button" href="/demo/avion" class="btn btn-primary">Liste</a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal vol -->
                <div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">VOL</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                Informations sur les vols
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
                                <a type="button" href="/demo/ajouter/vol" class="btn btn-success">Nouveau</a>
                                <a type="button" href="/demo/vol" class="btn btn-primary">Liste</a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal reservation -->
                <div class="modal fade" id="exampleModal3" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">RESERVATION</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                Informations sur les réservations
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
                                <a type="button" href="/demo/ajouter/reservation" class="btn btn-success">Nouveau</a>
                                <a type="button" href="/demo/reservation" class="btn btn-primary">Liste</a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Contenue -->
                <div class="card avion shadow-sm p-3 mb-5 rounded">
                    <img src="<%=request.getContextPath()%>/Image/tourist.jpg" class="card-img-top bg-info" alt="..." style="height: 300px;">
                    <div class="card-header">
                        <h3 class="text-center text-warning">Liste des voyageurs disponible</h3>
                    </div>
                    <div class="card-body table-responsive">
                        <table class="table table-bordered text-center">
                            <thead>
                                <tr>
                                    <th scope="col">Nom du voyageur</th>
                                    <th scope="col">Numéro de place</th>
                                    <th scope="col">Numéro de vol</th>
                                    <th scope="col">Date de réservation</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    String nbAvionDisponible = (String) request.getAttribute("nbAvionDisponible");
                                    String nbAvionOccupe = (String) request.getAttribute("nbAvionOccupe");
                                    String[][] visualisation = (String[][]) request.getAttribute("visualisation");
                                    if(visualisation != null && (nbAvionDisponible != null || nbAvionOccupe != null)) {
                                        for(int i= 0; i < visualisation.length;i++){
                                            out.println("<tr>");
                                            out.println("<td>"+visualisation[i][0]+"</td>");
                                            out.println("<td>"+visualisation[i][1]+"</td>");
                                            out.println("<td>"+visualisation[i][2]+"</td>");
                                            out.println("<td>"+visualisation[i][3]+"</td>");
                                            out.println("</tr>");
                                        }
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                    <div class="card-footer">
                        <ul class="list-group list-group-horizontal row">
                            <div class="col">
                                <li class="list-group-item border-0">Nombre place disponible : <strong>${ nbAvionDisponible }</strong></li>
                                <li class="list-group-item border-0">Nombre place occupé : <strong>${ nbAvionOccupe }</strong></li>
                            </div>
                            <div class="col">
                                <%
                                    String[][] recetteAnneeMois = (String[][]) request.getAttribute("recetteAnneeMois");
                                    if(recetteAnneeMois != null) {
                                        for(int i= 0; i < recetteAnneeMois.length;i++){
                                            out.println("<li class='list-group-item border-0'>"+recetteAnneeMois[i][0]+" : "+recetteAnneeMois[i][1]+"</li>");
                                        }
                                    }
                                %>
                            </div>
                        </ul>
                    </div>
                </div>

            </section>

            <footer>
                <p class="mx-auto text-center mt-4">Copyright &copy; 2021-
                    <script>document.write(new Date().getFullYear())</script>
                    all rights reserved | made by <a href="http://www.facebook.com/">DarkNK</a></p>
            </footer>
        </div>

        <script src="<%=request.getContextPath()%>/Js/jquery.min.js"></script>
        <script src="<%=request.getContextPath()%>/Js/popper.min.js"></script>
        <script src="<%=request.getContextPath()%>/Js/bootstrap.min.js"></script>
        <script src="<%=request.getContextPath()%>/Js/app.js"></script>


        <%-- <div>
            <%
                String nbAvionDisponible = (String) request.getAttribute("nbAvionDisponible");
                String nbAvionOccupe = (String) request.getAttribute("nbAvionOccupe");
                String[][] visualisation = (String[][]) request.getAttribute("visualisation");
                if(visualisation != null && (nbAvionDisponible != null || nbAvionOccupe != null)) {
                    out.println("<strong>Nombre place disponible : "+nbAvionDisponible+"  </strong>");
                    out.println("<strong>  Nombre place occupé : "+nbAvionOccupe+"</strong>");
                    for(int i= 0; i < visualisation.length; i++){
                        out.println("<div>Nom du voyageur : ");
                        out.println("<strong>"+visualisation[i][0]+"</strong>");
                        out.println("</div>");

                        out.println("<div>Numéro de place : ");
                        out.println("<strong>"+visualisation[i][1]+"</strong>");
                        out.println("</div>");

                        out.println("<div>Numéro de vol : ");
                        out.println("<strong>"+visualisation[i][2]+"</strong>");
                        out.println("</div>");

                        out.println("<div>Date de réservation : ");
                        out.println("<strong>"+visualisation[i][3]+"</strong>");
                        out.println("</div>");
                    }
                }
            %>
        </div>
        <a href="/demo">Accueil</a> --%>
    </body>
</html>