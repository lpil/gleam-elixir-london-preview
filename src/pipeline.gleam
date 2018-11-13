fn log_in_user(state, username) {
  { state | user = username }
}

fn check_if_banned(state) {
  case state.user {
  | "Simon" -> { state | banned = True }
  | _ -> { state | banned = False }
  }
}

fn send_resp(state) {
  case state.banned {
  | True -> "You are banned!"
  | False -> "Welcome!"
  }
}

pub fn run(username) {
  {}
  // |> log_in_user(_, username)
  |> check_if_banned
  |> send_resp
}
