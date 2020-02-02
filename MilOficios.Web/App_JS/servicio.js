(function (servicio) {
    servicio.success = successReload;
    servicio.pages = 1;
    servicio.rowSize = 10;
    /*Atributos para el manejo del Hub*/
    servicio.hub = {};
    servicio.ids = [];
    servicio.recordInUse = false;

    servicio.addServicio = addServicioId;
    servicio.removeHubServicio = removeServicioId;
    servicio.validate = validate;

    $(function () {
        connectToHub();
        init(1);
    })

    return servicio;

    function successReload(option) {
        miloficios.closeModal(option);
        elements = document.getElementsByClassName('active');
        activePage = elements[1].children;
        console.log(activePage[0].text);

        lstTableRows = $('.table >tbody >tr').length - 1;
        console.log(lstTableRows);

        if (option === "delete" && lstTableRows === 1) {
            cant = activePage[0].text;
            init(cant - 1);
        }
        else
            init(activePage[0].text);
    }

    function init(numPage) {
        $.get('/Servicio/Count/' + servicio.rowSize,
            function (data) {
                servicio.pages = data;
                $('.pagination').bootpag({
                    total: servicio.pages,
                    page: numPage,
                    maxVisible: 5,
                    leaps: true,
                    firstLastUse: true,
                    first: '← ',
                    last: '→ ',
                    wrapClass: 'pagination',
                    activeClass: 'active',
                    disabledClass: 'disabled',
                    nextClass: 'next',
                    prevClass: 'prev',
                    lastClass: 'last',
                    firstClass: 'first'
                }).on('page', function (event, num) {
                    getServicios(num);
                });
                getServicios(numPage);
            });
    }

    function getServicios(cantPages) {
        var url = '/Servicio/List/' + cantPages + '/' + servicio.rowSize;
        $.get(url, function (data) {
            $('.content').html(data);
            //console.log(data);
        });
    }

    function addServicioId(id) {
        servicio.hub.server.addServicioId(id);
    }

    function removeServicioId(id) {
        servicio.hub.server.removeServicioId(id);
    }

    function connectToHub() {
        servicio.hub = $.connection.servicioHub;
        servicio.hub.client.servicioStatus = servicioStatus;
    }

    function servicioStatus(servicioIds) {
        console.log(servicioIds);
        servicio.ids = servicioIds;
    }

    function validate(id) {
        servicio.recordInUse = (servicio.ids.indexOf(id) > -1);
        if (servicio.recordInUse) {
            $('#inUse').removeClass('hidden');
            $('#btn-save').html("");
        }
    }
})(window.servicio = window.servicio || {});