{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.NotificationSound where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.File as File
import qualified Utils as U

-- |
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
      { sound = sound_,
        _data = _data_,
        title = title_,
        date = date_,
        duration = duration_,
        _id = _id_
      } =
      "NotificationSound"
        ++ U.cc
          [ U.p "sound" sound_,
            U.p "_data" _data_,
            U.p "title" title_,
            U.p "date" date_,
            U.p "duration" duration_,
            U.p "_id" _id_
          ]

instance T.FromJSON NotificationSound where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "notificationSound" -> parseNotificationSound v
      _ -> mempty
    where
      parseNotificationSound :: A.Value -> T.Parser NotificationSound
      parseNotificationSound = A.withObject "NotificationSound" $ \o -> do
        sound_ <- o A..:? "sound"
        _data_ <- o A..:? "data"
        title_ <- o A..:? "title"
        date_ <- o A..:? "date"
        duration_ <- o A..:? "duration"
        _id_ <- U.rm <$> (o A..: "id" :: T.Parser String) :: T.Parser (Maybe Int)
        return $ NotificationSound {sound = sound_, _data = _data_, title = title_, date = date_, duration = duration_, _id = _id_}
  parseJSON _ = mempty

instance T.ToJSON NotificationSound where
  toJSON
    NotificationSound
      { sound = sound_,
        _data = _data_,
        title = title_,
        date = date_,
        duration = duration_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "notificationSound",
          "sound" A..= sound_,
          "data" A..= _data_,
          "title" A..= title_,
          "date" A..= date_,
          "duration" A..= duration_,
          "id" A..= _id_
        ]
