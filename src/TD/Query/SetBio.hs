module TD.Query.SetBio
  (SetBio(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Changes the bio of the current user. Returns 'TD.Data.Ok.Ok'
data SetBio
  = SetBio
    { bio :: Maybe T.Text -- ^ The new value of the user bio; 0-getOption("bio_length_max") characters without line feeds
    }
  deriving (Eq, Show)

instance I.ShortShow SetBio where
  shortShow
    SetBio
      { bio = bio_
      }
        = "SetBio"
          ++ I.cc
          [ "bio" `I.p` bio_
          ]

instance AT.ToJSON SetBio where
  toJSON
    SetBio
      { bio = bio_
      }
        = A.object
          [ "@type" A..= AT.String "setBio"
          , "bio"   A..= bio_
          ]

