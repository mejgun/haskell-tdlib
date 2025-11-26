module TD.Data.MessageSchedulingState
  (MessageSchedulingState(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Contains information about the time when a scheduled message will be sent
data MessageSchedulingState
  = MessageSchedulingStateSendAtDate -- ^ The message will be sent at the specified date
    { send_date     :: Maybe Int -- ^ Point in time (Unix timestamp) when the message will be sent. The date must be within 367 days in the future
    , repeat_period :: Maybe Int -- ^ Period after which the message will be sent again; in seconds; 0 if never; for Telegram Premium users only; may be non-zero only in sendMessage and forwardMessages with one message requests; must be one of 0, 86400, 7 * 86400, 14 * 86400, 30 * 86400, 91 * 86400, 182 * 86400, 365 * 86400, or additionally 60, or 300 in the Test DC
    }
  | MessageSchedulingStateSendWhenOnline -- ^ The message will be sent when the other user is online. Applicable to private chats only and when the exact online status of the other user is known
  | MessageSchedulingStateSendWhenVideoProcessed -- ^ The message will be sent when the video in the message is converted and optimized; can be used only by the server
    { send_date :: Maybe Int -- ^ Approximate point in time (Unix timestamp) when the message is expected to be sent
    }
  deriving (Eq, Show)

instance I.ShortShow MessageSchedulingState where
  shortShow MessageSchedulingStateSendAtDate
    { send_date     = send_date_
    , repeat_period = repeat_period_
    }
      = "MessageSchedulingStateSendAtDate"
        ++ I.cc
        [ "send_date"     `I.p` send_date_
        , "repeat_period" `I.p` repeat_period_
        ]
  shortShow MessageSchedulingStateSendWhenOnline
      = "MessageSchedulingStateSendWhenOnline"
  shortShow MessageSchedulingStateSendWhenVideoProcessed
    { send_date = send_date_
    }
      = "MessageSchedulingStateSendWhenVideoProcessed"
        ++ I.cc
        [ "send_date" `I.p` send_date_
        ]

instance AT.FromJSON MessageSchedulingState where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "messageSchedulingStateSendAtDate"             -> parseMessageSchedulingStateSendAtDate v
      "messageSchedulingStateSendWhenOnline"         -> pure MessageSchedulingStateSendWhenOnline
      "messageSchedulingStateSendWhenVideoProcessed" -> parseMessageSchedulingStateSendWhenVideoProcessed v
      _                                              -> mempty
    
    where
      parseMessageSchedulingStateSendAtDate :: A.Value -> AT.Parser MessageSchedulingState
      parseMessageSchedulingStateSendAtDate = A.withObject "MessageSchedulingStateSendAtDate" $ \o -> do
        send_date_     <- o A..:?  "send_date"
        repeat_period_ <- o A..:?  "repeat_period"
        pure $ MessageSchedulingStateSendAtDate
          { send_date     = send_date_
          , repeat_period = repeat_period_
          }
      parseMessageSchedulingStateSendWhenVideoProcessed :: A.Value -> AT.Parser MessageSchedulingState
      parseMessageSchedulingStateSendWhenVideoProcessed = A.withObject "MessageSchedulingStateSendWhenVideoProcessed" $ \o -> do
        send_date_ <- o A..:?  "send_date"
        pure $ MessageSchedulingStateSendWhenVideoProcessed
          { send_date = send_date_
          }
  parseJSON _ = mempty

instance AT.ToJSON MessageSchedulingState where
  toJSON MessageSchedulingStateSendAtDate
    { send_date     = send_date_
    , repeat_period = repeat_period_
    }
      = A.object
        [ "@type"         A..= AT.String "messageSchedulingStateSendAtDate"
        , "send_date"     A..= send_date_
        , "repeat_period" A..= repeat_period_
        ]
  toJSON MessageSchedulingStateSendWhenOnline
      = A.object
        [ "@type" A..= AT.String "messageSchedulingStateSendWhenOnline"
        ]
  toJSON MessageSchedulingStateSendWhenVideoProcessed
    { send_date = send_date_
    }
      = A.object
        [ "@type"     A..= AT.String "messageSchedulingStateSendWhenVideoProcessed"
        , "send_date" A..= send_date_
        ]

