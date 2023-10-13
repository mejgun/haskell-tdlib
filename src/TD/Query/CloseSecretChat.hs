module TD.Query.CloseSecretChat
  (CloseSecretChat(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data CloseSecretChat -- ^ Closes a secret chat, effectively transferring its state to secretChatStateClosed
  = CloseSecretChat
    { secret_chat_id :: Maybe Int -- ^ Secret chat identifier
    }
  deriving (Eq)

instance Show CloseSecretChat where
  show
    CloseSecretChat
      { secret_chat_id = secret_chat_id_
      }
        = "CloseSecretChat"
          ++ I.cc
          [ "secret_chat_id" `I.p` secret_chat_id_
          ]

instance AT.ToJSON CloseSecretChat where
  toJSON
    CloseSecretChat
      { secret_chat_id = secret_chat_id_
      }
        = A.object
          [ "@type"          A..= AT.String "closeSecretChat"
          , "secret_chat_id" A..= secret_chat_id_
          ]

