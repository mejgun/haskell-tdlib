{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetTextEntities where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns all entities (mentions, hashtags, cashtags, bot commands, bank card numbers, URLs, and email addresses) contained in the text. Can be called synchronously @text The text in which to look for entites
data GetTextEntities = GetTextEntities
  { -- |
    text :: Maybe String
  }
  deriving (Eq)

instance Show GetTextEntities where
  show
    GetTextEntities
      { text = text
      } =
      "GetTextEntities"
        ++ U.cc
          [ U.p "text" text
          ]

instance T.ToJSON GetTextEntities where
  toJSON
    GetTextEntities
      { text = text
      } =
      A.object
        [ "@type" A..= T.String "getTextEntities",
          "text" A..= text
        ]
