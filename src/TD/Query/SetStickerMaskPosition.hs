module TD.Query.SetStickerMaskPosition where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputFile as InputFile
import qualified TD.Data.MaskPosition as MaskPosition

data SetStickerMaskPosition -- ^ Changes the mask position of a mask sticker; for bots only. The sticker must belong to a mask sticker set created by the bot
  = SetStickerMaskPosition
    { sticker       :: Maybe InputFile.InputFile       -- ^ Sticker
    , mask_position :: Maybe MaskPosition.MaskPosition -- ^ Position where the mask is placed; pass null to remove mask position
    }
  deriving (Eq)

instance Show SetStickerMaskPosition where
  show
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
