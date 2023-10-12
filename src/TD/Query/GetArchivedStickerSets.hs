module TD.Query.GetArchivedStickerSets where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.StickerType as StickerType

data GetArchivedStickerSets -- ^ Returns a list of archived sticker sets
  = GetArchivedStickerSets
    { sticker_type          :: Maybe StickerType.StickerType -- ^ Type of the sticker sets to return
    , offset_sticker_set_id :: Maybe Int                     -- ^ Identifier of the sticker set from which to return the result
    , limit                 :: Maybe Int                     -- ^ The maximum number of sticker sets to return; up to 100
    }
  deriving (Eq)

instance Show GetArchivedStickerSets where
  show
    GetArchivedStickerSets
      { sticker_type          = sticker_type_
      , offset_sticker_set_id = offset_sticker_set_id_
      , limit                 = limit_
      }
        = "GetArchivedStickerSets"
          ++ I.cc
          [ "sticker_type"          `I.p` sticker_type_
          , "offset_sticker_set_id" `I.p` offset_sticker_set_id_
          , "limit"                 `I.p` limit_
          ]

instance AT.ToJSON GetArchivedStickerSets where
  toJSON
    GetArchivedStickerSets
      { sticker_type          = sticker_type_
      , offset_sticker_set_id = offset_sticker_set_id_
      , limit                 = limit_
      }
        = A.object
          [ "@type"                 A..= AT.String "getArchivedStickerSets"
          , "sticker_type"          A..= sticker_type_
          , "offset_sticker_set_id" A..= fmap I.writeInt64  offset_sticker_set_id_
          , "limit"                 A..= limit_
          ]
