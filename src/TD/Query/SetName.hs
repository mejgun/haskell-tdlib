module TD.Query.SetName
  (SetName(..)
  , defaultSetName
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Changes the first and last name of the current user. Returns 'TD.Data.Ok.Ok'
data SetName
  = SetName
    { first_name :: Maybe T.Text -- ^ The new value of the first name for the current user; 1-64 characters
    , last_name  :: Maybe T.Text -- ^ The new value of the optional last name for the current user; 0-64 characters
    }
  deriving (Eq, Show)

instance I.ShortShow SetName where
  shortShow
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

defaultSetName :: SetName
defaultSetName =
  SetName
    { first_name = Nothing
    , last_name  = Nothing
    }

