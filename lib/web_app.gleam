external type Request

// Reading information from the request

external fn get_path(Request) -> List(String) = 'elli_request' 'path'
external fn get_raw_method(Request) -> Atom = 'elli_request' 'method'

enum Method =
  | Get
  | Post
  | Patch
  | Delete
  | Other(Atom)

fn get_method(request) {
  case request |> get_raw_method {
  | 'GET' -> Get
  | 'POST' -> Post
  | 'PATCH' -> Patch
  | 'DELETE' -> Delete
  | other -> Other(other)
  }
}

// Elli web server callbacks

pub fn handle(request, args) {
  method = get_method(request)
  path = get_path(request)

  case {method, path} {
  | {Get, []} ->
      {200, [], ["Hello from Gleam!"]}

  | {Get, ["hello", name]} ->
      {200, [], ["Hello ", name, ", I'm Gleam!"]}

  | {Delete, _} ->
      {401, [], ["No deletes, sorry!"]}

  | _ ->
      {404, [], ["Page not found"]}
  }
}

pub fn handle_event(event, data, args) {
  'ok'
}

// Starting the server

external fn elli_start_link(List(Tuple(Atom, Atom))) -> Atom = 'elli' 'start_link'

pub fn start_link() {
  elli_start_link([{'callback', 'gleam_web_app'}])
}
