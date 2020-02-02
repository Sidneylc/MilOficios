(function (cliente) {
    cliente.success = successReload;
    cliente.pages = 1;
    cliente.rowSize = 10;
    /*Atributos para el manejo del Hub*/
    cliente.hub = {};
    cliente.ids = [];
    cliente.recordInUse = false;

    cliente.addCliente = addClienteId;
    cliente.removeHubCliente = removeClienteId;
    cliente.validate = validate;

    $(function () {
        connectToHub();
        init(1);
    })

    return cliente;

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
        $.get('/Cliente/Count/' + cliente.rowSize,
            function (data) {
                cliente.pages = data;
                $('.pagination').bootpag({
                    total: cliente.pages,
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
                    getClientes(num);
                });
                getClientes(numPage);
            });
    }

    function getClientes(cantPages) {
        var url = '/Cliente/List/' + cantPages + '/' + cliente.rowSize;
        $.get(url, function (data) {
            $('.content').html(data);
            //console.log(data);
        });
    }

    function addClienteId(id) {
        cliente.hub.server.addClienteId(id);
    }

    function removeClienteId(id) {
        cliente.hub.server.removeClienteId(id);
    }

    function connectToHub() {
        cliente.hub = $.connection.clienteHub;
        cliente.hub.client.clienteStatus = clienteStatus;
    }

    function clienteStatus(clienteIds) {
        console.log(clienteIds);
        cliente.ids = clienteIds;
    }

    function validate(id) {
        cliente.recordInUse = (cliente.ids.indexOf(id) > -1);
        if (cliente.recordInUse) {
            $('#inUse').removeClass('hidden');
            $('#btn-save').html("");
        }
    }
})(window.cliente = window.cliente || {});