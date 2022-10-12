{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ChatMessageSenders where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatMessageSender as ChatMessageSender
import qualified Utils as U

-- |
data ChatMessageSenders = -- | Represents a list of message senders, which can be used to send messages in a chat @senders List of available message senders
  ChatMessageSenders
  { -- |
    senders :: Maybe [ChatMessageSender.ChatMessageSender]
  }
  deriving (Eq)

instance Show ChatMessageSenders where
  show
    ChatMessageSenders
      { senders = senders_
      } =
      "ChatMessageSenders"
        ++ U.cc
          [ U.p "senders" senders_
          ]

instance T.FromJSON ChatMessageSenders where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatMessageSenders" -> parseChatMessageSenders v
      _ -> mempty
    where
      parseChatMessageSenders :: A.Value -> T.Parser ChatMessageSenders
      parseChatMessageSenders = A.withObject "ChatMessageSenders" $ \o -> do
        senders_ <- o A..:? "senders"
        return $ ChatMessageSenders {senders = senders_}
  parseJSON _ = mempty

instance T.ToJSON ChatMessageSenders where
  toJSON
    ChatMessageSenders
      { senders = senders_
      } =
      A.object
        [ "@type" A..= T.String "chatMessageSenders",
          "senders" A..= senders_
        ]
