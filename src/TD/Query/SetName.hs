module TD.Query.SetName where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data SetName -- ^ Changes the first and last name of the current user
  = SetName
    { first_name :: Maybe T.Text -- ^ The new value of the first name for the current user; 1-64 characters
    , last_name  :: Maybe T.Text -- ^ The new value of the optional last name for the current user; 0-64 characters
    }
  deriving (Eq)

instance Show SetName where
  show
    SetName
      { first_name = first_name_
      , last_name  = last_name_
      }
        = "SetName"
          ++ I.cc
          [ "first_name" `I.p` first_name_
          , "last_name"  `I.p` last_name_
          ]

instance AT.ToJSON SetName where
  toJSON
    SetName
      { first_name = first_name_
      , last_name  = last_name_
      }
        = A.object
          [ "@type"      A..= AT.String "setName"
          , "first_name" A..= first_name_
          , "last_name"  A..= last_name_
          ]
