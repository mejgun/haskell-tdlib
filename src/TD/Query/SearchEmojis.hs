{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SearchEmojis where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Searches for emojis by keywords. Supported only if the file database is enabled
data SearchEmojis = SearchEmojis
  { -- | List of possible IETF language tags of the user's input language; may be empty if unknown
    input_language_codes :: Maybe [String],
    -- | Pass true if only emojis, which exactly match the text, needs to be returned
    exact_match :: Maybe Bool,
    -- | Text to search for
    text :: Maybe String
  }
  deriving (Eq)

instance Show SearchEmojis where
  show
    SearchEmojis
      { input_language_codes = input_language_codes_,
        exact_match = exact_match_,
        text = text_
      } =
      "SearchEmojis"
        ++ U.cc
          [ U.p "input_language_codes" input_language_codes_,
            U.p "exact_match" exact_match_,
            U.p "text" text_
          ]

instance T.ToJSON SearchEmojis where
  toJSON
    SearchEmojis
      { input_language_codes = input_language_codes_,
        exact_match = exact_match_,
        text = text_
      } =
      A.object
        [ "@type" A..= T.String "searchEmojis",
          "input_language_codes" A..= input_language_codes_,
          "exact_match" A..= exact_match_,
          "text" A..= text_
        ]
