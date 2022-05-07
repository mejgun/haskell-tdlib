{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.NotificationSound where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.File as File
import qualified Utils as U

data NotificationSound = -- | Describes a notification sound in MP3 format
  NotificationSound
  { -- | File containing the sound
    sound :: Maybe File.File,
    -- | Arbitrary data, defined while the sound was uploaded
    _data :: Maybe String,
    -- | Title of the notification sound
    title :: Maybe String,
    -- | Point in time (Unix timestamp) when the sound was created
    date :: Maybe Int,
    -- | Duration of the sound, in seconds
    duration :: Maybe Int,
    -- | Unique identifier of the notification sound
    _id :: Maybe Int
  }
  deriving (Eq)

instance Show NotificationSound where
  show
    NotificationSound
      { sound = sound,
        _data = _data,
        title = title,
        date = date,
        duration = duration,
        _id = _id
      } =
      "NotificationSound"
        ++ U.cc
          [ U.p "sound" sound,
            U.p "_data" _data,
            U.p "title" title,
            U.p "date" date,
            U.p "duration" duration,
            U.p "_id" _id
          ]

instance T.FromJSON NotificationSound where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "notificationSound" -> parseNotificationSound v
      _ -> fail ""
    where
      parseNotificationSound :: A.Value -> T.Parser NotificationSound
      parseNotificationSound = A.withObject "NotificationSound" $ \o -> do
        sound_ <- o A..:? "sound"
        _data_ <- o A..:? "data"
        title_ <- o A..:? "title"
        date_ <- mconcat [o A..:? "date", U.rm <$> (o A..: "date" :: T.Parser String)] :: T.Parser (Maybe Int)
        duration_ <- mconcat [o A..:? "duration", U.rm <$> (o A..: "duration" :: T.Parser String)] :: T.Parser (Maybe Int)
        _id_ <- mconcat [o A..:? "id", U.rm <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ NotificationSound {sound = sound_, _data = _data_, title = title_, date = date_, duration = duration_, _id = _id_}
  parseJSON _ = fail ""

instance T.ToJSON NotificationSound where
  toJSON
    NotificationSound
      { sound = sound,
        _data = _data,
        title = title,
        date = date,
        duration = duration,
        _id = _id
      } =
      A.object
        [ "@type" A..= T.String "notificationSound",
          "sound" A..= sound,
          "data" A..= _data,
          "title" A..= title,
          "date" A..= date,
          "duration" A..= duration,
          "id" A..= _id
        ]
