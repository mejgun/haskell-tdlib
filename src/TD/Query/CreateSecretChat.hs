module TD.Query.CreateSecretChat
  (CreateSecretChat(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns an existing chat corresponding to a known secret chat. Returns 'TD.Data.Chat.Chat'
data CreateSecretChat
  = CreateSecretChat
    { secret_chat_id :: Maybe Int -- ^ Secret chat identifier
    }
  deriving (Eq, Show)

instance I.ShortShow CreateSecretChat where
  shortShow
    CreateSecretChat
      { secret_chat_id = secret_chat_id_
      }
        = "CreateSecretChat"
          ++ I.cc
          [ "secret_chat_id" `I.p` secret_chat_id_
          ]

instance AT.ToJSON CreateSecretChat where
  toJSON
    CreateSecretChat
      { secret_chat_id = secret_chat_id_
      }
        = A.object
          [ "@type"          A..= AT.String "createSecretChat"
          , "secret_chat_id" A..= secret_chat_id_
          ]

