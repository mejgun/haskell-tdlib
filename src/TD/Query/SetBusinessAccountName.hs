module TD.Query.SetBusinessAccountName
  (SetBusinessAccountName(..)
  , defaultSetBusinessAccountName
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Changes the first and last name of a business account; for bots only. Returns 'TD.Data.Ok.Ok'
data SetBusinessAccountName
  = SetBusinessAccountName
    { business_connection_id :: Maybe T.Text -- ^ Unique identifier of business connection
    , first_name             :: Maybe T.Text -- ^ The new value of the first name for the business account; 1-64 characters
    , last_name              :: Maybe T.Text -- ^ The new value of the optional last name for the business account; 0-64 characters
    }
  deriving (Eq, Show)

instance I.ShortShow SetBusinessAccountName where
  shortShow
    SetBusinessAccountName
      { business_connection_id = business_connection_id_
      , first_name             = first_name_
      , last_name              = last_name_
      }
        = "SetBusinessAccountName"
          ++ I.cc
          [ "business_connection_id" `I.p` business_connection_id_
          , "first_name"             `I.p` first_name_
          , "last_name"              `I.p` last_name_
          ]

instance AT.ToJSON SetBusinessAccountName where
  toJSON
    SetBusinessAccountName
      { business_connection_id = business_connection_id_
      , first_name             = first_name_
      , last_name              = last_name_
      }
        = A.object
          [ "@type"                  A..= AT.String "setBusinessAccountName"
          , "business_connection_id" A..= business_connection_id_
          , "first_name"             A..= first_name_
          , "last_name"              A..= last_name_
          ]

defaultSetBusinessAccountName :: SetBusinessAccountName
defaultSetBusinessAccountName =
  SetBusinessAccountName
    { business_connection_id = Nothing
    , first_name             = Nothing
    , last_name              = Nothing
    }

