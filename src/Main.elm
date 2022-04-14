module Main exposing (main)

-- Input a user name and password. Make sure the password matches.
--
-- Read how it works:
--   https://guide.elm-lang.org/architecture/forms.html
--

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput,onClick)
-- import Executor exposing (executor)
-- import Lexer exposing (lexer)
-- import Compiler exposing (compiler)

-- MAIN


main =
  Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
  { input : String
  , output : String
  }


init : Model
init =
  Model "" ""



-- UPDATE


type Msg
  = Compile String
  | Replace String


update : Msg -> Model -> Model
update msg model =
  case msg of
    Compile str ->
      { model | output = str }
    Replace str ->
      { model | input = str}



-- VIEW


view : Model -> Html Msg
view model =
  div []
        [ code [] [ pre [] [ text model.output ] ]
        , input [ placeholder "Type here your brainfuck code", onInput Replace ] []
        , button [ onClick (Compile model.input) ] [ text "Compile!" ]
        ]

-- compileCode : String -> String
-- compileCode str = str
  -- str |> lexer |> compiler |> executor |> String.concat