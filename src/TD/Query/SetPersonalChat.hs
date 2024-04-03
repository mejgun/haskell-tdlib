module TD.Query.SetPersonalChat
  (SetPersonalChat(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Changes the personal chat of the current user. Returns 'TD.Data.Ok.Ok'
data SetPersonalChat
  = SetPersonalChat
    { chat_id :: Maybe Int -- ^ Identifier of the new personal chat; pass 0 to remove the chat. Use getSuitablePersonalChats to get suitable chats
    }
  deriving (Eq, Show)

instance I.ShortShow SetPersonalChat where
  shortShow
    SetPersonalChat
      { chat_id = chat_id_
      }
        = "SetPersonalChat"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          ]

instance AT.ToJSON SetPersonalChat where
  toJSON
    SetPersonalChat
      { chat_id = chat_id_
      }
        = A.object
          [ "@type"   A..= AT.String "setPersonalChat"
          , "chat_id" A..= chat_id_
          ]

