

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
        $("#servers").append (
            `<br>
            <div class="card row" id="${tableau.serv_id}">
                <div class="col-md-8 col-lg-6 mx-auto text-center">
                    <br>
                    <h3 class="titre_serveur" class="text-center">${tableau.serv_titre}</h3>
                    <br>
                    <button onclick="serverStartStop(this, 'start')" class="start_serveur btn btn-success btn-primary mb-2">start</button>
                    <button onclick="serverStartStop(this, 'restart')" class="restart_serveur btn btn-warning btn-primary mb-2">restart</button>
                    <button onclick="serverStartStop(this, 'stop')" class="stop_serveur btn btn btn-danger btn-primary mb-2">stop</button>
                    <br>
                </div>
            </div>`
        );

        lsServer(tableau.serv_id);
        $("div#" + tableau.serv_id + " button").hide();
    }

    function getListe()
    {
        $.ajax({
            url : "/bash/get_all",
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

        // $("#start_airsoft").click(function () { execStartStopAirsoft("start"); });
        // $("#stop_airsoft").click(function () { execStartStopAirsoft("stop"); });
        // $("#restart_airsoft").click(function () { execStartStopAirsoft("restart"); });

        // $("#start_stargate").click(function () { execStartStopStarGate("start"); });
        // $("#stop_stargate").click(function () { execStartStopStarGate("stop"); });
        // $("#restart_stargate").click(function () { execStartStopStarGate("restart"); });

        // execLsAirsoft();
        // execLsStarGate();
    }
})(window, document);

