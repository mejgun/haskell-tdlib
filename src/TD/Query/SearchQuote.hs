module TD.Query.SearchQuote
  (SearchQuote(..)
  , defaultSearchQuote
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FormattedText as FormattedText

-- | Searches for a given quote in a text. Returns found quote start position in UTF-16 code units. Returns a 404 error if the quote is not found. Can be called synchronously. Returns 'TD.Data.FoundPosition.FoundPosition'
data SearchQuote
  = SearchQuote
    { text           :: Maybe FormattedText.FormattedText -- ^ Text in which to search for the quote
    , quote          :: Maybe FormattedText.FormattedText -- ^ Quote to search for
    , quote_position :: Maybe Int                         -- ^ Approximate quote position in UTF-16 code units
    }
  deriving (Eq, Show)

instance I.ShortShow SearchQuote where
  shortShow
    SearchQuote
      { text           = text_
      , quote          = quote_
      , quote_position = quote_position_
      }
        = "SearchQuote"
          ++ I.cc
          [ "text"           `I.p` text_
          , "quote"          `I.p` quote_
          , "quote_position" `I.p` quote_position_
          ]

instance AT.ToJSON SearchQuote where
  toJSON
    SearchQuote
      { text           = text_
      , quote          = quote_
      , quote_position = quote_position_
      }
        = A.object
          [ "@type"          A..= AT.String "searchQuote"
          , "text"           A..= text_
          , "quote"          A..= quote_
          , "quote_position" A..= quote_position_
          ]

defaultSearchQuote :: SearchQuote
defaultSearchQuote =
  SearchQuote
    { text           = Nothing
    , quote          = Nothing
    , quote_position = Nothing
    }

