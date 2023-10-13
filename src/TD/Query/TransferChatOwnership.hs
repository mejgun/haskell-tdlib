module TD.Query.TransferChatOwnership(TransferChatOwnership(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data TransferChatOwnership -- ^ Changes the owner of a chat. The current user must be a current owner of the chat. Use the method canTransferOwnership to check whether the ownership can be transferred from the current session. Available only for supergroups and channel chats
  = TransferChatOwnership
    { chat_id  :: Maybe Int    -- ^ Chat identifier
    , user_id  :: Maybe Int    -- ^ Identifier of the user to which transfer the ownership. The ownership can't be transferred to a bot or to a deleted user
    , password :: Maybe T.Text -- ^ The 2-step verification password of the current user
    }
  deriving (Eq)

instance Show TransferChatOwnership where
  show
    TransferChatOwnership
      { chat_id  = chat_id_
      , user_id  = user_id_
      , password = password_
      }
        = "TransferChatOwnership"
          ++ I.cc
          [ "chat_id"  `I.p` chat_id_
          , "user_id"  `I.p` user_id_
          , "password" `I.p` password_
          ]

instance AT.ToJSON TransferChatOwnership where
  toJSON
    TransferChatOwnership
      { chat_id  = chat_id_
      , user_id  = user_id_
      , password = password_
      }
        = A.object
          [ "@type"    A..= AT.String "transferChatOwnership"
          , "chat_id"  A..= chat_id_
          , "user_id"  A..= user_id_
          , "password" A..= password_
          ]
