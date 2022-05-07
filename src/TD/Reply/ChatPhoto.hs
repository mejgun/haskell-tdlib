{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.ChatPhoto where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.AnimatedChatPhoto as AnimatedChatPhoto
import qualified TD.Reply.Minithumbnail as Minithumbnail
import qualified TD.Reply.PhotoSize as PhotoSize
import qualified Utils as U

data ChatPhoto = -- | Describes a chat or user profile photo
  ChatPhoto
  { -- | Animated variant of the photo in MPEG4 format; may be null
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
      { animation = animation,
        sizes = sizes,
        minithumbnail = minithumbnail,
        added_date = added_date,
        _id = _id
      } =
      "ChatPhoto"
        ++ U.cc
          [ U.p "animation" animation,
            U.p "sizes" sizes,
            U.p "minithumbnail" minithumbnail,
            U.p "added_date" added_date,
            U.p "_id" _id
          ]

instance T.FromJSON ChatPhoto where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatPhoto" -> parseChatPhoto v
      _ -> fail ""
    where
      parseChatPhoto :: A.Value -> T.Parser ChatPhoto
      parseChatPhoto = A.withObject "ChatPhoto" $ \o -> do
        animation_ <- o A..:? "animation"
        sizes_ <- o A..:? "sizes"
        minithumbnail_ <- o A..:? "minithumbnail"
        added_date_ <- mconcat [o A..:? "added_date", U.rm <$> (o A..: "added_date" :: T.Parser String)] :: T.Parser (Maybe Int)
        _id_ <- mconcat [o A..:? "id", U.rm <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ ChatPhoto {animation = animation_, sizes = sizes_, minithumbnail = minithumbnail_, added_date = added_date_, _id = _id_}
  parseJSON _ = fail ""

instance T.ToJSON ChatPhoto where
  toJSON
    ChatPhoto
      { animation = animation,
        sizes = sizes,
        minithumbnail = minithumbnail,
        added_date = added_date,
        _id = _id
      } =
      A.object
        [ "@type" A..= T.String "chatPhoto",
          "animation" A..= animation,
          "sizes" A..= sizes,
          "minithumbnail" A..= minithumbnail,
          "added_date" A..= added_date,
          "id" A..= _id
        ]
