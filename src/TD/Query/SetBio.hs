module TD.Query.SetBio where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data SetBio -- ^ Changes the bio of the current user
  = SetBio
    { bio :: Maybe T.Text -- ^ The new value of the user bio; 0-getOption("bio_length_max") characters without line feeds
    }
  deriving (Eq)

instance Show SetBio where
  show
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
