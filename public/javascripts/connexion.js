
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

    function login_valid() {
        let dico = { username: $("#username")[0].value, password: $("#password")[0].value };

        if (dico.username == "") {
            alert("Veuillez entrer un nom d'utilisateur !!!");
        } else if (dico.password == "") {
            alert("Veuillez entrer un mot de passe !!!");
        } else {
            $.ajax({
                url: "/user/login",
                contentType: "application/json", // Pour préciser le type de données qui transite
                data: JSON.stringify(dico),
                type: "post",
                success: function (result) {
                    if (result == "OK") {
                        window.location.href = "/index.html";
                    } else if (result == "NOK_bis") {
                        alert("Votre compte à été désactivé !!!");
                    } else {
                        alert("Votre nom d'utilisateur ou votre mot de passe est invalide !!!");
                    }
                },
                error: function (err) {
                    console.log(err);
                }
            });
        }
    }

    function register_valid() {
        let dico = { username: $("#username")[0].value, password: $("#password")[0].value };

        if (dico.username == "") {
            alert("Veuillez entrer un nom d'utilisateur !!!");
        } else if (dico.password == "") {
            alert("Veuillez entrer un mot de passe !!!");
        } else {
            $.ajax({
                url: "/user/register",
                contentType: "application/json", // Pour préciser le type de données qui transite
                data: JSON.stringify(dico),
                type: "post",
                success: function (result) {
                    if (result == "OK") {
                        window.location.href = "/index.html";
                    } else {
                        alert("Ce nom d'utilisateur est déjà utilisé !!!");
                    }
                },
                error: function (err) {
                    console.log(err);
                }
            });
        }
    }

    function init() {
        getAccess();

        if (urlParam("type") == "register") {
            $("#submit").text("S'enregistrer");
            $("#titre").text("Création de compte");
        }

        $("#submit").click(function () { 
            if (urlParam("type") == "register") register_valid();
            else login_valid(); 
        });
    }
})(window, document);

