{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.MessageSenders where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.MessageSender as MessageSender
import qualified Utils as U

-- |
data MessageSenders = -- | Represents a list of message senders @total_count Approximate total number of messages senders found @senders List of message senders
  MessageSenders
  { -- |
    senders :: Maybe [MessageSender.MessageSender],
    -- |
    total_count :: Maybe Int
  }
  deriving (Eq)

instance Show MessageSenders where
  show
    MessageSenders
      { senders = senders_,
        total_count = total_count_
      } =
      "MessageSenders"
        ++ U.cc
          [ U.p "senders" senders_,
            U.p "total_count" total_count_
          ]

instance T.FromJSON MessageSenders where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "messageSenders" -> parseMessageSenders v
      _ -> mempty
    where
      parseMessageSenders :: A.Value -> T.Parser MessageSenders
      parseMessageSenders = A.withObject "MessageSenders" $ \o -> do
        senders_ <- o A..:? "senders"
        total_count_ <- o A..:? "total_count"
        return $ MessageSenders {senders = senders_, total_count = total_count_}
  parseJSON _ = mempty

instance T.ToJSON MessageSenders where
  toJSON
    MessageSenders
      { senders = senders_,
        total_count = total_count_
      } =
      A.object
        [ "@type" A..= T.String "messageSenders",
          "senders" A..= senders_,
          "total_count" A..= total_count_
        ]
