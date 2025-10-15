module TD.Query.SuggestUserBirthdate
  (SuggestUserBirthdate(..)
  , defaultSuggestUserBirthdate
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Birthdate as Birthdate

-- | Suggests a birthdate to another regular user with common messages and allowing non-paid messages. Returns 'TD.Data.Ok.Ok'
data SuggestUserBirthdate
  = SuggestUserBirthdate
    { user_id   :: Maybe Int                 -- ^ User identifier
    , birthdate :: Maybe Birthdate.Birthdate -- ^ Birthdate to suggest
    }
  deriving (Eq, Show)

instance I.ShortShow SuggestUserBirthdate where
  shortShow
    SuggestUserBirthdate
      { user_id   = user_id_
      , birthdate = birthdate_
      }
        = "SuggestUserBirthdate"
          ++ I.cc
          [ "user_id"   `I.p` user_id_
          , "birthdate" `I.p` birthdate_
          ]

instance AT.ToJSON SuggestUserBirthdate where
  toJSON
    SuggestUserBirthdate
      { user_id   = user_id_
      , birthdate = birthdate_
      }
        = A.object
          [ "@type"     A..= AT.String "suggestUserBirthdate"
          , "user_id"   A..= user_id_
          , "birthdate" A..= birthdate_
          ]

defaultSuggestUserBirthdate :: SuggestUserBirthdate
defaultSuggestUserBirthdate =
  SuggestUserBirthdate
    { user_id   = Nothing
    , birthdate = Nothing
    }

