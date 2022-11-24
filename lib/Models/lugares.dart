class Lugares {
  var _address;
  var _id;
  var _latitud;
  var _longitud;
  var _name;
  var _pagina;
  var _schedule;
  var _urlPicture;

  Lugares();

  get urlPicture => _urlPicture;

  set urlPicture(value) {
    _urlPicture = value;
  }

  get schedule => _schedule;

  set schedule(value) {
    _schedule = value;
  }

  get pagina => _pagina;

  set pagina(value) {
    _pagina = value;
  }

  get name => _name;

  set name(value) {
    _name = value;
  }

  get longitud => _longitud;

  set longitud(value) {
    _longitud = value;
  }

  get latitud => _latitud;

  set latitud(value) {
    _latitud = value;
  }

  get id => _id;

  set id(value) {
    _id = value;
  }

  get address => _address;

  set address(value) {
    _address = value;
  }


}