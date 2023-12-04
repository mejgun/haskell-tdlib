module TD.Query.GetChatSimilarChats
  (GetChatSimilarChats(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns a list of chats similar to the given chat. Returns 'TD.Data.Chats.Chats'
data GetChatSimilarChats
  = GetChatSimilarChats
    { chat_id :: Maybe Int -- ^ Identifier of the target chat; must be an identifier of a channel chat
    }
  deriving (Eq, Show)

instance I.ShortShow GetChatSimilarChats where
  shortShow
    GetChatSimilarChats
      { chat_id = chat_id_
      }
        = "GetChatSimilarChats"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          ]

instance AT.ToJSON GetChatSimilarChats where
  toJSON
    GetChatSimilarChats
      { chat_id = chat_id_
      }
        = A.object
          [ "@type"   A..= AT.String "getChatSimilarChats"
          , "chat_id" A..= chat_id_
          ]

