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

        <title>Formulaire avion</title>
    </head>
    <body>
        <%-- <form method="post" action="${empty param.id_modifier ? '/demo/ajouter/avion' : '/demo/modifier/avion'}">
            <fieldset>
                <label for="NVol">Numéro de vol</label>
                <select name="nVol" id="NVol">
                    <%
                        String[] allIdVol = (String[]) request.getAttribute("allIdVol");
                        for(int i= 0; i < allIdVol.length; i++){
                            String isSelected = (allIdVol[i].equals((String) request.getAttribute("nVol")))? "selected" : "";
                            out.println("<option value='"+allIdVol[i]+"'"+ isSelected+">"+allIdVol[i]+"</option>");
                        }
                    %>
                </select>
                <br />

                <label for="confirmation">Nombre de place</label>
                <input type="number" id="confirmation" name="nbPlaces"
                    value="${!empty param.id_modifier ? nbPlaces : ''}" />
                <br />

                <label for="nom">Design</label>
                <input type="text" id="nom" name="design" value="${!empty param.id_modifier ? design : ''}" />
                <br />

                <input type="submit" />
                <br />
            </fieldset>
        </form>
        <a href="/demo/avion">information</a> --%>

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
              <h3>${empty param.id_modifier ? 'Ajouter' : 'Modifier'} avion</h3>
            </div>
            <div class="card-body">

        <form method="post" action="${empty param.id_modifier ? '/demo/ajouter/avion' : '/demo/modifier/avion'}">
            <div class="form-group">
                <label for="NVol">Numéro de vol</label>
                <select name="nVol" id="NVol" class="form-control">
                    <%
                        String[] allIdVol = (String[]) request.getAttribute("allIdVol");
                        for(int i= 0; i < allIdVol.length; i++){
                            String isSelected = (allIdVol[i].equals((String) request.getAttribute("nVol")))? "selected" : "";
                            out.println("<option value='"+allIdVol[i]+"'"+ isSelected+">"+allIdVol[i]+"</option>");
                        }
                    %>
                </select>
            </div>

            <div class="form-group">
                <label for="confirmation">Nombre de place</label>
                <input class="form-control" type="number" id="confirmation" name="nbPlaces" value="${!empty param.id_modifier ? nbPlaces : ''}" />
            </div>

            <div class="form-group">
                <label for="nom">Design</label>
                <input class="form-control" type="text" id="nom" name="design" value="${!empty param.id_modifier ? design : ''}" />
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

<script src="<%=request.getContextPath()%>/Js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/Js/popper.min.js"></script>
<script src="<%=request.getContextPath()%>/Js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/Js/app.js"></script>
    </body>
</html>