module TD.Query.SetStickerPositionInSet
  (SetStickerPositionInSet(..)
  , defaultSetStickerPositionInSet
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputFile as InputFile

-- | Changes the position of a sticker in the set to which it belongs. The sticker set must be owned by the current user. Returns 'TD.Data.Ok.Ok'
data SetStickerPositionInSet
  = SetStickerPositionInSet
    { sticker  :: Maybe InputFile.InputFile -- ^ Sticker
    , position :: Maybe Int                 -- ^ New position of the sticker in the set, 0-based
    }
  deriving (Eq, Show)

instance I.ShortShow SetStickerPositionInSet where
  shortShow
    SetStickerPositionInSet
      { sticker  = sticker_
      , position = position_
      }
        = "SetStickerPositionInSet"
          ++ I.cc
          [ "sticker"  `I.p` sticker_
          , "position" `I.p` position_
          ]

instance AT.ToJSON SetStickerPositionInSet where
  toJSON
    SetStickerPositionInSet
      { sticker  = sticker_
      , position = position_
      }
        = A.object
          [ "@type"    A..= AT.String "setStickerPositionInSet"
          , "sticker"  A..= sticker_
          , "position" A..= position_
          ]

defaultSetStickerPositionInSet :: SetStickerPositionInSet
defaultSetStickerPositionInSet =
  SetStickerPositionInSet
    { sticker  = Nothing
    , position = Nothing
    }

