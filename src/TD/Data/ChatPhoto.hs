module TD.Data.ChatPhoto
  (ChatPhoto(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Minithumbnail as Minithumbnail
import qualified TD.Data.PhotoSize as PhotoSize
import qualified TD.Data.AnimatedChatPhoto as AnimatedChatPhoto
import qualified TD.Data.ChatPhotoSticker as ChatPhotoSticker

data ChatPhoto
  = ChatPhoto -- ^ Describes a chat or user profile photo
    { _id             :: Maybe Int                                 -- ^ Unique photo identifier
    , added_date      :: Maybe Int                                 -- ^ Point in time (Unix timestamp) when the photo has been added
    , minithumbnail   :: Maybe Minithumbnail.Minithumbnail         -- ^ Photo minithumbnail; may be null
    , sizes           :: Maybe [PhotoSize.PhotoSize]               -- ^ Available variants of the photo in JPEG format, in different size
    , animation       :: Maybe AnimatedChatPhoto.AnimatedChatPhoto -- ^ A big (up to 1280x1280) animated variant of the photo in MPEG4 format; may be null
    , small_animation :: Maybe AnimatedChatPhoto.AnimatedChatPhoto -- ^ A small (160x160) animated variant of the photo in MPEG4 format; may be null even the big animation is available
    , sticker         :: Maybe ChatPhotoSticker.ChatPhotoSticker   -- ^ Sticker-based version of the chat photo; may be null
    }
  deriving (Eq, Show)

instance I.ShortShow ChatPhoto where
  shortShow ChatPhoto
    { _id             = _id_
    , added_date      = added_date_
    , minithumbnail   = minithumbnail_
    , sizes           = sizes_
    , animation       = animation_
    , small_animation = small_animation_
    , sticker         = sticker_
    }
      = "ChatPhoto"
        ++ I.cc
        [ "_id"             `I.p` _id_
        , "added_date"      `I.p` added_date_
        , "minithumbnail"   `I.p` minithumbnail_
        , "sizes"           `I.p` sizes_
        , "animation"       `I.p` animation_
        , "small_animation" `I.p` small_animation_
        , "sticker"         `I.p` sticker_
        ]

instance AT.FromJSON ChatPhoto where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatPhoto" -> parseChatPhoto v
      _           -> mempty
    
    where
      parseChatPhoto :: A.Value -> AT.Parser ChatPhoto
      parseChatPhoto = A.withObject "ChatPhoto" $ \o -> do
        _id_             <- fmap I.readInt64 <$> o A..:?  "id"
        added_date_      <- o A..:?                       "added_date"
        minithumbnail_   <- o A..:?                       "minithumbnail"
        sizes_           <- o A..:?                       "sizes"
        animation_       <- o A..:?                       "animation"
        small_animation_ <- o A..:?                       "small_animation"
        sticker_         <- o A..:?                       "sticker"
        pure $ ChatPhoto
          { _id             = _id_
          , added_date      = added_date_
          , minithumbnail   = minithumbnail_
          , sizes           = sizes_
          , animation       = animation_
          , small_animation = small_animation_
          , sticker         = sticker_
          }
  parseJSON _ = mempty

