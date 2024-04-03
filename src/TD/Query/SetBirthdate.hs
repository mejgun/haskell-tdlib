module TD.Query.SetBirthdate
  (SetBirthdate(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Birthdate as Birthdate

-- | Changes the birthdate of the current user. Returns 'TD.Data.Ok.Ok'
data SetBirthdate
  = SetBirthdate
    { birthdate :: Maybe Birthdate.Birthdate -- ^ The new value of the current user's birthdate; pass null to remove the birthdate
    }
  deriving (Eq, Show)

instance I.ShortShow SetBirthdate where
  shortShow
    SetBirthdate
      { birthdate = birthdate_
      }
        = "SetBirthdate"
          ++ I.cc
          [ "birthdate" `I.p` birthdate_
          ]

instance AT.ToJSON SetBirthdate where
  toJSON
    SetBirthdate
      { birthdate = birthdate_
      }
        = A.object
          [ "@type"     A..= AT.String "setBirthdate"
          , "birthdate" A..= birthdate_
          ]

