{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SendBotStartMessage where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Invites a bot to a chat (if it is not yet a member) and sends it the /start command. Bots can't be invited to a private chat other than the chat with the bot. Bots can't be invited to channels (although they can be added as admins) and secret chats. Returns the sent message
data SendBotStartMessage = SendBotStartMessage
  { -- |
    parameter :: Maybe String,
    -- |
    chat_id :: Maybe Int,
    -- | Identifier of the bot @chat_id Identifier of the target chat @parameter A hidden parameter sent to the bot for deep linking purposes (https://core.telegram.org/bots#deep-linking)
    bot_user_id :: Maybe Int
  }
  deriving (Eq)

instance Show SendBotStartMessage where
  show
    SendBotStartMessage
      { parameter = parameter_,
        chat_id = chat_id_,
        bot_user_id = bot_user_id_
      } =
      "SendBotStartMessage"
        ++ U.cc
          [ U.p "parameter" parameter_,
            U.p "chat_id" chat_id_,
            U.p "bot_user_id" bot_user_id_
          ]

instance T.ToJSON SendBotStartMessage where
  toJSON
    SendBotStartMessage
      { parameter = parameter_,
        chat_id = chat_id_,
        bot_user_id = bot_user_id_
      } =
      A.object
        [ "@type" A..= T.String "sendBotStartMessage",
          "parameter" A..= parameter_,
          "chat_id" A..= chat_id_,
          "bot_user_id" A..= bot_user_id_
        ]
