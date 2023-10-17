module TD.Query.RegisterUser
  (RegisterUser(..)
  , defaultRegisterUser
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Finishes user registration. Works only when the current authorization state is authorizationStateWaitRegistration
data RegisterUser
  = RegisterUser
    { first_name :: Maybe T.Text -- ^ The first name of the user; 1-64 characters
    , last_name  :: Maybe T.Text -- ^ The last name of the user; 0-64 characters
    }
  deriving (Eq, Show)

instance I.ShortShow RegisterUser where
  shortShow
    RegisterUser
      { first_name = first_name_
      , last_name  = last_name_
      }
        = "RegisterUser"
          ++ I.cc
          [ "first_name" `I.p` first_name_
          , "last_name"  `I.p` last_name_
          ]

instance AT.ToJSON RegisterUser where
  toJSON
    RegisterUser
      { first_name = first_name_
      , last_name  = last_name_
      }
        = A.object
          [ "@type"      A..= AT.String "registerUser"
          , "first_name" A..= first_name_
          , "last_name"  A..= last_name_
          ]

defaultRegisterUser :: RegisterUser
defaultRegisterUser =
  RegisterUser
    { first_name = Nothing
    , last_name  = Nothing
    }

