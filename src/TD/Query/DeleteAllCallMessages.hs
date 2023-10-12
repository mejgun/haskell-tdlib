module TD.Query.DeleteAllCallMessages where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data DeleteAllCallMessages -- ^ Deletes all call messages
  = DeleteAllCallMessages
    { revoke :: Maybe Bool -- ^ Pass true to delete the messages for all users
    }
  deriving (Eq)

instance Show DeleteAllCallMessages where
  show
    DeleteAllCallMessages
      { revoke = revoke_
      }
        = "DeleteAllCallMessages"
          ++ I.cc
          [ "revoke" `I.p` revoke_
          ]

instance AT.ToJSON DeleteAllCallMessages where
  toJSON
    DeleteAllCallMessages
      { revoke = revoke_
      }
        = A.object
          [ "@type"  A..= AT.String "deleteAllCallMessages"
          , "revoke" A..= revoke_
          ]
