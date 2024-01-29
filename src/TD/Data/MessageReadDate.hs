module TD.Data.MessageReadDate
  (MessageReadDate(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes read date of a recent outgoing message in a private chat
data MessageReadDate
  = MessageReadDateRead -- ^ Contains read date of the message
    { read_date :: Maybe Int -- ^ Point in time (Unix timestamp) when the message was read by the other user
    }
  | MessageReadDateUnread -- ^ The message is unread yet
  | MessageReadDateTooOld -- ^ The message is too old to get read date
  | MessageReadDateUserPrivacyRestricted -- ^ The read date is unknown due to privacy settings of the other user
  | MessageReadDateMyPrivacyRestricted -- ^ The read date is unknown due to privacy settings of the current user, but will be known if the user subscribes to Telegram Premium
  deriving (Eq, Show)

instance I.ShortShow MessageReadDate where
  shortShow MessageReadDateRead
    { read_date = read_date_
    }
      = "MessageReadDateRead"
        ++ I.cc
        [ "read_date" `I.p` read_date_
        ]
  shortShow MessageReadDateUnread
      = "MessageReadDateUnread"
  shortShow MessageReadDateTooOld
      = "MessageReadDateTooOld"
  shortShow MessageReadDateUserPrivacyRestricted
      = "MessageReadDateUserPrivacyRestricted"
  shortShow MessageReadDateMyPrivacyRestricted
      = "MessageReadDateMyPrivacyRestricted"

instance AT.FromJSON MessageReadDate where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "messageReadDateRead"                  -> parseMessageReadDateRead v
      "messageReadDateUnread"                -> pure MessageReadDateUnread
      "messageReadDateTooOld"                -> pure MessageReadDateTooOld
      "messageReadDateUserPrivacyRestricted" -> pure MessageReadDateUserPrivacyRestricted
      "messageReadDateMyPrivacyRestricted"   -> pure MessageReadDateMyPrivacyRestricted
      _                                      -> mempty
    
    where
      parseMessageReadDateRead :: A.Value -> AT.Parser MessageReadDate
      parseMessageReadDateRead = A.withObject "MessageReadDateRead" $ \o -> do
        read_date_ <- o A..:?  "read_date"
        pure $ MessageReadDateRead
          { read_date = read_date_
          }
  parseJSON _ = mempty

