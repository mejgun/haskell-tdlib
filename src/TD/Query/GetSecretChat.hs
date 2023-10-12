module TD.Query.GetSecretChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetSecretChat -- ^ Returns information about a secret chat by its identifier. This is an offline request
  = GetSecretChat
    { secret_chat_id :: Maybe Int -- ^ Secret chat identifier
    }
  deriving (Eq)

instance Show GetSecretChat where
  show
    GetSecretChat
      { secret_chat_id = secret_chat_id_
      }
        = "GetSecretChat"
          ++ I.cc
          [ "secret_chat_id" `I.p` secret_chat_id_
          ]

instance AT.ToJSON GetSecretChat where
  toJSON
    GetSecretChat
      { secret_chat_id = secret_chat_id_
      }
        = A.object
          [ "@type"          A..= AT.String "getSecretChat"
          , "secret_chat_id" A..= secret_chat_id_
          ]
