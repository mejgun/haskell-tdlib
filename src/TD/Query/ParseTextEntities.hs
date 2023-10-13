module TD.Query.ParseTextEntities(ParseTextEntities(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.TextParseMode as TextParseMode

data ParseTextEntities -- ^ Parses Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, Code, Pre, PreCode, TextUrl and MentionName entities from a marked-up text. Can be called synchronously
  = ParseTextEntities
    { text       :: Maybe T.Text                      -- ^ The text to parse
    , parse_mode :: Maybe TextParseMode.TextParseMode -- ^ Text parse mode
    }
  deriving (Eq)

instance Show ParseTextEntities where
  show
    ParseTextEntities
      { text       = text_
      , parse_mode = parse_mode_
      }
        = "ParseTextEntities"
          ++ I.cc
          [ "text"       `I.p` text_
          , "parse_mode" `I.p` parse_mode_
          ]

instance AT.ToJSON ParseTextEntities where
  toJSON
    ParseTextEntities
      { text       = text_
      , parse_mode = parse_mode_
      }
        = A.object
          [ "@type"      A..= AT.String "parseTextEntities"
          , "text"       A..= text_
          , "parse_mode" A..= parse_mode_
          ]
