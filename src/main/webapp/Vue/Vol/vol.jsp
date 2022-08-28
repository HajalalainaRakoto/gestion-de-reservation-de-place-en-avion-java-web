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

        <title>Liste vol</title>
    </head>
    <body>
        <%-- <table>
            <tr>
                <th>Numéro vol</th>
                <th>Ville de départ</th>
                <th>Ville d'arrivée</th>
                <th>Frais</th>
                <th> <button><a href="/demo/ajouter/vol">Ajouter</a></button> </th>
            </tr>
            <%
                String[][] data = (String[][]) request.getAttribute("data");
                for(int i= 0; i < data.length;i++){
                out.println("<tr>");
                out.println("<td>"+data[i][0]+"</td>");
                out.println("<td>"+data[i][1]+"</td>");
                out.println("<td>"+data[i][2]+"</td>");
                out.println("<td>"+data[i][3]+"</td>");
                out.println("<td> <a href='/demo/modifier/vol?id_modifier="+data[i][0]+"'>Modifier</a> <a href='/demo/supprimer/vol?id_supprimer="+data[i][0]+"'>Supprimer</a> </td>");
                out.println("</tr>");
            } %>
        </table>
        <a href="/demo">Accueil</a> --%>
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
                    <img src="<%=request.getContextPath()%>/Image/bgVol.png" class="card-img-top bg-info" alt="..." style="height: 300px;">
                    <div class="card-header">
                        <h3 class="text-center text-warning">Liste des vols disponible</h3>
                    </div>
                    <div class="card-body table-responsive">
                        <table class="table table-bordered text-center">
                            <thead>
                                <tr>
                                    <th scope="col">Numéro vol</th>
                                    <th scope="col">Ville de départ</th>
                                    <th scope="col">Ville d'arrivée</th>
                                    <th scope="col">Frais</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    String[][] data = (String[][]) request.getAttribute("data");
                                    for(int i= 0; i < data.length;i++){
                                        out.println("<tr>");
                                        out.println("<td>"+data[i][0]+"</td>");
                                        out.println("<td>"+data[i][1]+"</td>");
                                        out.println("<td>"+data[i][2]+"</td>");
                                        out.println("<td>"+data[i][3]+"</td>");
                                        out.println("<td scope='row'>");
                                        out.println("<div class='dropdown'>");
                                        out.println("<i class='fa fa-ellipsis-v' type='button' id='dropdownMenu2' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'></i>");
                                        out.println("<div class='dropdown-menu' aria-labelledby='dropdownMenu2'>");
                                        out.println("<a href='/demo/modifier/vol?id_modifier="+data[i][0]+"' class='dropdown-item' type='button'>Edit</a>");
                                        out.println("<a href='/demo/supprimer/vol?id_supprimer="+data[i][0]+"' class='dropdown-item' type='button'>Delete</a>");
                                        out.println("</div>");
                                        out.println("</div>");
                                        out.println("</td>");
                                        out.println("</tr>");
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                    <div class="card-footer">
                        <ul class="pagination justify-content-end mt-3">
                            <li class="page-item mr-2">
                                <a class="page-link text-white bg-primary" href="/demo/ajouter/vol">
                                    <i class="fa fa-plus"></i>
                                    <span class="nav-link-text">Ajouter</span>
                                </a>
                            </li>
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
    </body>
</html>