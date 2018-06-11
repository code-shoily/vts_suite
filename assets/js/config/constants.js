// ---------- LOCAL STORAGE
export const LOCAL_STORAGE_KEY = "wlt-authmodel";
// ---------- COLORS
export const FLAT_COLORS = {
  turquoise: "#1abc9c",
  emerald: "#2ecc71",
  peterRiver: "#3498db",
  amethyst: "#9b59b6",
  wetAsphalt: "#34495e",
  greenSea: "#16a085",
  nephritis: "#16a085",
  belizeHole: "#2980b9",
  wisteria: "#8e44ad",
  midnightBlue: "#2c3e50",
  sunFlower: "#f1c40f",
  carrot: "#e67e22",
  alizarin: "#e74c3c",
  clouds: "#ecf0f1",
  concrete: "#95a5a6",
  orange: "#f39c12",
  pumpkin: "#d35400",
  pomegranate: "#c0392b",
  silver: "#bdc3c7",
  asbestos: "#7f8c8d"
};

export const OPEN_API_KEY = "340486bd8a058e4c4f3864be37dfcdb0";
export const GOOGLE_MAP_URL =
  "https://maps.googleapis.com/maps/api/js?key=AIzaSyDWCyZ6lGTmsMgy7ENaSi1qsKBYPHGNImE&v=3.exp&libraries=geometry,drawing,places";
// ---------- URLS
export const URL = "http://localhost:4000/";

export const API_URL = `${URL}api/`;
export const ADMIN_URL = `${URL}admin/`;
export const LOGIN_URL = `${API_URL}login/`;
export const USER_URL = `${API_URL}user/`;
//export const PASSWORD_CHANGE_URL = `${URL}rest-auth/password/change/`; //old_password, new_password1, new_password2

export const GROUP_URL = `${API_URL}clientgroup/`;
export const VEHICLE_URL = `${API_URL}vehicle/`; //group:ID
export const LOCATION_URL = `${API_URL}vehicle/location/`; //group:ID
export const HISTORY_URL = `${API_URL}vehicle/history/`; //asset:ID;date_from:FD;date_till:FD
export const NLM_URL = `${API_URL}vehicle/nlm/`; //lat:Int;lng:Int

export function photoURLFunc(id) {
  return `${API_URL}vehicle/${id}/takephoto/`;
}

export function stopEngineURLFunc(id) {
  return `${API_URL}vehicle/${id}/stopengine/`;
}

export function startEngineURLFunc(id) {
  return `${API_URL}vehicle/${id}/startengine/`;
}

export function headerFunc(key) {
  return { headers: { Authorization: `Token ${key}` } };
}
