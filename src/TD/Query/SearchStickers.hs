{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SearchStickers where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Searches for stickers from public sticker sets that correspond to a given emoji @emoji String representation of emoji; must be non-empty @limit The maximum number of stickers to be returned
data SearchStickers = SearchStickers
  { -- |
    limit :: Maybe Int,
    -- |
    emoji :: Maybe String
  }
  deriving (Eq)

instance Show SearchStickers where
  show
    SearchStickers
      { limit = limit,
        emoji = emoji
      } =
      "SearchStickers"
        ++ U.cc
          [ U.p "limit" limit,
            U.p "emoji" emoji
          ]

instance T.ToJSON SearchStickers where
  toJSON
    SearchStickers
      { limit = limit,
        emoji = emoji
      } =
      A.object
        [ "@type" A..= T.String "searchStickers",
          "limit" A..= limit,
          "emoji" A..= emoji
        ]
