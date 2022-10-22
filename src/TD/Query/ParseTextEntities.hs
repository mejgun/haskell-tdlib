{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ParseTextEntities where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.TextParseMode as TextParseMode
import qualified Utils as U

-- |
-- Parses Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, Code, Pre, PreCode, TextUrl and MentionName entities from a marked-up text. Can be called synchronously @text The text to parse @parse_mode Text parse mode
data ParseTextEntities = ParseTextEntities
  { -- |
    parse_mode :: Maybe TextParseMode.TextParseMode,
    -- |
    text :: Maybe String
  }
  deriving (Eq)

instance Show ParseTextEntities where
  show
    ParseTextEntities
      { parse_mode = parse_mode_,
        text = text_
      } =
      "ParseTextEntities"
        ++ U.cc
          [ U.p "parse_mode" parse_mode_,
            U.p "text" text_
          ]

instance T.ToJSON ParseTextEntities where
  toJSON
    ParseTextEntities
      { parse_mode = parse_mode_,
        text = text_
      } =
      A.object
        [ "@type" A..= T.String "parseTextEntities",
          "parse_mode" A..= parse_mode_,
          "text" A..= text_
        ]
