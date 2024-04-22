module TD.Query.OpenChatSimilarChat
  (OpenChatSimilarChat(..)
  , defaultOpenChatSimilarChat
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Informs TDLib that a chat was opened from the list of similar chats. The method is independent of openChat and closeChat methods. Returns 'TD.Data.Ok.Ok'
data OpenChatSimilarChat
  = OpenChatSimilarChat
    { chat_id        :: Maybe Int -- ^ Identifier of the original chat, which similar chats were requested
    , opened_chat_id :: Maybe Int -- ^ Identifier of the opened chat
    }
  deriving (Eq, Show)

instance I.ShortShow OpenChatSimilarChat where
  shortShow
    OpenChatSimilarChat
      { chat_id        = chat_id_
      , opened_chat_id = opened_chat_id_
      }
        = "OpenChatSimilarChat"
          ++ I.cc
          [ "chat_id"        `I.p` chat_id_
          , "opened_chat_id" `I.p` opened_chat_id_
          ]

instance AT.ToJSON OpenChatSimilarChat where
  toJSON
    OpenChatSimilarChat
      { chat_id        = chat_id_
      , opened_chat_id = opened_chat_id_
      }
        = A.object
          [ "@type"          A..= AT.String "openChatSimilarChat"
          , "chat_id"        A..= chat_id_
          , "opened_chat_id" A..= opened_chat_id_
          ]

defaultOpenChatSimilarChat :: OpenChatSimilarChat
defaultOpenChatSimilarChat =
  OpenChatSimilarChat
    { chat_id        = Nothing
    , opened_chat_id = Nothing
    }

