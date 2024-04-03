module TD.Query.GetOwnedStickerSets
  (GetOwnedStickerSets(..)
  , defaultGetOwnedStickerSets
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns sticker sets owned by the current user. Returns 'TD.Data.StickerSets.StickerSets'
data GetOwnedStickerSets
  = GetOwnedStickerSets
    { offset_sticker_set_id :: Maybe Int -- ^ Identifier of the sticker set from which to return owned sticker sets; use 0 to get results from the beginning
    , limit                 :: Maybe Int -- ^ The maximum number of sticker sets to be returned; must be positive and can't be greater than 100. For optimal performance, the number of returned objects is chosen by TDLib and can be smaller than the specified limit
    }
  deriving (Eq, Show)

instance I.ShortShow GetOwnedStickerSets where
  shortShow
    GetOwnedStickerSets
      { offset_sticker_set_id = offset_sticker_set_id_
      , limit                 = limit_
      }
        = "GetOwnedStickerSets"
          ++ I.cc
          [ "offset_sticker_set_id" `I.p` offset_sticker_set_id_
          , "limit"                 `I.p` limit_
          ]

instance AT.ToJSON GetOwnedStickerSets where
  toJSON
    GetOwnedStickerSets
      { offset_sticker_set_id = offset_sticker_set_id_
      , limit                 = limit_
      }
        = A.object
          [ "@type"                 A..= AT.String "getOwnedStickerSets"
          , "offset_sticker_set_id" A..= fmap I.writeInt64  offset_sticker_set_id_
          , "limit"                 A..= limit_
          ]

defaultGetOwnedStickerSets :: GetOwnedStickerSets
defaultGetOwnedStickerSets =
  GetOwnedStickerSets
    { offset_sticker_set_id = Nothing
    , limit                 = Nothing
    }

