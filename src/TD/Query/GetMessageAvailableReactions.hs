module TD.Query.GetMessageAvailableReactions(GetMessageAvailableReactions(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data GetMessageAvailableReactions -- ^ Returns reactions, which can be added to a message. The list can change after updateActiveEmojiReactions, updateChatAvailableReactions for the chat, or updateMessageInteractionInfo for the message
  = GetMessageAvailableReactions
    { chat_id    :: Maybe Int -- ^ Identifier of the chat to which the message belongs
    , message_id :: Maybe Int -- ^ Identifier of the message
    , row_size   :: Maybe Int -- ^ Number of reaction per row, 5-25
    }
  deriving (Eq)

instance Show GetMessageAvailableReactions where
  show
    GetMessageAvailableReactions
      { chat_id    = chat_id_
      , message_id = message_id_
      , row_size   = row_size_
      }
        = "GetMessageAvailableReactions"
          ++ I.cc
          [ "chat_id"    `I.p` chat_id_
          , "message_id" `I.p` message_id_
          , "row_size"   `I.p` row_size_
          ]

instance AT.ToJSON GetMessageAvailableReactions where
  toJSON
    GetMessageAvailableReactions
      { chat_id    = chat_id_
      , message_id = message_id_
      , row_size   = row_size_
      }
        = A.object
          [ "@type"      A..= AT.String "getMessageAvailableReactions"
          , "chat_id"    A..= chat_id_
          , "message_id" A..= message_id_
          , "row_size"   A..= row_size_
          ]
