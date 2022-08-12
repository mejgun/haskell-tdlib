{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.AddFavoriteSticker where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InputFile as InputFile
import qualified Utils as U

-- |
-- Adds a new sticker to the list of favorite stickers. The new sticker is added to the top of the list. If the sticker was already in the list, it is removed from the list first. Only stickers belonging to a sticker set can be added to this list. Emoji stickers can't be added to favorite stickers
data AddFavoriteSticker = AddFavoriteSticker
  { -- | Sticker file to add
    sticker :: Maybe InputFile.InputFile
  }
  deriving (Eq)

instance Show AddFavoriteSticker where
  show
    AddFavoriteSticker
      { sticker = sticker_
      } =
      "AddFavoriteSticker"
        ++ U.cc
          [ U.p "sticker" sticker_
          ]

instance T.ToJSON AddFavoriteSticker where
  toJSON
    AddFavoriteSticker
      { sticker = sticker_
      } =
      A.object
        [ "@type" A..= T.String "addFavoriteSticker",
          "sticker" A..= sticker_
        ]
