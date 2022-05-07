{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetEmojiSuggestionsUrl where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns an HTTP URL which can be used to automatically log in to the translation platform and suggest new emoji replacements. The URL will be valid for 30 seconds after generation @language_code Language code for which the emoji replacements will be suggested
data GetEmojiSuggestionsUrl = GetEmojiSuggestionsUrl
  { -- |
    language_code :: Maybe String
  }
  deriving (Eq)

instance Show GetEmojiSuggestionsUrl where
  show
    GetEmojiSuggestionsUrl
      { language_code = language_code
      } =
      "GetEmojiSuggestionsUrl"
        ++ U.cc
          [ U.p "language_code" language_code
          ]

instance T.ToJSON GetEmojiSuggestionsUrl where
  toJSON
    GetEmojiSuggestionsUrl
      { language_code = language_code
      } =
      A.object
        [ "@type" A..= T.String "getEmojiSuggestionsUrl",
          "language_code" A..= language_code
        ]
