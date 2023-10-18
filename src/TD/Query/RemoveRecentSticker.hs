module TD.Query.RemoveRecentSticker
  (RemoveRecentSticker(..)
  , defaultRemoveRecentSticker
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputFile as InputFile

-- | Removes a sticker from the list of recently used stickers. Returns 'TD.Data.Ok.Ok'
data RemoveRecentSticker
  = RemoveRecentSticker
    { is_attached :: Maybe Bool                -- ^ Pass true to remove the sticker from the list of stickers recently attached to photo or video files; pass false to remove the sticker from the list of recently sent stickers
    , sticker     :: Maybe InputFile.InputFile -- ^ Sticker file to delete
    }
  deriving (Eq, Show)

instance I.ShortShow RemoveRecentSticker where
  shortShow
    RemoveRecentSticker
      { is_attached = is_attached_
      , sticker     = sticker_
      }
        = "RemoveRecentSticker"
          ++ I.cc
          [ "is_attached" `I.p` is_attached_
          , "sticker"     `I.p` sticker_
          ]

instance AT.ToJSON RemoveRecentSticker where
  toJSON
    RemoveRecentSticker
      { is_attached = is_attached_
      , sticker     = sticker_
      }
        = A.object
          [ "@type"       A..= AT.String "removeRecentSticker"
          , "is_attached" A..= is_attached_
          , "sticker"     A..= sticker_
          ]

defaultRemoveRecentSticker :: RemoveRecentSticker
defaultRemoveRecentSticker =
  RemoveRecentSticker
    { is_attached = Nothing
    , sticker     = Nothing
    }

