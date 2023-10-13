module TD.Query.SetChatClientData(SetChatClientData(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data SetChatClientData -- ^ Changes application-specific data associated with a chat
  = SetChatClientData
    { chat_id     :: Maybe Int    -- ^ Chat identifier
    , client_data :: Maybe T.Text -- ^ New value of client_data
    }
  deriving (Eq)

instance Show SetChatClientData where
  show
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
