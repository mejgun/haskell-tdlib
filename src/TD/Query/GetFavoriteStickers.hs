module TD.Query.GetFavoriteStickers
  (GetFavoriteStickers(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

data GetFavoriteStickers -- ^ Returns favorite stickers
  = GetFavoriteStickers
  deriving (Eq)

instance Show GetFavoriteStickers where
  show
    GetFavoriteStickers
        = "GetFavoriteStickers"

instance AT.ToJSON GetFavoriteStickers where
  toJSON
    GetFavoriteStickers
        = A.object
          [ "@type" A..= AT.String "getFavoriteStickers"
          ]

