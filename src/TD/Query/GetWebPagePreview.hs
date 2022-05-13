{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetWebPagePreview where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.FormattedText as FormattedText
import qualified Utils as U

-- |
-- Returns a web page preview by the text of the message. Do not call this function too often. Returns a 404 error if the web page has no preview @text Message text with formatting
data GetWebPagePreview = GetWebPagePreview
  { -- |
    text :: Maybe FormattedText.FormattedText
  }
  deriving (Eq)

instance Show GetWebPagePreview where
  show
    GetWebPagePreview
      { text = text_
      } =
      "GetWebPagePreview"
        ++ U.cc
          [ U.p "text" text_
          ]

instance T.ToJSON GetWebPagePreview where
  toJSON
    GetWebPagePreview
      { text = text_
      } =
      A.object
        [ "@type" A..= T.String "getWebPagePreview",
          "text" A..= text_
        ]
