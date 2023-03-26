{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetTextEntities where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns all entities (mentions, hashtags, cashtags, bot commands, bank card numbers, URLs, and email addresses) found in the text. Can be called synchronously @text The text in which to look for entities
data GetTextEntities = GetTextEntities
  { -- |
    text :: Maybe String
  }
  deriving (Eq)

instance Show GetTextEntities where
  show
    GetTextEntities
      { text = text_
      } =
      "GetTextEntities"
        ++ U.cc
          [ U.p "text" text_
          ]

instance T.ToJSON GetTextEntities where
  toJSON
    GetTextEntities
      { text = text_
      } =
      A.object
        [ "@type" A..= T.String "getTextEntities",
          "text" A..= text_
        ]
