module TD.Query.SetChatClientData
  (SetChatClientData(..)
  , defaultSetChatClientData
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Changes application-specific data associated with a chat. Returns 'TD.Data.Ok.Ok'
data SetChatClientData
  = SetChatClientData
    { chat_id     :: Maybe Int    -- ^ Chat identifier
    , client_data :: Maybe T.Text -- ^ New value of client_data
    }
  deriving (Eq, Show)

instance I.ShortShow SetChatClientData where
  shortShow
    SetChatClientData
      { chat_id     = chat_id_
      , client_data = client_data_
      }
        = "SetChatClientData"
          ++ I.cc
          [ "chat_id"     `I.p` chat_id_
          , "client_data" `I.p` client_data_
          ]

instance AT.ToJSON SetChatClientData where
  toJSON
    SetChatClientData
      { chat_id     = chat_id_
      , client_data = client_data_
      }
        = A.object
          [ "@type"       A..= AT.String "setChatClientData"
          , "chat_id"     A..= chat_id_
          , "client_data" A..= client_data_
          ]

defaultSetChatClientData :: SetChatClientData
defaultSetChatClientData =
  SetChatClientData
    { chat_id     = Nothing
    , client_data = Nothing
    }

