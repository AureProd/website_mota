
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
        $("table").append (
            `<tr id="${tableau.serv_id}">
                <td>
                    <p class="texts">${tableau.serv_titre}</p>
                    <input value="${tableau.serv_titre}" class="form-control inputs ajouter_titre" type="text" placeholder="Titre du serveur">
                </td>
                <td>
                    <p>${tableau.serv_name}</p>
                </td>
                <td>
                    <p>${tableau.serv_executable}</p>
                </td>
                <td>
                    <p>${tableau.serv_path}</p>
                </td>
                <td>
                    <button onclick="boutonModifierApplication(this)" class="inputs btn btn-success">modifier</button> 
                    <button onclick="boutonModifierCancel(this)" class="inputs btn btn-danger">annuler</button> 
                    <button onclick="boutonModifier(this)" class="texts btn btn-warning">modifier</button> 
                </td>
            </tr>`
        );

        $(".inputs").hide();
    }

    function getServersListe()
    {
        $.ajax({
            url : ("/server/get_all"),
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

        getServersListe();
    }
})(window, document);



