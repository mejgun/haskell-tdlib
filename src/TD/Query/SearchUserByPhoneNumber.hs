module TD.Query.SearchUserByPhoneNumber
  (SearchUserByPhoneNumber(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Searches a user by their phone number. Returns a 404 error if the user can't be found. Returns 'TD.Data.User.User'
data SearchUserByPhoneNumber
  = SearchUserByPhoneNumber
    { phone_number :: Maybe T.Text -- ^ Phone number to search for
    }
  deriving (Eq, Show)

instance I.ShortShow SearchUserByPhoneNumber where
  shortShow
    SearchUserByPhoneNumber
      { phone_number = phone_number_
      }
        = "SearchUserByPhoneNumber"
          ++ I.cc
          [ "phone_number" `I.p` phone_number_
          ]

instance AT.ToJSON SearchUserByPhoneNumber where
  toJSON
    SearchUserByPhoneNumber
      { phone_number = phone_number_
      }
        = A.object
          [ "@type"        A..= AT.String "searchUserByPhoneNumber"
          , "phone_number" A..= phone_number_
          ]

