

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
        let titre = ligne.children("td").children(".ajouter_titre").val();

        let dico = { id: id, titre: titre };

        $.ajax({
            url : ("/server/update"),
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
    }
}