
(function (window, document) {
    window.onload = init;

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
            }
        });
    }

    function affichage (tableau)
    {
        let enumDroits = {0: "désactivé", 1: "utilisateur", 10: "super-admin"};

        $("table").append (
            `<tr id="${tableau.users_id}">
                <td>
                    <p>${tableau.users_name}</p>
                </td>
                <td>
                    <p class="texts">${enumDroits[tableau.users_acces]}</p>
                    <select class="form-control inputs ajouter_access" id="ajouter_adminlevel">
                        <option value=0>désactivé</option>
                        <option value=1>utilisateur</option>
                        <option value=10>super-admin</option>
                    </select>
                </td>
                <td>
                    <button onclick="boutonModifierApplication(this)" class="inputs btn btn-success">modifier</button> 
                    <button onclick="boutonModifierCancel(this)" class="inputs btn btn-danger">annuler</button> 
                    <button onclick="boutonModifier(this)" class="texts btn btn-warning">modifier</button> 
                </td>
            </tr>`
        );

        $(".inputs").hide();
        $("#" + tableau.users_id + ' option[value='+ tableau.users_acces +']').attr('selected','selected');
    }

    function getListe()
    {
        $.ajax({
            url : "/user/get_all",
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

    function init() {
        getAccess();

        getListe();
    }
})(window, document);



