module TD.Query.ViewTrendingStickerSets where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data ViewTrendingStickerSets -- ^ Informs the server that some trending sticker sets have been viewed by the user
  = ViewTrendingStickerSets
    { sticker_set_ids :: Maybe [Int] -- ^ Identifiers of viewed trending sticker sets
    }
  deriving (Eq)

instance Show ViewTrendingStickerSets where
  show
    ViewTrendingStickerSets
      { sticker_set_ids = sticker_set_ids_
      }
        = "ViewTrendingStickerSets"
          ++ I.cc
          [ "sticker_set_ids" `I.p` sticker_set_ids_
          ]

instance AT.ToJSON ViewTrendingStickerSets where
  toJSON
    ViewTrendingStickerSets
      { sticker_set_ids = sticker_set_ids_
      }
        = A.object
          [ "@type"           A..= AT.String "viewTrendingStickerSets"
          , "sticker_set_ids" A..= fmap (fmap I.writeInt64 ) sticker_set_ids_
          ]
