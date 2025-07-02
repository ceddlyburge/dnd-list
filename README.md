# DnD List

Drag and Drop for sortable lists in Elm web apps with mouse and pointer support.

[Demos and Sources](https://ceddlyburge.github.io/dnd-list/)

### Examples

```bash
$ npm install -g elm elm-live
$ npm run watch
```

### Basic API

```elm
create : DnDList.Config a -> Msg -> DnDList.System a Msg

port onPointerMove : (Json.Encode.Value -> msg) -> Sub msg

port onPointerUp : (Json.Encode.Value -> msg) -> Sub msg

port releasePointerCapture : Json.Encode.Value -> Cmd msg

createWithTouch :
    Config a
    -> (Msg -> msg)
    -> ((Json.Encode.Value -> msg) -> Sub msg) -- onPointerMove
    -> ((Json.Encode.Value -> msg) -> Sub msg) -- onPointerUp
    -> (Json.Encode.Value -> Cmd msg) -- releasePointerCapture
    -> System a msg
```

```elm
update: DnDList.Msg -> DnDList.Model -> List a -> ( DnDList.Model, List a )

dragEvents : DragIndex -> DragElementId -> List (Html.Attribute Msg)

dropEvents : DropIndex -> DropElementId -> List (Html.Attribute Msg)

ghostStyles : DnDList.Model -> List (Html.Attribute Msg)

info : DnDList.Model -> Maybe DnDList.Info
```

### Config

```elm
pseudocode type alias Config a =
    { beforeUpdate : DragIndex -> DropIndex -> List a -> List a

    , movement : Free
               | Horizontal
               | Vertical

    , listen : OnDrag
             | OnDrop

    , operation : InsertAfter
                | InsertBefore
                | Rotate
                | Swap
                | Unaltered
    }
```

### Info

```elm
type alias Info =
    { dragIndex : Int
    , dropIndex : Int
    , dragElementId : String
    , dropElementId : String
    , dragElement : Browser.Dom.Element
    , dropElement : Browser.Dom.Element
    , startPosition : { x : Float, y : Float }
    , currentPosition : { x : Float, y : Float }
    }
```

### Mobile

For drag and drop to work on mobile, use (Html.Attributes.style "touch-action" "none").

## Real Projects

- [Risk Register](https://marketplace.atlassian.com/apps/1213146/risk-register?hosting=server&tab=overview) by ProjectBalm is a risk management add-on for Atlassian Jira.  
  _dnd-list_ is used in the risk model editor for re-ordering risk levels, and is even used to re-order the rows and columns of the risk matrix.
- [Tournament Organiser](https://tournament-organiser.onrender.com/) helps optimise the order of games in a tournament. _dnd-list_ is used to manually tweak the game order after optimisation.

## Credits

This package was inspired by the following shiny gems:

- [ir4y/elm-dnd](https://package.elm-lang.org/packages/ir4y/elm-dnd/latest/) :gem:
- [zwilias/elm-reorderable](https://package.elm-lang.org/packages/zwilias/elm-reorderable/latest/)
- [Dart Drag and Drop](https://code.makery.ch/library/dart-drag-and-drop/)
