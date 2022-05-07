{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SearchEmojis where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Searches for emojis by keywords. Supported only if the file database is enabled @text Text to search for @exact_match Pass true if only emojis, which exactly match the text, needs to be returned @input_language_codes List of possible IETF language tags of the user's input language; may be empty if unknown
data SearchEmojis = SearchEmojis
  { -- |
    input_language_codes :: Maybe [String],
    -- |
    exact_match :: Maybe Bool,
    -- |
    text :: Maybe String
  }
  deriving (Eq)

instance Show SearchEmojis where
  show
    SearchEmojis
      { input_language_codes = input_language_codes,
        exact_match = exact_match,
        text = text
      } =
      "SearchEmojis"
        ++ U.cc
          [ U.p "input_language_codes" input_language_codes,
            U.p "exact_match" exact_match,
            U.p "text" text
          ]

instance T.ToJSON SearchEmojis where
  toJSON
    SearchEmojis
      { input_language_codes = input_language_codes,
        exact_match = exact_match,
        text = text
      } =
      A.object
        [ "@type" A..= T.String "searchEmojis",
          "input_language_codes" A..= input_language_codes,
          "exact_match" A..= exact_match,
          "text" A..= text
        ]
