module TD.Query.RegisterUser
  (RegisterUser(..)
  , defaultRegisterUser
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Finishes user registration. Works only when the current authorization state is authorizationStateWaitRegistration. Returns 'TD.Data.Ok.Ok'
data RegisterUser
  = RegisterUser
    { first_name           :: Maybe T.Text -- ^ The first name of the user; 1-64 characters
    , last_name            :: Maybe T.Text -- ^ The last name of the user; 0-64 characters
    , disable_notification :: Maybe Bool   -- ^ Pass true to disable notification about the current user joining Telegram for other users that added them to contact list
    }
  deriving (Eq, Show)

instance I.ShortShow RegisterUser where
  shortShow
    RegisterUser
      { first_name           = first_name_
      , last_name            = last_name_
      , disable_notification = disable_notification_
      }
        = "RegisterUser"
          ++ I.cc
          [ "first_name"           `I.p` first_name_
          , "last_name"            `I.p` last_name_
          , "disable_notification" `I.p` disable_notification_
          ]

instance AT.ToJSON RegisterUser where
  toJSON
    RegisterUser
      { first_name           = first_name_
      , last_name            = last_name_
      , disable_notification = disable_notification_
      }
        = A.object
          [ "@type"                A..= AT.String "registerUser"
          , "first_name"           A..= first_name_
          , "last_name"            A..= last_name_
          , "disable_notification" A..= disable_notification_
          ]

defaultRegisterUser :: RegisterUser
defaultRegisterUser =
  RegisterUser
    { first_name           = Nothing
    , last_name            = Nothing
    , disable_notification = Nothing
    }

