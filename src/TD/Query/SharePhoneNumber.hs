module TD.Query.SharePhoneNumber
  (SharePhoneNumber(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Shares the phone number of the current user with a mutual contact. Supposed to be called when the user clicks on chatActionBarSharePhoneNumber. Returns 'TD.Data.Ok.Ok'
data SharePhoneNumber
  = SharePhoneNumber
    { user_id :: Maybe Int -- ^ Identifier of the user with whom to share the phone number. The user must be a mutual contact
    }
  deriving (Eq, Show)

instance I.ShortShow SharePhoneNumber where
  shortShow
    SharePhoneNumber
      { user_id = user_id_
      }
        = "SharePhoneNumber"
          ++ I.cc
          [ "user_id" `I.p` user_id_
          ]

instance AT.ToJSON SharePhoneNumber where
  toJSON
    SharePhoneNumber
      { user_id = user_id_
      }
        = A.object
          [ "@type"   A..= AT.String "sharePhoneNumber"
          , "user_id" A..= user_id_
          ]

