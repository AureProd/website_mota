
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
        let access = ligne.children("td").children(".ajouter_access").val();

        let dico = { id: id, access: access };

        $.ajax({
            url : ("/user/update"),
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