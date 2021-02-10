
function urlParam(name) {
    var results = new RegExp('[\?&]' + name + '=([^&#]*)')
        .exec(window.location.search);
    return (results !== null) ? results[1] || 0 : false;
}

function boutonSupprimer(input) {
    verifOK(input);

    function verifOK (params) {
        if (confirm("Vous êtes sur de supprimer cette personne de la white-liste !!!")) {
            deleteBdd(params);
        }
    }

    function deleteBdd(value) {
        let id = $(value).parent().parent().attr("id");

        $.ajax({
            url : ("/whitelist/" + urlParam("table") + "/delete"),
            type : "POST",
            contentType : 'application/json',
            data : JSON.stringify({ id : id }),
            success : function (resultat) {
                if (resultat == "OK") {
                    window.location.reload();
                }
            },
            error: function (err) {
                console.log(err);
            }
        });
    }
}

function boutonModifier(input) {
    changeToInput(input);

    function changeToInput(param) {
        let ligne = $(param).parent().parent();

        ligne.children("td").children(".texts").hide();
        ligne.children("td").children(".inputs").show();
    }
}

function boutonModifierApplication(input) {
    modifBdd(input);

    function modifBdd(value) {
        let ligne = $(value).parent().parent();
        let id = ligne.attr("id");
        let pseudo = ligne.children("td").children(".ajouter_pseudo").val();
        let tag = ligne.children("td").children(".ajouter_tag").val();
        let uid = ligne.children("td").children(".ajouter_uid").val();
        let adminlevel = ligne.children("td").children(".ajouter_adminlevel").val();

        let dico = { id: id, pseudo: pseudo, tag: tag, uid: uid, adminlevel: adminlevel };

        $.ajax({
            url : ("/whitelist/" + urlParam("table") + "/update"),
            type : "POST",
            contentType: "application/json",
            data: JSON.stringify(dico),
            success : function (resultat) {
                if (resultat == "OK") {
                    window.location.reload();
                }
            },
            error: function (err) {
                console.log(err);
            }
        });
    }
}

function boutonModifierCancel(input) {
    changeToText(input);

    function changeToText(param) {
        let ligne = $(param).parent().parent();

        ligne.children("td").children(".inputs").hide();
        ligne.children("td").children(".texts").show();
        ligne.children("td").children("select").val( ligne.children("td").children("select").find("option[selected]").val() );
    }
}