module TD.Query.GetBusinessConnection
  (GetBusinessConnection(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns information about a business connection by its identifier; for bots only. Returns 'TD.Data.BusinessConnection.BusinessConnection'
data GetBusinessConnection
  = GetBusinessConnection
    { connection_id :: Maybe T.Text -- ^ Identifier of the business connection to return
    }
  deriving (Eq, Show)

instance I.ShortShow GetBusinessConnection where
  shortShow
    GetBusinessConnection
      { connection_id = connection_id_
      }
        = "GetBusinessConnection"
          ++ I.cc
          [ "connection_id" `I.p` connection_id_
          ]

instance AT.ToJSON GetBusinessConnection where
  toJSON
    GetBusinessConnection
      { connection_id = connection_id_
      }
        = A.object
          [ "@type"         A..= AT.String "getBusinessConnection"
          , "connection_id" A..= connection_id_
          ]

