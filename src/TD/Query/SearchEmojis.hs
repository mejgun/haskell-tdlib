module TD.Query.SearchEmojis(SearchEmojis(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data SearchEmojis -- ^ Searches for emojis by keywords. Supported only if the file database is enabled
  = SearchEmojis
    { text                 :: Maybe T.Text   -- ^ Text to search for
    , exact_match          :: Maybe Bool     -- ^ Pass true if only emojis, which exactly match the text, needs to be returned
    , input_language_codes :: Maybe [T.Text] -- ^ List of possible IETF language tags of the user's input language; may be empty if unknown
    }
  deriving (Eq)

instance Show SearchEmojis where
  show
    SearchEmojis
      { text                 = text_
      , exact_match          = exact_match_
      , input_language_codes = input_language_codes_
      }
        = "SearchEmojis"
          ++ I.cc
          [ "text"                 `I.p` text_
          , "exact_match"          `I.p` exact_match_
          , "input_language_codes" `I.p` input_language_codes_
          ]

instance AT.ToJSON SearchEmojis where
  toJSON
    SearchEmojis
      { text                 = text_
      , exact_match          = exact_match_
      , input_language_codes = input_language_codes_
      }
        = A.object
          [ "@type"                A..= AT.String "searchEmojis"
          , "text"                 A..= text_
          , "exact_match"          A..= exact_match_
          , "input_language_codes" A..= input_language_codes_
          ]
