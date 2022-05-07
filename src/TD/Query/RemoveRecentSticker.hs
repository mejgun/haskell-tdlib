{-# LANGUAGE OverloadedStrings #-}

module TD.Query.RemoveRecentSticker where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.InputFile as InputFile
import qualified Utils as U

-- |
-- Removes a sticker from the list of recently used stickers @is_attached Pass true to remove the sticker from the list of stickers recently attached to photo or video files; pass false to remove the sticker from the list of recently sent stickers @sticker Sticker file to delete
data RemoveRecentSticker = RemoveRecentSticker
  { -- |
    sticker :: Maybe InputFile.InputFile,
    -- |
    is_attached :: Maybe Bool
  }
  deriving (Eq)

instance Show RemoveRecentSticker where
  show
    RemoveRecentSticker
      { sticker = sticker,
        is_attached = is_attached
      } =
      "RemoveRecentSticker"
        ++ U.cc
          [ U.p "sticker" sticker,
            U.p "is_attached" is_attached
          ]

instance T.ToJSON RemoveRecentSticker where
  toJSON
    RemoveRecentSticker
      { sticker = sticker,
        is_attached = is_attached
      } =
      A.object
        [ "@type" A..= T.String "removeRecentSticker",
          "sticker" A..= sticker,
          "is_attached" A..= is_attached
        ]
