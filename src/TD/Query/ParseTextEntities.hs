module TD.Query.ParseTextEntities
  (ParseTextEntities(..)
  , defaultParseTextEntities
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.TextParseMode as TextParseMode

-- | Parses Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, BlockQuote, ExpandableBlockQuote, Code, Pre, PreCode, TextUrl and MentionName entities from a marked-up text. Can be called synchronously. Returns 'TD.Data.FormattedText.FormattedText'
data ParseTextEntities
  = ParseTextEntities
    { text       :: Maybe T.Text                      -- ^ The text to parse
    , parse_mode :: Maybe TextParseMode.TextParseMode -- ^ Text parse mode
    }
  deriving (Eq, Show)

instance I.ShortShow ParseTextEntities where
  shortShow
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

defaultParseTextEntities :: ParseTextEntities
defaultParseTextEntities =
  ParseTextEntities
    { text       = Nothing
    , parse_mode = Nothing
    }

