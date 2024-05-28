module TD.Query.SearchUserByPhoneNumber
  (SearchUserByPhoneNumber(..)
  , defaultSearchUserByPhoneNumber
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Searches a user by their phone number. Returns a 404 error if the user can't be found. Returns 'TD.Data.User.User'
data SearchUserByPhoneNumber
  = SearchUserByPhoneNumber
    { phone_number :: Maybe T.Text -- ^ Phone number to search for
    , only_local   :: Maybe Bool   -- ^ Pass true to get only locally available information without sending network requests
    }
  deriving (Eq, Show)

instance I.ShortShow SearchUserByPhoneNumber where
  shortShow
    SearchUserByPhoneNumber
      { phone_number = phone_number_
      , only_local   = only_local_
      }
        = "SearchUserByPhoneNumber"
          ++ I.cc
          [ "phone_number" `I.p` phone_number_
          , "only_local"   `I.p` only_local_
          ]

instance AT.ToJSON SearchUserByPhoneNumber where
  toJSON
    SearchUserByPhoneNumber
      { phone_number = phone_number_
      , only_local   = only_local_
      }
        = A.object
          [ "@type"        A..= AT.String "searchUserByPhoneNumber"
          , "phone_number" A..= phone_number_
          , "only_local"   A..= only_local_
          ]

defaultSearchUserByPhoneNumber :: SearchUserByPhoneNumber
defaultSearchUserByPhoneNumber =
  SearchUserByPhoneNumber
    { phone_number = Nothing
    , only_local   = Nothing
    }

