module TD.Data.MessageSchedulingState where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data MessageSchedulingState -- ^ Contains information about the time when a scheduled message will be sent
  = MessageSchedulingStateSendAtDate -- ^ The message will be sent at the specified date
    { send_date :: Maybe Int -- ^ Point in time (Unix timestamp) when the message will be sent. The date must be within 367 days in the future
    }
  | MessageSchedulingStateSendWhenOnline -- ^ The message will be sent when the peer will be online. Applicable to private chats only and when the exact online status of the peer is known
  deriving (Eq)

instance Show MessageSchedulingState where
  show MessageSchedulingStateSendAtDate
    { send_date = send_date_
    }
      = "MessageSchedulingStateSendAtDate"
        ++ I.cc
        [ "send_date" `I.p` send_date_
        ]
  show MessageSchedulingStateSendWhenOnline
      = "MessageSchedulingStateSendWhenOnline"

instance AT.FromJSON MessageSchedulingState where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "messageSchedulingStateSendAtDate"     -> parseMessageSchedulingStateSendAtDate v
      "messageSchedulingStateSendWhenOnline" -> pure MessageSchedulingStateSendWhenOnline
      _                                      -> mempty
    
    where
      parseMessageSchedulingStateSendAtDate :: A.Value -> AT.Parser MessageSchedulingState
      parseMessageSchedulingStateSendAtDate = A.withObject "MessageSchedulingStateSendAtDate" $ \o -> do
        send_date_ <- o A..:?  "send_date"
        pure $ MessageSchedulingStateSendAtDate
          { send_date = send_date_
          }

instance AT.ToJSON MessageSchedulingState where
  toJSON MessageSchedulingStateSendAtDate
    { send_date = send_date_
    }
      = A.object
        [ "@type"     A..= AT.String "messageSchedulingStateSendAtDate"
        , "send_date" A..= send_date_
        ]
  toJSON MessageSchedulingStateSendWhenOnline
      = A.object
        [ "@type" A..= AT.String "messageSchedulingStateSendWhenOnline"
        ]
