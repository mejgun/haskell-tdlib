module TD.Query.ProcessChatJoinRequest
  (ProcessChatJoinRequest(..)
  , defaultProcessChatJoinRequest
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Handles a pending join request in a chat. Returns 'TD.Data.Ok.Ok'
data ProcessChatJoinRequest
  = ProcessChatJoinRequest
    { chat_id :: Maybe Int  -- ^ Chat identifier
    , user_id :: Maybe Int  -- ^ Identifier of the user that sent the request
    , approve :: Maybe Bool -- ^ Pass true to approve the request; pass false to decline it
    }
  deriving (Eq, Show)

instance I.ShortShow ProcessChatJoinRequest where
  shortShow
    ProcessChatJoinRequest
      { chat_id = chat_id_
      , user_id = user_id_
      , approve = approve_
      }
        = "ProcessChatJoinRequest"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          , "user_id" `I.p` user_id_
          , "approve" `I.p` approve_
          ]

instance AT.ToJSON ProcessChatJoinRequest where
  toJSON
    ProcessChatJoinRequest
      { chat_id = chat_id_
      , user_id = user_id_
      , approve = approve_
      }
        = A.object
          [ "@type"   A..= AT.String "processChatJoinRequest"
          , "chat_id" A..= chat_id_
          , "user_id" A..= user_id_
          , "approve" A..= approve_
          ]

defaultProcessChatJoinRequest :: ProcessChatJoinRequest
defaultProcessChatJoinRequest =
  ProcessChatJoinRequest
    { chat_id = Nothing
    , user_id = Nothing
    , approve = Nothing
    }

