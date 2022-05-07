{-# LANGUAGE OverloadedStrings #-}

module TD.Query.ParseMarkdown where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.FormattedText as FormattedText
import qualified Utils as U

-- |
-- Parses Markdown entities in a human-friendly format, ignoring markup errors. Can be called synchronously
data ParseMarkdown = ParseMarkdown
  { -- | The text to parse. For example, "__italic__ ~~strikethrough~~ ||spoiler|| **bold** `code` ```pre``` __[italic__ text_url](telegram.org) __italic**bold italic__bold**"
    text :: Maybe FormattedText.FormattedText
  }
  deriving (Eq)

instance Show ParseMarkdown where
  show
    ParseMarkdown
      { text = text
      } =
      "ParseMarkdown"
        ++ U.cc
          [ U.p "text" text
          ]

instance T.ToJSON ParseMarkdown where
  toJSON
    ParseMarkdown
      { text = text
      } =
      A.object
        [ "@type" A..= T.String "parseMarkdown",
          "text" A..= text
        ]
