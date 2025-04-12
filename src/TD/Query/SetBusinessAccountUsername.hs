module TD.Query.SetBusinessAccountUsername
  (SetBusinessAccountUsername(..)
  , defaultSetBusinessAccountUsername
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Changes the editable username of a business account; for bots only. Returns 'TD.Data.Ok.Ok'
data SetBusinessAccountUsername
  = SetBusinessAccountUsername
    { business_connection_id :: Maybe T.Text -- ^ Unique identifier of business connection
    , username               :: Maybe T.Text -- ^ The new value of the username
    }
  deriving (Eq, Show)

instance I.ShortShow SetBusinessAccountUsername where
  shortShow
    SetBusinessAccountUsername
      { business_connection_id = business_connection_id_
      , username               = username_
      }
        = "SetBusinessAccountUsername"
          ++ I.cc
          [ "business_connection_id" `I.p` business_connection_id_
          , "username"               `I.p` username_
          ]

instance AT.ToJSON SetBusinessAccountUsername where
  toJSON
    SetBusinessAccountUsername
      { business_connection_id = business_connection_id_
      , username               = username_
      }
        = A.object
          [ "@type"                  A..= AT.String "setBusinessAccountUsername"
          , "business_connection_id" A..= business_connection_id_
          , "username"               A..= username_
          ]

defaultSetBusinessAccountUsername :: SetBusinessAccountUsername
defaultSetBusinessAccountUsername =
  SetBusinessAccountUsername
    { business_connection_id = Nothing
    , username               = Nothing
    }

