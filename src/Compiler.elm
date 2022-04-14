module Compiler exposing (..)

import Parser exposing ((|.),(|=), Parser)

-- 各種命令の型定義
type Symbol
  = PtrIncrement
  | PtrDecrement
  | Increment
  | Decrement
  | Output
  | LoopStart
  | LoopEnd


-- ">,<,+,-,.,[,]"という文字列をSymbolで定義した命令に解釈するパーサーを定義
ptrIncrement : Parser Symbol
ptrIncrement =
      Parser.succeed PtrIncrement |. Parser.symbol ">"

ptrDecrement : Parser Symbol
ptrDecrement =
      Parser.succeed PtrDecrement |. Parser.symbol "<"

increment : Parser Symbol
increment =
      Parser.succeed Increment |. Parser.symbol "+"

decrement : Parser Symbol
decrement =
      Parser.succeed Decrement |. Parser.symbol "-"

output : Parser Symbol
output =
      Parser.succeed Output |. Parser.symbol "."
    
loopStart : Parser Symbol
loopStart =
      Parser.succeed Output |. Parser.symbol "["

loopEnd : Parser Symbol
loopEnd =
      Parser.succeed Output |. Parser.symbol "]"