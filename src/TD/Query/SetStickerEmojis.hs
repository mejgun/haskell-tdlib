module TD.Query.SetStickerEmojis
  (SetStickerEmojis(..)
  , defaultSetStickerEmojis
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputFile as InputFile
import qualified Data.Text as T

data SetStickerEmojis -- ^ Changes the list of emoji corresponding to a sticker; for bots only. The sticker must belong to a regular or custom emoji sticker set created by the bot
  = SetStickerEmojis
    { sticker :: Maybe InputFile.InputFile -- ^ Sticker
    , emojis  :: Maybe T.Text              -- ^ New string with 1-20 emoji corresponding to the sticker
    }
  deriving (Eq)

instance Show SetStickerEmojis where
  show
    SetStickerEmojis
      { sticker = sticker_
      , emojis  = emojis_
      }
        = "SetStickerEmojis"
          ++ I.cc
          [ "sticker" `I.p` sticker_
          , "emojis"  `I.p` emojis_
          ]

instance AT.ToJSON SetStickerEmojis where
  toJSON
    SetStickerEmojis
      { sticker = sticker_
      , emojis  = emojis_
      }
        = A.object
          [ "@type"   A..= AT.String "setStickerEmojis"
          , "sticker" A..= sticker_
          , "emojis"  A..= emojis_
          ]

defaultSetStickerEmojis :: SetStickerEmojis
defaultSetStickerEmojis =
  SetStickerEmojis
    { sticker = Nothing
    , emojis  = Nothing
    }

