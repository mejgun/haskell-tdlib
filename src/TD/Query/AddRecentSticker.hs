{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.AddRecentSticker where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InputFile as InputFile
import qualified Utils as U

-- |
-- Manually adds a new sticker to the list of recently used stickers. The new sticker is added to the top of the list. If the sticker was already in the list, it is removed from the list first. Only stickers belonging to a sticker set can be added to this list
data AddRecentSticker = AddRecentSticker
  { -- |
    sticker :: Maybe InputFile.InputFile,
    -- | Pass true to add the sticker to the list of stickers recently attached to photo or video files; pass false to add the sticker to the list of recently sent stickers @sticker Sticker file to add
    is_attached :: Maybe Bool
  }
  deriving (Eq)

instance Show AddRecentSticker where
  show
    AddRecentSticker
      { sticker = sticker_,
        is_attached = is_attached_
      } =
      "AddRecentSticker"
        ++ U.cc
          [ U.p "sticker" sticker_,
            U.p "is_attached" is_attached_
          ]

instance T.ToJSON AddRecentSticker where
  toJSON
    AddRecentSticker
      { sticker = sticker_,
        is_attached = is_attached_
      } =
      A.object
        [ "@type" A..= T.String "addRecentSticker",
          "sticker" A..= sticker_,
          "is_attached" A..= is_attached_
        ]
