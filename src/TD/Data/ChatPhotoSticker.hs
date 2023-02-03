{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ChatPhotoSticker where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.BackgroundFill as BackgroundFill
import qualified TD.Data.ChatPhotoStickerType as ChatPhotoStickerType
import qualified Utils as U

-- |
data ChatPhotoSticker = -- | Information about the sticker, which was used to create the chat photo. The sticker is shown at the center of the photo and occupies at most 67% of it
  ChatPhotoSticker
  { -- | The fill to be used as background for the sticker; rotation angle in backgroundFillGradient isn't supported
    background_fill :: Maybe BackgroundFill.BackgroundFill,
    -- | Type of the sticker
    _type :: Maybe ChatPhotoStickerType.ChatPhotoStickerType
  }
  deriving (Eq)

instance Show ChatPhotoSticker where
  show
    ChatPhotoSticker
      { background_fill = background_fill_,
        _type = _type_
      } =
      "ChatPhotoSticker"
        ++ U.cc
          [ U.p "background_fill" background_fill_,
            U.p "_type" _type_
          ]

instance T.FromJSON ChatPhotoSticker where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatPhotoSticker" -> parseChatPhotoSticker v
      _ -> mempty
    where
      parseChatPhotoSticker :: A.Value -> T.Parser ChatPhotoSticker
      parseChatPhotoSticker = A.withObject "ChatPhotoSticker" $ \o -> do
        background_fill_ <- o A..:? "background_fill"
        _type_ <- o A..:? "type"
        return $ ChatPhotoSticker {background_fill = background_fill_, _type = _type_}
  parseJSON _ = mempty

instance T.ToJSON ChatPhotoSticker where
  toJSON
    ChatPhotoSticker
      { background_fill = background_fill_,
        _type = _type_
      } =
      A.object
        [ "@type" A..= T.String "chatPhotoSticker",
          "background_fill" A..= background_fill_,
          "type" A..= _type_
        ]
