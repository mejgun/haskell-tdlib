module TD.Query.SetStickerKeywords
  (SetStickerKeywords(..)
  , defaultSetStickerKeywords
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputFile as InputFile
import qualified Data.Text as T

data SetStickerKeywords -- ^ Changes the list of keywords of a sticker; for bots only. The sticker must belong to a regular or custom emoji sticker set created by the bot
  = SetStickerKeywords
    { sticker  :: Maybe InputFile.InputFile -- ^ Sticker
    , keywords :: Maybe [T.Text]            -- ^ List of up to 20 keywords with total length up to 64 characters, which can be used to find the sticker
    }
  deriving (Eq)

instance Show SetStickerKeywords where
  show
    SetStickerKeywords
      { sticker  = sticker_
      , keywords = keywords_
      }
        = "SetStickerKeywords"
          ++ I.cc
          [ "sticker"  `I.p` sticker_
          , "keywords" `I.p` keywords_
          ]

instance AT.ToJSON SetStickerKeywords where
  toJSON
    SetStickerKeywords
      { sticker  = sticker_
      , keywords = keywords_
      }
        = A.object
          [ "@type"    A..= AT.String "setStickerKeywords"
          , "sticker"  A..= sticker_
          , "keywords" A..= keywords_
          ]

defaultSetStickerKeywords :: SetStickerKeywords
defaultSetStickerKeywords =
  SetStickerKeywords
    { sticker  = Nothing
    , keywords = Nothing
    }

