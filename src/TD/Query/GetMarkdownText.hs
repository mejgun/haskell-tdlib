{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetMarkdownText where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.FormattedText as FormattedText
import qualified Utils as U

-- |
-- Replaces text entities with Markdown formatting in a human-friendly format. Entities that can't be represented in Markdown unambiguously are kept as is. Can be called synchronously @text The text
data GetMarkdownText = GetMarkdownText
  { -- |
    text :: Maybe FormattedText.FormattedText
  }
  deriving (Eq)

instance Show GetMarkdownText where
  show
    GetMarkdownText
      { text = text_
      } =
      "GetMarkdownText"
        ++ U.cc
          [ U.p "text" text_
          ]

instance T.ToJSON GetMarkdownText where
  toJSON
    GetMarkdownText
      { text = text_
      } =
      A.object
        [ "@type" A..= T.String "getMarkdownText",
          "text" A..= text_
        ]
