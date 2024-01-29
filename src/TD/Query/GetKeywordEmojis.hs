module TD.Query.GetKeywordEmojis
  (GetKeywordEmojis(..)
  , defaultGetKeywordEmojis
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Return emojis matching the keyword. Supported only if the file database is enabled. Order of results is unspecified. Returns 'TD.Data.Emojis.Emojis'
data GetKeywordEmojis
  = GetKeywordEmojis
    { text                 :: Maybe T.Text   -- ^ Text to search for
    , input_language_codes :: Maybe [T.Text] -- ^ List of possible IETF language tags of the user's input language; may be empty if unknown
    }
  deriving (Eq, Show)

instance I.ShortShow GetKeywordEmojis where
  shortShow
    GetKeywordEmojis
      { text                 = text_
      , input_language_codes = input_language_codes_
      }
        = "GetKeywordEmojis"
          ++ I.cc
          [ "text"                 `I.p` text_
          , "input_language_codes" `I.p` input_language_codes_
          ]

instance AT.ToJSON GetKeywordEmojis where
  toJSON
    GetKeywordEmojis
      { text                 = text_
      , input_language_codes = input_language_codes_
      }
        = A.object
          [ "@type"                A..= AT.String "getKeywordEmojis"
          , "text"                 A..= text_
          , "input_language_codes" A..= input_language_codes_
          ]

defaultGetKeywordEmojis :: GetKeywordEmojis
defaultGetKeywordEmojis =
  GetKeywordEmojis
    { text                 = Nothing
    , input_language_codes = Nothing
    }

