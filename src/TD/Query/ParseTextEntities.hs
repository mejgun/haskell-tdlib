{-# LANGUAGE OverloadedStrings #-}

module TD.Query.ParseTextEntities where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.TextParseMode as TextParseMode
import qualified Utils as U

-- |
-- Parses Bold, Italic, Underline, Strikethrough, Spoiler, Code, Pre, PreCode, TextUrl and MentionName entities contained in the text. Can be called synchronously @text The text to parse @parse_mode Text parse mode
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
      { parse_mode = parse_mode,
        text = text
      } =
      "ParseTextEntities"
        ++ U.cc
          [ U.p "parse_mode" parse_mode,
            U.p "text" text
          ]

instance T.ToJSON ParseTextEntities where
  toJSON
    ParseTextEntities
      { parse_mode = parse_mode,
        text = text
      } =
      A.object
        [ "@type" A..= T.String "parseTextEntities",
          "parse_mode" A..= parse_mode,
          "text" A..= text
        ]
