module TD.Query.SearchEmojis
  (SearchEmojis(..)
  , defaultSearchEmojis
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Searches for emojis by keywords. Supported only if the file database is enabled. Order of results is unspecified. Returns 'TD.Data.EmojiKeywords.EmojiKeywords'
data SearchEmojis
  = SearchEmojis
    { text                 :: Maybe T.Text   -- ^ Text to search for
    , input_language_codes :: Maybe [T.Text] -- ^ List of possible IETF language tags of the user's input language; may be empty if unknown
    }
  deriving (Eq, Show)

instance I.ShortShow SearchEmojis where
  shortShow
    SearchEmojis
      { text                 = text_
      , input_language_codes = input_language_codes_
      }
        = "SearchEmojis"
          ++ I.cc
          [ "text"                 `I.p` text_
          , "input_language_codes" `I.p` input_language_codes_
          ]

instance AT.ToJSON SearchEmojis where
  toJSON
    SearchEmojis
      { text                 = text_
      , input_language_codes = input_language_codes_
      }
        = A.object
          [ "@type"                A..= AT.String "searchEmojis"
          , "text"                 A..= text_
          , "input_language_codes" A..= input_language_codes_
          ]

defaultSearchEmojis :: SearchEmojis
defaultSearchEmojis =
  SearchEmojis
    { text                 = Nothing
    , input_language_codes = Nothing
    }

