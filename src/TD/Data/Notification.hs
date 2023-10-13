module TD.Data.Notification
  ( Notification(..)    
  , defaultNotification 
  ) where

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
  deriving (Eq)

instance Show Notification where
  show Notification
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

instance AT.ToJSON Notification where
  toJSON Notification
    { _id       = _id_
    , date      = date_
    , is_silent = is_silent_
    , _type     = _type_
    }
      = A.object
        [ "@type"     A..= AT.String "notification"
        , "id"        A..= _id_
        , "date"      A..= date_
        , "is_silent" A..= is_silent_
        , "type"      A..= _type_
        ]

defaultNotification :: Notification
defaultNotification =
  Notification
    { _id       = Nothing
    , date      = Nothing
    , is_silent = Nothing
    , _type     = Nothing
    }

