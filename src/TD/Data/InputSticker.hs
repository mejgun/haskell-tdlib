{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.InputSticker where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InputFile as InputFile
import qualified TD.Data.StickerType as StickerType
import qualified Utils as U

-- |
data InputSticker = -- | A sticker to be added to a sticker set
  InputSticker
  { -- | Sticker type
    _type :: Maybe StickerType.StickerType,
    -- | Emojis corresponding to the sticker
    emojis :: Maybe String,
    -- | File with the sticker; must fit in a 512x512 square. For WEBP stickers and masks the file must be in PNG format, which will be converted to WEBP server-side. Otherwise, the file must be local or uploaded within a week. See https://core.telegram.org/animated_stickers#technical-requirements for technical requirements
    sticker :: Maybe InputFile.InputFile
  }
  deriving (Eq)

instance Show InputSticker where
  show
    InputSticker
      { _type = _type_,
        emojis = emojis_,
        sticker = sticker_
      } =
      "InputSticker"
        ++ U.cc
          [ U.p "_type" _type_,
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
        _type_ <- o A..:? "type"
        emojis_ <- o A..:? "emojis"
        sticker_ <- o A..:? "sticker"
        return $ InputSticker {_type = _type_, emojis = emojis_, sticker = sticker_}
  parseJSON _ = mempty

instance T.ToJSON InputSticker where
  toJSON
    InputSticker
      { _type = _type_,
        emojis = emojis_,
        sticker = sticker_
      } =
      A.object
        [ "@type" A..= T.String "inputSticker",
          "type" A..= _type_,
          "emojis" A..= emojis_,
          "sticker" A..= sticker_
        ]
