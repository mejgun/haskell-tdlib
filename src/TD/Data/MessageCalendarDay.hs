module TD.Data.MessageCalendarDay
  (MessageCalendarDay(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Message as Message

data MessageCalendarDay
  = MessageCalendarDay -- ^ Contains information about found messages sent on a specific day
    { total_count :: Maybe Int             -- ^ Total number of found messages sent on the day
    , message     :: Maybe Message.Message -- ^ First message sent on the day
    }
  deriving (Eq, Show)

instance I.ShortShow MessageCalendarDay where
  shortShow MessageCalendarDay
    { total_count = total_count_
    , message     = message_
    }
      = "MessageCalendarDay"
        ++ I.cc
        [ "total_count" `I.p` total_count_
        , "message"     `I.p` message_
        ]

instance AT.FromJSON MessageCalendarDay where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "messageCalendarDay" -> parseMessageCalendarDay v
      _                    -> mempty
    
    where
      parseMessageCalendarDay :: A.Value -> AT.Parser MessageCalendarDay
      parseMessageCalendarDay = A.withObject "MessageCalendarDay" $ \o -> do
        total_count_ <- o A..:?  "total_count"
        message_     <- o A..:?  "message"
        pure $ MessageCalendarDay
          { total_count = total_count_
          , message     = message_
          }
  parseJSON _ = mempty

