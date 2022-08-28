<%@ page isELIgnored="false" %>
<%@ page pageEncoding="UTF-8" %>
<html>
    <head>
        <link rel="shortcut icon" type="image/ico" href="<%=request.getContextPath()%>/Image/logo.png">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/Css/bootstrap.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/Css/new.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/Fontawesome/css/all.min.css">
        <script src="<%=request.getContextPath()%>/Js/Chart.min.js"></script>
        <title>Accueil</title>
    </head>
    <body>
        <%-- <a href="/demo/vol">Vol</a>
        <a href="/demo/avion">Avion</a>
        <a href="/demo/reservation">Réservation</a>
        <a href="/demo/voyageurs">Visualisation des voyageurs</a>
        <a href="/demo/recette">Calcul recette</a>
        <a href="/demo/chart">Chart</a> --%>


        <nav class="navbar navbar-expand-lg navbar-light bg-transparent">
            <div class="nav-item title text-center mt-2">
                <a class="nav-link title active" href="/demo">
                    <img src="<%=request.getContextPath()%>/Image/logo.png" height="120px"/>
                    <h5 class="nav-link-text">SUJET 8</h5>
                </a>
            </div>
            <div class="collapse navbar-collapse container justify-content-center" id="navbarNav">
              <ul class="nav">
                <!-- Modal Avion-->
                  <li class="nav-item rounded-pill m-3">
                      <a class="nav-link btn btn-info" role="button" data-toggle="modal" data-target="#exampleModal1">Avion</a>
                      <div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                          <div class="modal-content">
                            <div class="modal-header text-center">
                              <h5 class="modal-title" id="exampleModalLabel">AVION</h5>
                              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                              </button>
                            </div>
                            <div class="modal-body text-center">
                              Informations sur les avions
                            </div>
                            <div class="modal-footer">
                              <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
                              <a class="btn btn-primary" href="/demo/ajouter/avion" role="button">Nouveau</a>
                              <a class="btn btn-warning" href="/demo/avion" role="button">Liste</a>
                            </div>
                          </div>
                        </div>
                      </div>
                  </li>

                  <!-- Modal Vol-->
                  <li class="nav-item rounded-pill m-3">
                      <a class="nav-link btn btn-info" role="button" data-toggle="modal" data-target="#exampleModal2">Vol</a>
                      <div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                          <div class="modal-content">
                            <div class="modal-header text-center">
                              <h5 class="modal-title" id="exampleModalLabel">VOL</h5>
                              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                              </button>
                            </div>
                            <div class="modal-body text-center">
                              Informations sur les vols
                            </div>
                            <div class="modal-footer">
                              <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
                              <a class="btn btn-primary" href="/demo/ajouter/vol" role="button">Nouveau</a>
                              <a class="btn btn-warning" href="/demo/vol" role="button">Liste</a>
                            </div>
                          </div>
                        </div>
                      </div>
                  </li>

                  <!-- Modal Réservation-->
                  <li class="nav-item rounded-pill m-3">
                      <a class="nav-link btn btn-info" role="button" data-toggle="modal" data-target="#exampleModal3">Réservation</a>
                      <div class="modal fade" id="exampleModal3" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title" id="exampleModalLabel">RESERVATION</h5>
                              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                              </button>
                            </div>
                            <div class="modal-body text-center">
                              Informations sur les réservations
                            </div>
                            <div class="modal-footer">
                              <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
                              <a class="btn btn-primary" href="/demo/ajouter/reservation" role="button">Nouveau</a>
                              <a class="btn btn-warning" href="/demo/reservation" role="button">Liste</a>
                            </div>
                          </div>
                        </div>
                      </div>
                  </li>
              </ul>
            </div>

            <%-- <!-- form search-->
            <form class="form my-2 my-lg-0">
                <input class="form-control mr-sm-1 bg-transparent" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-warning my-2 my-sm-0" type="submit">Search</button>
            </form> --%>
        </nav>

        <section class="mt-3">
            <!-- Message -->
            <div class="container text-center text-info">
                <h1>Bienvenue</h1>
                <h5>sur l'application web JAVA <br> </h5><h4>RESERVATION DE PLACE EN AVION</h4>
            </div>

            <div class="card text-center bg-transparent mt-5">
                <div class="text-success">
                    <h3 class="Aides">Aides d'utilisation</h3>
                </div>
                <!-- Défilement card body -->
                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active bg-warning"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="1" class="bg-warning"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="2" class="bg-warning"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <div class="mt-3 mb-3 d-block">
                                <div class="card-body">
                                    <h5 class="card-title">Avion</h5>
                                    <h6 class="card-text">
                                        Pour voir les options possibles pour <span>Avion</span> <br/>
                                        cliquer sur avion et choisir une option <br/>
                                    </h6>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="mt-3 mb-3 d-block">
                                <div class="card-body">
                                    <h5 class="card-title">Vol</h5>
                                    <h6 class="card-text">
                                        Pour voir les options possibles pour <span>vol</span> <br/>
                                        cliquer sur vol et choisir une option <br/>
                                    </h6>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="mt-3 mb-3 d-block">
                                <div class="card-body">
                                    <h5 class="card-title">Réservation</h5>
                                    <h6 class="card-text">
                                        Pour voir les options possibles pour <span>réservation</span> <br/>
                                        cliquer sur réservation et choisir une option <br/>
                                    </h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>



        </section>

        <footer>
                <p class="mx-auto text-center text-white mt-5">Copyright &copy; 2021-
                    <script>document.write(new Date().getFullYear())</script>
                    all rights reserved | made by <a class="" href="http://www.facebook.com/">DarkNK</a></p>
        </footer>

        <script src="<%=request.getContextPath()%>/Js/jquery.min.js"></script>
        <script src="<%=request.getContextPath()%>/Js/popper.min.js"></script>
        <script src="<%=request.getContextPath()%>/Js/bootstrap.min.js"></script>
        <script src="<%=request.getContextPath()%>/Js/app.js"></script>
    </body>
</html>
