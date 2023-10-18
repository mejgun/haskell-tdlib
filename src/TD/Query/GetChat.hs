module TD.Query.GetChat
  (GetChat(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns information about a chat by its identifier; this is an offline request if the current user is not a bot. Returns 'TD.Data.Chat.Chat'
data GetChat
  = GetChat
    { chat_id :: Maybe Int -- ^ Chat identifier
    }
  deriving (Eq, Show)

instance I.ShortShow GetChat where
  shortShow
    GetChat
      { chat_id = chat_id_
      }
        = "GetChat"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          ]

instance AT.ToJSON GetChat where
  toJSON
    GetChat
      { chat_id = chat_id_
      }
        = A.object
          [ "@type"   A..= AT.String "getChat"
          , "chat_id" A..= chat_id_
          ]

