module TD.Query.GetMessageAvailableReactions
  (GetMessageAvailableReactions(..)
  , defaultGetMessageAvailableReactions
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns reactions, which can be added to a message. The list can change after updateActiveEmojiReactions, updateChatAvailableReactions for the chat, or updateMessageInteractionInfo for the message. Returns 'TD.Data.AvailableReactions.AvailableReactions'
data GetMessageAvailableReactions
  = GetMessageAvailableReactions
    { chat_id    :: Maybe Int -- ^ Identifier of the chat to which the message belongs
    , message_id :: Maybe Int -- ^ Identifier of the message
    , row_size   :: Maybe Int -- ^ Number of reaction per row, 5-25
    }
  deriving (Eq, Show)

instance I.ShortShow GetMessageAvailableReactions where
  shortShow
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

defaultGetMessageAvailableReactions :: GetMessageAvailableReactions
defaultGetMessageAvailableReactions =
  GetMessageAvailableReactions
    { chat_id    = Nothing
    , message_id = Nothing
    , row_size   = Nothing
    }

