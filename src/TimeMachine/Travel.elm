module TimeMachine.Travel where

{-| Internal module containing implementation for time travel.
You might say it's what makes time travel possible. Like
the flux capacitor maybe?
|-}

import Array

backward history =
  let current' = Array.get history.pointer <| Array.fromList history.entries
      pointer' = history.pointer + 1
  in
    { history | current <- current'
              , pointer <- pointer' }

forward history =
  let pointer' = if history.pointer == 1 then -1 else history.pointer - 2
      current' = Array.get pointer' <| Array.fromList history.entries
  in
  { history | current <- current'
            , pointer <- pointer'
  }
