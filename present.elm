import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http exposing (..)
import Json.Decode as Decode

main =
    Html.program
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }

type alias Model =
    { nextSlide : String
    , prevSlide : String
    , slideTitle : String
    , slideText : String
    , slideImg : String
    }

init : (Model, Cmd Msg)
init =
    (Model "" "" "" "" "", readSlide "slide1.json")

readSlide : String -> Cmd Msg
readSlide slideName =
    let
        url = "./assets/slides/" ++ slideName
        request = Http.get url decodeSlide
    in
        Http.send NewSlide request

fieldDecoder fieldName = Decode.field fieldName Decode.string

decodeSlide = Decode.map5 Model
              (fieldDecoder "nextSlide")
              (fieldDecoder "prevSlide")
              (fieldDecoder "slideTitle")
              (fieldDecoder "slideText")
              (fieldDecoder "slideImg")

type Msg = NextSlide | PrevSlide | NewSlide (Result Http.Error Model)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        PrevSlide ->
            (model, readSlide model.prevSlide)

        NextSlide ->
            (model, readSlide model.nextSlide)

        NewSlide (Ok newSlide) ->
            (newSlide, Cmd.none)

        NewSlide (Err _) ->
            (model, Cmd.none)

subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none

spacerStyle = [ ("display", "inline-block")
              , ("width", "400px")
              ]

view : Model -> Html Msg
view model =
    div [ align "center" ]
        [ h1 [] [ text model.slideTitle ]
        , div [] [ img [ src model.slideImg, width 800 ] [] ]
        , button [onClick PrevSlide] [text "Prev"]
        , p [style spacerStyle] [ text model.slideText ]
        , button [onClick NextSlide] [text "Next"]
        ]
