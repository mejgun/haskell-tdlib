module TD.Query.ProcessChatHasProtectedContentDisableRequest
  (ProcessChatHasProtectedContentDisableRequest(..)
  , defaultProcessChatHasProtectedContentDisableRequest
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Processes request to disable has_protected_content in a chat. Returns 'TD.Data.Ok.Ok'
data ProcessChatHasProtectedContentDisableRequest
  = ProcessChatHasProtectedContentDisableRequest
    { chat_id            :: Maybe Int  -- ^ Chat identifier
    , request_message_id :: Maybe Int  -- ^ Identifier of the message with the request. The message must be incoming and has content of the type messageChatHasProtectedContentDisableRequested
    , approve            :: Maybe Bool -- ^ Pass true to approve the request; pass false to reject the request
    }
  deriving (Eq, Show)

instance I.ShortShow ProcessChatHasProtectedContentDisableRequest where
  shortShow
    ProcessChatHasProtectedContentDisableRequest
      { chat_id            = chat_id_
      , request_message_id = request_message_id_
      , approve            = approve_
      }
        = "ProcessChatHasProtectedContentDisableRequest"
          ++ I.cc
          [ "chat_id"            `I.p` chat_id_
          , "request_message_id" `I.p` request_message_id_
          , "approve"            `I.p` approve_
          ]

instance AT.ToJSON ProcessChatHasProtectedContentDisableRequest where
  toJSON
    ProcessChatHasProtectedContentDisableRequest
      { chat_id            = chat_id_
      , request_message_id = request_message_id_
      , approve            = approve_
      }
        = A.object
          [ "@type"              A..= AT.String "processChatHasProtectedContentDisableRequest"
          , "chat_id"            A..= chat_id_
          , "request_message_id" A..= request_message_id_
          , "approve"            A..= approve_
          ]

defaultProcessChatHasProtectedContentDisableRequest :: ProcessChatHasProtectedContentDisableRequest
defaultProcessChatHasProtectedContentDisableRequest =
  ProcessChatHasProtectedContentDisableRequest
    { chat_id            = Nothing
    , request_message_id = Nothing
    , approve            = Nothing
    }

