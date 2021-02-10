
(function (window, document) {
    window.onload = init;

    let dbName;

    function getAccess() {
        $.ajax({
            url : "user/get_access",
            type : "GET",
            dataType : 'text',
            success : function(data) {
                let access = JSON.parse(data).access;

                if (access > 0) {
                    $(".login").hide();
                } else {
                    $("#logout").hide();
                }
        
                if (access < 10) {
                    window.location.href = "/index.html";
                }

                if ((dbName != "stargatedb") && (dbName != "stargatedb_dev")) {
                    window.location.href = "/index.html";
                }
            }
        });
    }

    function urlParam(name) {
        var results = new RegExp('[\?&]' + name + '=([^&#]*)')
            .exec(window.location.search);
        return (results !== null) ? results[1] || 0 : false;
    }

    function affichage (tableau)
    {
        let enumDroits = {0: "joueur", 5: "super-admin"};

        $("table").append (
            `<tr id="${tableau.wl_id}">
                <td>
                    <p class="texts">${tableau.wl_pseudo}</p>
                    <input value="${tableau.wl_pseudo}" class="form-control inputs ajouter_pseudo" type="text" placeholder="Pseudo">
                </td>
                <td>
                    <p class="texts">${tableau.wl_tag}</p>
                    <input value="${tableau.wl_tag}" class="form-control inputs ajouter_tag" type="text" placeholder="Tag discord (#0000)" maxlength="5">
                </td>
                <td>
                    <p class="texts">${tableau.wl_uid}</p>
                    <input value="${tableau.wl_uid}" class="form-control inputs ajouter_uid" type="number" placeholder="UID Steam">
                </td>
                <td>
                    <p class="texts">${enumDroits[tableau.wl_admin_level]}</p>
                    <select class="form-control inputs ajouter_adminlevel" id="ajouter_adminlevel">
                        <option value=0>joueur</option>
                        <option value=5>super-admin</option>
                    </select>
                </td>
                <td>
                    <button onclick="boutonModifierApplication(this)" class="inputs btn btn-success">modifier</button> 
                    <button onclick="boutonModifierCancel(this)" class="inputs btn btn-danger">annuler</button> 
                    <button onclick="boutonModifier(this)" class="texts btn btn-warning">modifier</button> 
                    <button onclick="boutonSupprimer(this)" class="texts btn btn-danger">supprimer</button>
                </td>
            </tr>`
        );

        $(".inputs").hide();
        $("#" + tableau.wl_id + ' option[value='+ tableau.wl_admin_level +']').attr('selected','selected');
    }

    function getWhiteListe()
    {
        $.ajax({
            url : ("/whitelist/" + dbName),
            type : "GET",
            dataType : 'text',
            success : function (resultat) {
                let tableaux = JSON.parse(resultat);
                
                tableaux.forEach((tableau) => {
                    affichage(tableau);
                });
            },
            error: function (err) {
                console.log(err);
            }
        });
    }

    function ajouterBdd() {
        let dico = { pseudo: $("#ajouter_pseudo").val(), tag: $("#ajouter_tag").val(), uid: $("#ajouter_uid").val(), adminlevel: $("#ajouter_adminlevel").val() };

        $.ajax({
            url : ("/whitelist/" + dbName + "/insert"),
            type : "POST",
            contentType : 'application/json',
            data : JSON.stringify(dico),
            success : function (resultat) {
                if (resultat == "OK") {
                    window.location.reload();
                } else {
                    alert("UID déjà en BDD !!!");
                }
            },
            error: function (err) {
                console.log(err);
            }
        });
    }

    function init() {
        dbName = urlParam("table");

        getAccess();

        $("#" + dbName).removeClass("text-white");
        $("#" + dbName).addClass("active text-dark");

        getWhiteListe();

        $("#ajouter").click(function () { ajouterBdd(); });
    }
})(window, document);



