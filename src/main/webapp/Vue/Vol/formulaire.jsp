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

        <title>Formulaire vol</title>
    </head>
    <body>
        <%-- <form method="post" action="${empty param.id_modifier ? '/demo/ajouter/vol' : '/demo/modifier/vol'}">
            <fieldset>
                <label for="motdepasse">Ville de départ</label>
                <input type="text" id="motdepasse" name="villeDepart" value="${!empty param.id_modifier ? villeDepart : ''}"/>
                <br />

                <label for="confirmation">Ville d'arrivée</label>
                <input type="text" id="confirmation" name="villeArrivee"
                    value="${!empty param.id_modifier ? villeArrivee : ''}" />
                <br />

                <label for="nom">Frais</label>
                <input type="number" id="nom" name="frais" value="${!empty param.id_modifier ? frais : ''}" />
                <br />

                <input type="submit" />
                <br />
            </fieldset>
        </form> --%>
        <%-- <a href="/demo/vol">information</a> --%>
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
              <h3>${empty param.id_modifier ? 'Ajouter' : 'Modifier'} vol</h3>
            </div>
            <div class="card-body">

        <form method="post" action="${empty param.id_modifier ? '/demo/ajouter/vol' : '/demo/modifier/vol'}">
            <div class="form-group">
                <label for="motdepasse">Ville de départ</label>
                <input class="form-control" type="text" id="motdepasse" name="villeDepart" value="${!empty param.id_modifier ? villeDepart : ''}"/>
            </div>

            <div class="form-group">
                <label for="confirmation">Ville d'arrivée</label>
                <input class="form-control" type="text" id="confirmation" name="villeArrivee" value="${!empty param.id_modifier ? villeArrivee : ''}" />
            </div>

            <div class="form-group">
                <label for="nom">Frais</label>
                <input class="form-control" type="number" id="nom" name="frais" value="${!empty param.id_modifier ? frais : ''}" />
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