module TD.Data.NotificationSound where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.File as File

data NotificationSound
  = NotificationSound -- ^ Describes a notification sound in MP3 format
    { _id      :: Maybe Int       -- ^ Unique identifier of the notification sound
    , duration :: Maybe Int       -- ^ Duration of the sound, in seconds
    , date     :: Maybe Int       -- ^ Point in time (Unix timestamp) when the sound was created
    , title    :: Maybe T.Text    -- ^ Title of the notification sound
    , _data    :: Maybe T.Text    -- ^ Arbitrary data, defined while the sound was uploaded
    , sound    :: Maybe File.File -- ^ File containing the sound
    }
  deriving (Eq)

instance Show NotificationSound where
  show NotificationSound
    { _id      = _id_
    , duration = duration_
    , date     = date_
    , title    = title_
    , _data    = _data_
    , sound    = sound_
    }
      = "NotificationSound"
        ++ I.cc
        [ "_id"      `I.p` _id_
        , "duration" `I.p` duration_
        , "date"     `I.p` date_
        , "title"    `I.p` title_
        , "_data"    `I.p` _data_
        , "sound"    `I.p` sound_
        ]

instance AT.FromJSON NotificationSound where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "notificationSound" -> parseNotificationSound v
      _                   -> mempty
    
    where
      parseNotificationSound :: A.Value -> AT.Parser NotificationSound
      parseNotificationSound = A.withObject "NotificationSound" $ \o -> do
        _id_      <- fmap I.readInt64 <$> o A..:?  "id"
        duration_ <- o A..:?                       "duration"
        date_     <- o A..:?                       "date"
        title_    <- o A..:?                       "title"
        _data_    <- o A..:?                       "data"
        sound_    <- o A..:?                       "sound"
        pure $ NotificationSound
          { _id      = _id_
          , duration = duration_
          , date     = date_
          , title    = title_
          , _data    = _data_
          , sound    = sound_
          }

instance AT.ToJSON NotificationSound where
  toJSON NotificationSound
    { _id      = _id_
    , duration = duration_
    , date     = date_
    , title    = title_
    , _data    = _data_
    , sound    = sound_
    }
      = A.object
        [ "@type"    A..= AT.String "notificationSound"
        , "id"       A..= fmap I.writeInt64  _id_
        , "duration" A..= duration_
        , "date"     A..= date_
        , "title"    A..= title_
        , "data"     A..= _data_
        , "sound"    A..= sound_
        ]
