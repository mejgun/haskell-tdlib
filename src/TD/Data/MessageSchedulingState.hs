{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.MessageSchedulingState where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Contains information about the time when a scheduled message will be sent
data MessageSchedulingState
  = -- | The message will be sent at the specified date @send_date Point in time (Unix timestamp) when the message will be sent. The date must be within 367 days in the future
    MessageSchedulingStateSendAtDate
      { -- |
        send_date :: Maybe Int
      }
  | -- | The message will be sent when the peer will be online. Applicable to private chats only and when the exact online status of the peer is known
    MessageSchedulingStateSendWhenOnline
  deriving (Eq)

instance Show MessageSchedulingState where
  show
    MessageSchedulingStateSendAtDate
      { send_date = send_date_
      } =
      "MessageSchedulingStateSendAtDate"
        ++ U.cc
          [ U.p "send_date" send_date_
          ]
  show MessageSchedulingStateSendWhenOnline =
    "MessageSchedulingStateSendWhenOnline"
      ++ U.cc
        []

instance T.FromJSON MessageSchedulingState where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "messageSchedulingStateSendAtDate" -> parseMessageSchedulingStateSendAtDate v
      "messageSchedulingStateSendWhenOnline" -> parseMessageSchedulingStateSendWhenOnline v
      _ -> mempty
    where
      parseMessageSchedulingStateSendAtDate :: A.Value -> T.Parser MessageSchedulingState
      parseMessageSchedulingStateSendAtDate = A.withObject "MessageSchedulingStateSendAtDate" $ \o -> do
        send_date_ <- o A..:? "send_date"
        return $ MessageSchedulingStateSendAtDate {send_date = send_date_}

      parseMessageSchedulingStateSendWhenOnline :: A.Value -> T.Parser MessageSchedulingState
      parseMessageSchedulingStateSendWhenOnline = A.withObject "MessageSchedulingStateSendWhenOnline" $ \_ -> return MessageSchedulingStateSendWhenOnline
  parseJSON _ = mempty

instance T.ToJSON MessageSchedulingState where
  toJSON
    MessageSchedulingStateSendAtDate
      { send_date = send_date_
      } =
      A.object
        [ "@type" A..= T.String "messageSchedulingStateSendAtDate",
          "send_date" A..= send_date_
        ]
  toJSON MessageSchedulingStateSendWhenOnline =
    A.object
      [ "@type" A..= T.String "messageSchedulingStateSendWhenOnline"
      ]
