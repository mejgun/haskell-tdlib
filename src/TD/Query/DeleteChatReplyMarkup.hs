module TD.Query.DeleteChatReplyMarkup
  (DeleteChatReplyMarkup(..)
  , defaultDeleteChatReplyMarkup
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Deletes the default reply markup from a chat. Must be called after a one-time keyboard or a replyMarkupForceReply reply markup has been used. An updateChatReplyMarkup update will be sent if the reply markup is changed. Returns 'TD.Data.Ok.Ok'
data DeleteChatReplyMarkup
  = DeleteChatReplyMarkup
    { chat_id    :: Maybe Int -- ^ Chat identifier
    , message_id :: Maybe Int -- ^ The message identifier of the used keyboard
    }
  deriving (Eq, Show)

instance I.ShortShow DeleteChatReplyMarkup where
  shortShow
    DeleteChatReplyMarkup
      { chat_id    = chat_id_
      , message_id = message_id_
      }
        = "DeleteChatReplyMarkup"
          ++ I.cc
          [ "chat_id"    `I.p` chat_id_
          , "message_id" `I.p` message_id_
          ]

instance AT.ToJSON DeleteChatReplyMarkup where
  toJSON
    DeleteChatReplyMarkup
      { chat_id    = chat_id_
      , message_id = message_id_
      }
        = A.object
          [ "@type"      A..= AT.String "deleteChatReplyMarkup"
          , "chat_id"    A..= chat_id_
          , "message_id" A..= message_id_
          ]

defaultDeleteChatReplyMarkup :: DeleteChatReplyMarkup
defaultDeleteChatReplyMarkup =
  DeleteChatReplyMarkup
    { chat_id    = Nothing
    , message_id = Nothing
    }

