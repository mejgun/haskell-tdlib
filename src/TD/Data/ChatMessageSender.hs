{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ChatMessageSender where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.MessageSender as MessageSender
import qualified Utils as U

-- |
data ChatMessageSender = -- | Represents a message sender, which can be used to send messages in a chat @sender Available message senders @needs_premium True, if Telegram Premium is needed to use the message sender
  ChatMessageSender
  { -- |
    needs_premium :: Maybe Bool,
    -- |
    sender :: Maybe MessageSender.MessageSender
  }
  deriving (Eq)

instance Show ChatMessageSender where
  show
    ChatMessageSender
      { needs_premium = needs_premium_,
        sender = sender_
      } =
      "ChatMessageSender"
        ++ U.cc
          [ U.p "needs_premium" needs_premium_,
            U.p "sender" sender_
          ]

instance T.FromJSON ChatMessageSender where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatMessageSender" -> parseChatMessageSender v
      _ -> mempty
    where
      parseChatMessageSender :: A.Value -> T.Parser ChatMessageSender
      parseChatMessageSender = A.withObject "ChatMessageSender" $ \o -> do
        needs_premium_ <- o A..:? "needs_premium"
        sender_ <- o A..:? "sender"
        return $ ChatMessageSender {needs_premium = needs_premium_, sender = sender_}
  parseJSON _ = mempty

instance T.ToJSON ChatMessageSender where
  toJSON
    ChatMessageSender
      { needs_premium = needs_premium_,
        sender = sender_
      } =
      A.object
        [ "@type" A..= T.String "chatMessageSender",
          "needs_premium" A..= needs_premium_,
          "sender" A..= sender_
        ]
