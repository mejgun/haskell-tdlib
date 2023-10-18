module TD.Query.RemoveChatActionBar
  (RemoveChatActionBar(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Removes a chat action bar without any other action. Returns 'TD.Data.Ok.Ok'
data RemoveChatActionBar
  = RemoveChatActionBar
    { chat_id :: Maybe Int -- ^ Chat identifier
    }
  deriving (Eq, Show)

instance I.ShortShow RemoveChatActionBar where
  shortShow
    RemoveChatActionBar
      { chat_id = chat_id_
      }
        = "RemoveChatActionBar"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          ]

instance AT.ToJSON RemoveChatActionBar where
  toJSON
    RemoveChatActionBar
      { chat_id = chat_id_
      }
        = A.object
          [ "@type"   A..= AT.String "removeChatActionBar"
          , "chat_id" A..= chat_id_
          ]

