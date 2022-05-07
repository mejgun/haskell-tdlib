{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.MessageSchedulingState where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Contains information about the time when a scheduled message will be sent
data MessageSchedulingState
  = -- | The message will be sent at the specified date @send_date Date the message will be sent. The date must be within 367 days in the future
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
      { send_date = send_date
      } =
      "MessageSchedulingStateSendAtDate"
        ++ U.cc
          [ U.p "send_date" send_date
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
      _ -> fail ""
    where
      parseMessageSchedulingStateSendAtDate :: A.Value -> T.Parser MessageSchedulingState
      parseMessageSchedulingStateSendAtDate = A.withObject "MessageSchedulingStateSendAtDate" $ \o -> do
        send_date_ <- mconcat [o A..:? "send_date", U.rm <$> (o A..: "send_date" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ MessageSchedulingStateSendAtDate {send_date = send_date_}

      parseMessageSchedulingStateSendWhenOnline :: A.Value -> T.Parser MessageSchedulingState
      parseMessageSchedulingStateSendWhenOnline = A.withObject "MessageSchedulingStateSendWhenOnline" $ \o -> do
        return $ MessageSchedulingStateSendWhenOnline {}
  parseJSON _ = fail ""

instance T.ToJSON MessageSchedulingState where
  toJSON
    MessageSchedulingStateSendAtDate
      { send_date = send_date
      } =
      A.object
        [ "@type" A..= T.String "messageSchedulingStateSendAtDate",
          "send_date" A..= send_date
        ]
  toJSON MessageSchedulingStateSendWhenOnline =
    A.object
      [ "@type" A..= T.String "messageSchedulingStateSendWhenOnline"
      ]
