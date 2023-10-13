module TD.Query.SetStickerPositionInSet
  (SetStickerPositionInSet(..)
  , defaultSetStickerPositionInSet
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputFile as InputFile

-- | Changes the position of a sticker in the set to which it belongs; for bots only. The sticker set must have been created by the bot
data SetStickerPositionInSet
  = SetStickerPositionInSet
    { sticker  :: Maybe InputFile.InputFile -- ^ Sticker
    , position :: Maybe Int                 -- ^ New position of the sticker in the set, 0-based
    }
  deriving (Eq)

instance Show SetStickerPositionInSet where
  show
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

