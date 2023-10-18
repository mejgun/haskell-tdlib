module TD.Query.GetFavoriteStickers
  (GetFavoriteStickers(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns favorite stickers. Returns 'TD.Data.Stickers.Stickers'
data GetFavoriteStickers
  = GetFavoriteStickers
  deriving (Eq, Show)

instance I.ShortShow GetFavoriteStickers where
  shortShow
    GetFavoriteStickers
        = "GetFavoriteStickers"

instance AT.ToJSON GetFavoriteStickers where
  toJSON
    GetFavoriteStickers
        = A.object
          [ "@type" A..= AT.String "getFavoriteStickers"
          ]

