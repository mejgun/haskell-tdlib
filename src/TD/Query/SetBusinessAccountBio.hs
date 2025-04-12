module TD.Query.SetBusinessAccountBio
  (SetBusinessAccountBio(..)
  , defaultSetBusinessAccountBio
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Changes the bio of a business account; for bots only. Returns 'TD.Data.Ok.Ok'
data SetBusinessAccountBio
  = SetBusinessAccountBio
    { business_connection_id :: Maybe T.Text -- ^ Unique identifier of business connection
    , bio                    :: Maybe T.Text -- ^ The new value of the bio; 0-getOption("bio_length_max") characters without line feeds
    }
  deriving (Eq, Show)

instance I.ShortShow SetBusinessAccountBio where
  shortShow
    SetBusinessAccountBio
      { business_connection_id = business_connection_id_
      , bio                    = bio_
      }
        = "SetBusinessAccountBio"
          ++ I.cc
          [ "business_connection_id" `I.p` business_connection_id_
          , "bio"                    `I.p` bio_
          ]

instance AT.ToJSON SetBusinessAccountBio where
  toJSON
    SetBusinessAccountBio
      { business_connection_id = business_connection_id_
      , bio                    = bio_
      }
        = A.object
          [ "@type"                  A..= AT.String "setBusinessAccountBio"
          , "business_connection_id" A..= business_connection_id_
          , "bio"                    A..= bio_
          ]

defaultSetBusinessAccountBio :: SetBusinessAccountBio
defaultSetBusinessAccountBio =
  SetBusinessAccountBio
    { business_connection_id = Nothing
    , bio                    = Nothing
    }

