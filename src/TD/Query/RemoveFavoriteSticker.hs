{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.RemoveFavoriteSticker where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InputFile as InputFile
import qualified Utils as U

-- |
-- Removes a sticker from the list of favorite stickers @sticker Sticker file to delete from the list
data RemoveFavoriteSticker = RemoveFavoriteSticker
  { -- |
    sticker :: Maybe InputFile.InputFile
  }
  deriving (Eq)

instance Show RemoveFavoriteSticker where
  show
    RemoveFavoriteSticker
      { sticker = sticker_
      } =
      "RemoveFavoriteSticker"
        ++ U.cc
          [ U.p "sticker" sticker_
          ]

instance T.ToJSON RemoveFavoriteSticker where
  toJSON
    RemoveFavoriteSticker
      { sticker = sticker_
      } =
      A.object
        [ "@type" A..= T.String "removeFavoriteSticker",
          "sticker" A..= sticker_
        ]
