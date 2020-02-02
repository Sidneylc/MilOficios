(function (lugar) {
    lugar.success = successReload;
    lugar.pages = 1;
    lugar.rowSize = 10;
    /*Atributos para el manejo del Hub*/
    lugar.hub = {};
    lugar.ids = [];
    lugar.recordInUse = false;

    lugar.addLugar = addLugarId;
    lugar.removeHubLugar = removeLugarId;
    lugar.validate = validate;

    $(function () {
        connectToHub();
        init(1);
    })

    return lugar;

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
        $.get('/Lugar/Count/' + lugar.rowSize,
            function (data) {
                lugar.pages = data;
                $('.pagination').bootpag({
                    total: lugar.pages,
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
                    getLugars(num);
                });
                getLugars(numPage);
            });
    }

    function getLugars(cantPages) {
        var url = '/Lugar/List/' + cantPages + '/' + lugar.rowSize;
        $.get(url, function (data) {
            $('.content').html(data);
            //console.log(data);
        });
    }

    function addLugarId(id) {
        lugar.hub.server.addLugarId(id);
    }

    function removeLugarId(id) {
        lugar.hub.server.removeLugarId(id);
    }

    function connectToHub() {
        lugar.hub = $.connection.lugarHub;
        lugar.hub.client.lugarStatus = lugarStatus;
    }

    function lugarStatus(lugarIds) {
        console.log(lugarIds);
        lugar.ids = lugarIds;
    }

    function validate(id) {
        lugar.recordInUse = (lugar.ids.indexOf(id) > -1);
        if (lugar.recordInUse) {
            $('#inUse').removeClass('hidden');
            $('#btn-save').html("");
        }
    }
})(window.lugar = window.lugar || {});