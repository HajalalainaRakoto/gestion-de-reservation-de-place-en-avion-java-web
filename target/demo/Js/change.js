function change() {
  var val = $("#NAvion").val();
  if (val != "") {
    document.location.replace(
      "http://localhost:8080/demo/ajouter/reservation?ido=" + val
    );
  } else {
    document.location.replace("http://localhost:8080/demo/ajouter/reservation");
  }
}

function changeModifier() {
  var parametre = window.location.search;
  var URLparam = new URLSearchParams(parametre);
  var param = URLparam.get("id_modifier")
  var val = $("#NAvion").val();
  if (val != "") {
    document.location.replace(
      "http://localhost:8080/demo/modifier/reservation?id_modifier=" +
        param +
        "&ido=" +
        val
    );
  } else {
    document.location.replace(
      "http://localhost:8080/demo/modifier/reservation?id_modifier=" + param
    );
  }
}
