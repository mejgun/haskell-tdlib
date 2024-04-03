module TD.Query.AddRecentSticker
  (AddRecentSticker(..)
  , defaultAddRecentSticker
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputFile as InputFile

-- | Manually adds a new sticker to the list of recently used stickers. The new sticker is added to the top of the list. If the sticker was already in the list, it is removed from the list first. Only stickers belonging to a sticker set or in WEBP or WEBM format can be added to this list. Emoji stickers can't be added to recent stickers. Returns 'TD.Data.Stickers.Stickers'
data AddRecentSticker
  = AddRecentSticker
    { is_attached :: Maybe Bool                -- ^ Pass true to add the sticker to the list of stickers recently attached to photo or video files; pass false to add the sticker to the list of recently sent stickers
    , sticker     :: Maybe InputFile.InputFile -- ^ Sticker file to add
    }
  deriving (Eq, Show)

instance I.ShortShow AddRecentSticker where
  shortShow
    AddRecentSticker
      { is_attached = is_attached_
      , sticker     = sticker_
      }
        = "AddRecentSticker"
          ++ I.cc
          [ "is_attached" `I.p` is_attached_
          , "sticker"     `I.p` sticker_
          ]

instance AT.ToJSON AddRecentSticker where
  toJSON
    AddRecentSticker
      { is_attached = is_attached_
      , sticker     = sticker_
      }
        = A.object
          [ "@type"       A..= AT.String "addRecentSticker"
          , "is_attached" A..= is_attached_
          , "sticker"     A..= sticker_
          ]

defaultAddRecentSticker :: AddRecentSticker
defaultAddRecentSticker =
  AddRecentSticker
    { is_attached = Nothing
    , sticker     = Nothing
    }

