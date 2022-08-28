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

        <title>Formulaire réservation</title>
    </head>
    <body>
        <div class="sidebar bgSidebar1">
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

    <section class="abstractblue">
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

        <div class="card text-center bg-transparent col-6 mx-auto shadow-sm p-5 rounded">
            <div class="card-header text-success">
              <h3>${empty param.id_modifier ? 'Ajouter' : 'Modifier'} réservation</h3>
            </div>
            <div class="card-body">

        <form method="post" action="${empty param.id_modifier ? '/demo/ajouter/reservation' : '/demo/modifier/reservation'}">
            <div class="form-group">
                <label for="NAvion">Numéro Avion</label>
                <select class="form-control" name="nAvion" id="NAvion" onchange="${empty param.id_modifier ? 'change()' : 'changeModifier()'}">
                    <option value=""></option>
                    <%
                        String[] allIdAvion = (String[]) request.getAttribute("allIdAvion");
                        for(int i= 0; i < allIdAvion.length; i++){
                            String isSelected = null;
                            if(request.getParameter("ido") != null){
                                isSelected = (allIdAvion[i].equals((String) request.getParameter("ido")))? "selected" : "";
                            } else {
                                isSelected = (allIdAvion[i].equals((String) request.getAttribute("nAvion")))? "selected" : "";
                            }
                            out.println("<option value='"+allIdAvion[i]+"'"+ isSelected+">"+allIdAvion[i]+"</option>");
                        }
                    %>
                </select>
            </div>

            <div class="form-group">
                <label for="NPlace">Numéro de place</label>
                <select class="form-control" name="nPlace" id="NPlace">
                    <%
                        String[] allIdPlace = (String[]) request.getAttribute("allIdPlace");
                        for(int i= 0; i < allIdPlace.length; i++){
                            String isSelected = (allIdPlace[i].equals((String) request.getAttribute("nPlace")))? "selected" : "";
                            out.println("<option value='"+allIdPlace[i]+"'"+ isSelected+">"+allIdPlace[i]+"</option>");
                        }
                    %>
                </select>
            </div>

            <div class="form-group">
                <label for="confirmation">Date de réservation</label>
                <input class="form-control" type="date" id="confirmation" name="dateReservation" value="${!empty param.id_modifier ? dateReservation : ''}" />
            </div>

            <div class="form-group">
                <label for="nom">Nom du voyageur</label>
                <input class="form-control" type="text" id="nom" name="nomVoyageur" value="${!empty param.id_modifier ? nomVoyageur : ''}" />
            </div>

            </div>
            <div class="card-footer">
                <button class="btn btn-primary" type="submit">${empty param.id_modifier ? 'Ajouter' : 'Modifier'}</button>
            </div>
        </form>

        </div>

    </section>

    <footer>
        <p class="mx-auto text-center mt-4">Copyright &copy; 2021-
            <script>document.write(new Date().getFullYear())</script>
            all rights reserved | made by <a href="http://www.facebook.com/">DarkNK</a></p>
    </footer>
</div>

<script src="<%=request.getContextPath()%>/Js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/Js/popper.min.js"></script>
<script src="<%=request.getContextPath()%>/Js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/Js/app.js"></script>
<script src="<%=request.getContextPath()%>/Js/change.js"></script>
        <%-- <form method="post" action="${empty param.id_modifier ? '/demo/ajouter/reservation' : '/demo/modifier/reservation'}">
            <fieldset>
                <label for="NAvion">Numéro Avion</label>
                <select name="nAvion" id="NAvion">
                    <%
                        String[] allIdAvion = (String[]) request.getAttribute("allIdAvion");
                        for(int i= 0; i < allIdAvion.length; i++){
                            String isSelected = (allIdAvion[i].equals((String) request.getAttribute("nAvion")))? "selected" : "";
                            out.println("<option value='"+allIdAvion[i]+"'"+ isSelected+">"+allIdAvion[i]+"</option>");
                        }
                    %>
                </select>
                <br />

                <label for="NPlace">Numéro de place</label>
                <select name="nPlace" id="NPlace">
                    <%
                        String[] allIdPlace = (String[]) request.getAttribute("allIdPlace");
                        for(int i= 0; i < allIdPlace.length; i++){
                            String isSelected = (allIdPlace[i].equals((String) request.getAttribute("nPlace")))? "selected" : "";
                            out.println("<option value='"+allIdPlace[i]+"'"+ isSelected+">"+allIdPlace[i]+"</option>");
                        }
                    %>
                </select>
                <br />

                <label for="confirmation">Date de réservation</label>
                <input type="date" id="confirmation" name="dateReservation" value="${!empty param.id_modifier ? dateReservation : ''}" />
                <br />

                <label for="nom">Nom du voyageur</label>
                <input type="text" id="nom" name="nomVoyageur" value="${!empty param.id_modifier ? nomVoyageur : ''}" />
                <br />

                <input type="submit" />
                <br />
            </fieldset>
        </form>
        <a href="/demo/reservation">information</a> --%>
    </body>
</html>