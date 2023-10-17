module TD.Data.Notification
  (Notification(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.NotificationType as NotificationType

data Notification
  = Notification -- ^ Contains information about a notification
    { _id       :: Maybe Int                               -- ^ Unique persistent identifier of this notification
    , date      :: Maybe Int                               -- ^ Notification date
    , is_silent :: Maybe Bool                              -- ^ True, if the notification was explicitly sent without sound
    , _type     :: Maybe NotificationType.NotificationType -- ^ Notification type
    }
  deriving (Eq, Show)

instance I.ShortShow Notification where
  shortShow Notification
    { _id       = _id_
    , date      = date_
    , is_silent = is_silent_
    , _type     = _type_
    }
      = "Notification"
        ++ I.cc
        [ "_id"       `I.p` _id_
        , "date"      `I.p` date_
        , "is_silent" `I.p` is_silent_
        , "_type"     `I.p` _type_
        ]

instance AT.FromJSON Notification where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "notification" -> parseNotification v
      _              -> mempty
    
    where
      parseNotification :: A.Value -> AT.Parser Notification
      parseNotification = A.withObject "Notification" $ \o -> do
        _id_       <- o A..:?  "id"
        date_      <- o A..:?  "date"
        is_silent_ <- o A..:?  "is_silent"
        _type_     <- o A..:?  "type"
        pure $ Notification
          { _id       = _id_
          , date      = date_
          , is_silent = is_silent_
          , _type     = _type_
          }
  parseJSON _ = mempty

