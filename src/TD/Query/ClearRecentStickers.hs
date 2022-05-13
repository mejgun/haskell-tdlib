{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ClearRecentStickers where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Clears the list of recently used stickers @is_attached Pass true to clear the list of stickers recently attached to photo or video files; pass false to clear the list of recently sent stickers
data ClearRecentStickers = ClearRecentStickers
  { -- |
    is_attached :: Maybe Bool
  }
  deriving (Eq)

instance Show ClearRecentStickers where
  show
    ClearRecentStickers
      { is_attached = is_attached_
      } =
      "ClearRecentStickers"
        ++ U.cc
          [ U.p "is_attached" is_attached_
          ]

instance T.ToJSON ClearRecentStickers where
  toJSON
    ClearRecentStickers
      { is_attached = is_attached_
      } =
      A.object
        [ "@type" A..= T.String "clearRecentStickers",
          "is_attached" A..= is_attached_
        ]
