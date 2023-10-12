module TD.Query.CreateNewSecretChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data CreateNewSecretChat -- ^ Creates a new secret chat. Returns the newly created chat
  = CreateNewSecretChat
    { user_id :: Maybe Int -- ^ Identifier of the target user
    }
  deriving (Eq)

instance Show CreateNewSecretChat where
  show
    CreateNewSecretChat
      { user_id = user_id_
      }
        = "CreateNewSecretChat"
          ++ I.cc
          [ "user_id" `I.p` user_id_
          ]

instance AT.ToJSON CreateNewSecretChat where
  toJSON
    CreateNewSecretChat
      { user_id = user_id_
      }
        = A.object
          [ "@type"   A..= AT.String "createNewSecretChat"
          , "user_id" A..= user_id_
          ]
