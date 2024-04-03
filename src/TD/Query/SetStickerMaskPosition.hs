module TD.Query.SetStickerMaskPosition
  (SetStickerMaskPosition(..)
  , defaultSetStickerMaskPosition
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputFile as InputFile
import qualified TD.Data.MaskPosition as MaskPosition

-- | Changes the mask position of a mask sticker. The sticker must belong to a mask sticker set that is owned by the current user. Returns 'TD.Data.Ok.Ok'
data SetStickerMaskPosition
  = SetStickerMaskPosition
    { sticker       :: Maybe InputFile.InputFile       -- ^ Sticker
    , mask_position :: Maybe MaskPosition.MaskPosition -- ^ Position where the mask is placed; pass null to remove mask position
    }
  deriving (Eq, Show)

instance I.ShortShow SetStickerMaskPosition where
  shortShow
    SetStickerMaskPosition
      { sticker       = sticker_
      , mask_position = mask_position_
      }
        = "SetStickerMaskPosition"
          ++ I.cc
          [ "sticker"       `I.p` sticker_
          , "mask_position" `I.p` mask_position_
          ]

instance AT.ToJSON SetStickerMaskPosition where
  toJSON
    SetStickerMaskPosition
      { sticker       = sticker_
      , mask_position = mask_position_
      }
        = A.object
          [ "@type"         A..= AT.String "setStickerMaskPosition"
          , "sticker"       A..= sticker_
          , "mask_position" A..= mask_position_
          ]

defaultSetStickerMaskPosition :: SetStickerMaskPosition
defaultSetStickerMaskPosition =
  SetStickerMaskPosition
    { sticker       = Nothing
    , mask_position = Nothing
    }

