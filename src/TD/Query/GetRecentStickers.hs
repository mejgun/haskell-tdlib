{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetRecentStickers where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns a list of recently used stickers @is_attached Pass true to return stickers and masks that were recently attached to photos or video files; pass false to return recently sent stickers
data GetRecentStickers = GetRecentStickers
  { -- |
    is_attached :: Maybe Bool
  }
  deriving (Eq)

instance Show GetRecentStickers where
  show
    GetRecentStickers
      { is_attached = is_attached
      } =
      "GetRecentStickers"
        ++ U.cc
          [ U.p "is_attached" is_attached
          ]

instance T.ToJSON GetRecentStickers where
  toJSON
    GetRecentStickers
      { is_attached = is_attached
      } =
      A.object
        [ "@type" A..= T.String "getRecentStickers",
          "is_attached" A..= is_attached
        ]
