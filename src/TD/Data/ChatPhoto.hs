{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ChatPhoto where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.AnimatedChatPhoto as AnimatedChatPhoto
import qualified TD.Data.ChatPhotoSticker as ChatPhotoSticker
import qualified TD.Data.Minithumbnail as Minithumbnail
import qualified TD.Data.PhotoSize as PhotoSize
import qualified Utils as U

-- |
data ChatPhoto = -- | Describes a chat or user profile photo
  ChatPhoto
  { -- | Sticker-based version of the chat photo; may be null
    sticker :: Maybe ChatPhotoSticker.ChatPhotoSticker,
    -- | A small (160x160) animated variant of the photo in MPEG4 format; may be null even the big animation is available
    small_animation :: Maybe AnimatedChatPhoto.AnimatedChatPhoto,
    -- | A big (up to 1280x1280) animated variant of the photo in MPEG4 format; may be null
    animation :: Maybe AnimatedChatPhoto.AnimatedChatPhoto,
    -- | Available variants of the photo in JPEG format, in different size
    sizes :: Maybe [PhotoSize.PhotoSize],
    -- | Photo minithumbnail; may be null
    minithumbnail :: Maybe Minithumbnail.Minithumbnail,
    -- | Point in time (Unix timestamp) when the photo has been added
    added_date :: Maybe Int,
    -- | Unique photo identifier
    _id :: Maybe Int
  }
  deriving (Eq)

instance Show ChatPhoto where
  show
    ChatPhoto
      { sticker = sticker_,
        small_animation = small_animation_,
        animation = animation_,
        sizes = sizes_,
        minithumbnail = minithumbnail_,
        added_date = added_date_,
        _id = _id_
      } =
      "ChatPhoto"
        ++ U.cc
          [ U.p "sticker" sticker_,
            U.p "small_animation" small_animation_,
            U.p "animation" animation_,
            U.p "sizes" sizes_,
            U.p "minithumbnail" minithumbnail_,
            U.p "added_date" added_date_,
            U.p "_id" _id_
          ]

instance T.FromJSON ChatPhoto where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatPhoto" -> parseChatPhoto v
      _ -> mempty
    where
      parseChatPhoto :: A.Value -> T.Parser ChatPhoto
      parseChatPhoto = A.withObject "ChatPhoto" $ \o -> do
        sticker_ <- o A..:? "sticker"
        small_animation_ <- o A..:? "small_animation"
        animation_ <- o A..:? "animation"
        sizes_ <- o A..:? "sizes"
        minithumbnail_ <- o A..:? "minithumbnail"
        added_date_ <- o A..:? "added_date"
        _id_ <- U.rm <$> (o A..:? "id" :: T.Parser (Maybe String)) :: T.Parser (Maybe Int)
        return $ ChatPhoto {sticker = sticker_, small_animation = small_animation_, animation = animation_, sizes = sizes_, minithumbnail = minithumbnail_, added_date = added_date_, _id = _id_}
  parseJSON _ = mempty

instance T.ToJSON ChatPhoto where
  toJSON
    ChatPhoto
      { sticker = sticker_,
        small_animation = small_animation_,
        animation = animation_,
        sizes = sizes_,
        minithumbnail = minithumbnail_,
        added_date = added_date_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "chatPhoto",
          "sticker" A..= sticker_,
          "small_animation" A..= small_animation_,
          "animation" A..= animation_,
          "sizes" A..= sizes_,
          "minithumbnail" A..= minithumbnail_,
          "added_date" A..= added_date_,
          "id" A..= U.toS _id_
        ]
