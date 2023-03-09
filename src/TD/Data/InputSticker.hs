{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.InputSticker where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InputFile as InputFile
import qualified TD.Data.MaskPosition as MaskPosition
import qualified Utils as U

-- |
data InputSticker = -- | A sticker to be added to a sticker set
  InputSticker
  { -- | List of up to 20 keywords with total length up to 64 characters, which can be used to find the sticker
    keywords :: Maybe [String],
    -- | Position where the mask is placed; pass null if not specified
    mask_position :: Maybe MaskPosition.MaskPosition,
    -- | String with 1-20 emoji corresponding to the sticker
    emojis :: Maybe String,
    -- | File with the sticker; must fit in a 512x512 square. For WEBP stickers the file must be in WEBP or PNG format, which will be converted to WEBP server-side.
    -- See https://core.telegram.org/animated_stickers#technical-requirements for technical requirements
    sticker :: Maybe InputFile.InputFile
  }
  deriving (Eq)

instance Show InputSticker where
  show
    InputSticker
      { keywords = keywords_,
        mask_position = mask_position_,
        emojis = emojis_,
        sticker = sticker_
      } =
      "InputSticker"
        ++ U.cc
          [ U.p "keywords" keywords_,
            U.p "mask_position" mask_position_,
            U.p "emojis" emojis_,
            U.p "sticker" sticker_
          ]

instance T.FromJSON InputSticker where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "inputSticker" -> parseInputSticker v
      _ -> mempty
    where
      parseInputSticker :: A.Value -> T.Parser InputSticker
      parseInputSticker = A.withObject "InputSticker" $ \o -> do
        keywords_ <- o A..:? "keywords"
        mask_position_ <- o A..:? "mask_position"
        emojis_ <- o A..:? "emojis"
        sticker_ <- o A..:? "sticker"
        return $ InputSticker {keywords = keywords_, mask_position = mask_position_, emojis = emojis_, sticker = sticker_}
  parseJSON _ = mempty

instance T.ToJSON InputSticker where
  toJSON
    InputSticker
      { keywords = keywords_,
        mask_position = mask_position_,
        emojis = emojis_,
        sticker = sticker_
      } =
      A.object
        [ "@type" A..= T.String "inputSticker",
          "keywords" A..= keywords_,
          "mask_position" A..= mask_position_,
          "emojis" A..= emojis_,
          "sticker" A..= sticker_
        ]
