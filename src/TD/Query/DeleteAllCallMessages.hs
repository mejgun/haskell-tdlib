module TD.Query.DeleteAllCallMessages
  (DeleteAllCallMessages(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Deletes all call messages. Returns 'TD.Data.Ok.Ok'
data DeleteAllCallMessages
  = DeleteAllCallMessages
    { revoke :: Maybe Bool -- ^ Pass true to delete the messages for all users
    }
  deriving (Eq, Show)

instance I.ShortShow DeleteAllCallMessages where
  shortShow
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

