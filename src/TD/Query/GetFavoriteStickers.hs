{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetFavoriteStickers where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns favorite stickers
data GetFavoriteStickers = GetFavoriteStickers
  {
  }
  deriving (Eq)

instance Show GetFavoriteStickers where
  show GetFavoriteStickers =
    "GetFavoriteStickers"
      ++ U.cc
        []

instance T.ToJSON GetFavoriteStickers where
  toJSON GetFavoriteStickers =
    A.object
      [ "@type" A..= T.String "getFavoriteStickers"
      ]
