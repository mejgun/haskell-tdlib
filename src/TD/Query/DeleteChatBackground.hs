module TD.Query.DeleteChatBackground
  (DeleteChatBackground(..)
  , defaultDeleteChatBackground
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Deletes background in a specific chat. Returns 'TD.Data.Ok.Ok'
data DeleteChatBackground
  = DeleteChatBackground
    { chat_id          :: Maybe Int  -- ^ Chat identifier
    , restore_previous :: Maybe Bool -- ^ Pass true to restore previously set background. Can be used only in private and secret chats with non-deleted users if userFullInfo.set_chat_background == true. Supposed to be used from messageChatSetBackground messages with the currently set background that was set for both sides by the other user
    }
  deriving (Eq, Show)

instance I.ShortShow DeleteChatBackground where
  shortShow
    DeleteChatBackground
      { chat_id          = chat_id_
      , restore_previous = restore_previous_
      }
        = "DeleteChatBackground"
          ++ I.cc
          [ "chat_id"          `I.p` chat_id_
          , "restore_previous" `I.p` restore_previous_
          ]

instance AT.ToJSON DeleteChatBackground where
  toJSON
    DeleteChatBackground
      { chat_id          = chat_id_
      , restore_previous = restore_previous_
      }
        = A.object
          [ "@type"            A..= AT.String "deleteChatBackground"
          , "chat_id"          A..= chat_id_
          , "restore_previous" A..= restore_previous_
          ]

defaultDeleteChatBackground :: DeleteChatBackground
defaultDeleteChatBackground =
  DeleteChatBackground
    { chat_id          = Nothing
    , restore_previous = Nothing
    }

