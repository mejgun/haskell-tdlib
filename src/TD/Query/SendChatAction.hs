module TD.Query.SendChatAction
  (SendChatAction(..)
  , defaultSendChatAction
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.ChatAction as ChatAction

-- | Sends a notification about user activity in a chat. Returns 'TD.Data.Ok.Ok'
data SendChatAction
  = SendChatAction
    { chat_id                :: Maybe Int                   -- ^ Chat identifier
    , message_thread_id      :: Maybe Int                   -- ^ If not 0, the message thread identifier in which the action was performed
    , business_connection_id :: Maybe T.Text                -- ^ Unique identifier of business connection on behalf of which to send the request; for bots only
    , action                 :: Maybe ChatAction.ChatAction -- ^ The action description; pass null to cancel the currently active action
    }
  deriving (Eq, Show)

instance I.ShortShow SendChatAction where
  shortShow
    SendChatAction
      { chat_id                = chat_id_
      , message_thread_id      = message_thread_id_
      , business_connection_id = business_connection_id_
      , action                 = action_
      }
        = "SendChatAction"
          ++ I.cc
          [ "chat_id"                `I.p` chat_id_
          , "message_thread_id"      `I.p` message_thread_id_
          , "business_connection_id" `I.p` business_connection_id_
          , "action"                 `I.p` action_
          ]

instance AT.ToJSON SendChatAction where
  toJSON
    SendChatAction
      { chat_id                = chat_id_
      , message_thread_id      = message_thread_id_
      , business_connection_id = business_connection_id_
      , action                 = action_
      }
        = A.object
          [ "@type"                  A..= AT.String "sendChatAction"
          , "chat_id"                A..= chat_id_
          , "message_thread_id"      A..= message_thread_id_
          , "business_connection_id" A..= business_connection_id_
          , "action"                 A..= action_
          ]

defaultSendChatAction :: SendChatAction
defaultSendChatAction =
  SendChatAction
    { chat_id                = Nothing
    , message_thread_id      = Nothing
    , business_connection_id = Nothing
    , action                 = Nothing
    }

