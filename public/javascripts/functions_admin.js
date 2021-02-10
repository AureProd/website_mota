
function serverStartStop(button, action) {
    let ligne = $(button).parent().parent();
    let id = ligne.attr("id");

    let dico = { id: id, action: action };

    $.ajax({
        url : "/bash/serverStartStop",
        type : "POST",
        contentType: "application/json",
        data: JSON.stringify(dico),
        success : function() {
            lsServer(id);
        },
        error: function (err) {
            console.log(err);
        }
    });
}

function lsServer(id) {
    $.ajax({
        url : "/bash/lsServer",
        type : "POST",
        contentType: "application/json",
        data: JSON.stringify({ id: id }),
        success : function (resultat) {
            let titre = $("div#" + id).children("div").children("h3.titre_serveur"); 
            let start_button = $("div#" + id).children("div").children("button.start_serveur"); 
            let restart_button = $("div#" + id).children("div").children("button.restart_serveur"); 
            let stop_button = $("div#" + id).children("div").children("button.stop_serveur"); 

            if (resultat.trim() == "demarer") {
                start_button.hide();
                stop_button.show();
                restart_button.show();

                if (titre.hasClass("arreter")) {
                    titre.removeClass("arreter");
                }

                if (!titre.hasClass("demarrer")) {
                    titre.addClass("demarrer");
                }
            } else {
                stop_button.hide();
                restart_button.hide();
                start_button.show();

                if (titre.hasClass("demarrer")) {
                    titre.removeClass("demarrer");
                }

                if (!titre.hasClass("arreter")) {
                    titre.addClass("arreter");
                }
            }
        },
        error: function (err) {
            console.log(err);
        }
    });
}