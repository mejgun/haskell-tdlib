module TD.Query.SendBotStartMessage
  (SendBotStartMessage(..)
  , defaultSendBotStartMessage
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Invites a bot to a chat (if it is not yet a member) and sends it the /start command; requires can_invite_users member right. Bots can't be invited to a private chat other than the chat with the bot. Bots can't be invited to channels (although they can be added as admins) and secret chats. Returns the sent message. Returns 'TD.Data.Message.Message'
data SendBotStartMessage
  = SendBotStartMessage
    { bot_user_id :: Maybe Int    -- ^ Identifier of the bot
    , chat_id     :: Maybe Int    -- ^ Identifier of the target chat
    , parameter   :: Maybe T.Text -- ^ A hidden parameter sent to the bot for deep linking purposes (https://core.telegram.org/bots#deep-linking)
    }
  deriving (Eq, Show)

instance I.ShortShow SendBotStartMessage where
  shortShow
    SendBotStartMessage
      { bot_user_id = bot_user_id_
      , chat_id     = chat_id_
      , parameter   = parameter_
      }
        = "SendBotStartMessage"
          ++ I.cc
          [ "bot_user_id" `I.p` bot_user_id_
          , "chat_id"     `I.p` chat_id_
          , "parameter"   `I.p` parameter_
          ]

instance AT.ToJSON SendBotStartMessage where
  toJSON
    SendBotStartMessage
      { bot_user_id = bot_user_id_
      , chat_id     = chat_id_
      , parameter   = parameter_
      }
        = A.object
          [ "@type"       A..= AT.String "sendBotStartMessage"
          , "bot_user_id" A..= bot_user_id_
          , "chat_id"     A..= chat_id_
          , "parameter"   A..= parameter_
          ]

defaultSendBotStartMessage :: SendBotStartMessage
defaultSendBotStartMessage =
  SendBotStartMessage
    { bot_user_id = Nothing
    , chat_id     = Nothing
    , parameter   = Nothing
    }

