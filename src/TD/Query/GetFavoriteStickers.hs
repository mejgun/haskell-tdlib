module TD.Query.GetFavoriteStickers where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

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
