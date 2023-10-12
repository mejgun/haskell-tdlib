module TD.Query.ToggleUsernameIsActive where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data ToggleUsernameIsActive -- ^ Changes active state for a username of the current user. The editable username can't be disabled. May return an error with a message "USERNAMES_ACTIVE_TOO_MUCH" if the maximum number of active usernames has been reached
  = ToggleUsernameIsActive
    { username  :: Maybe T.Text -- ^ The username to change
    , is_active :: Maybe Bool   -- ^ Pass true to activate the username; pass false to disable it
    }
  deriving (Eq)

instance Show ToggleUsernameIsActive where
  show
    ToggleUsernameIsActive
      { username  = username_
      , is_active = is_active_
      }
        = "ToggleUsernameIsActive"
          ++ I.cc
          [ "username"  `I.p` username_
          , "is_active" `I.p` is_active_
          ]

instance AT.ToJSON ToggleUsernameIsActive where
  toJSON
    ToggleUsernameIsActive
      { username  = username_
      , is_active = is_active_
      }
        = A.object
          [ "@type"     A..= AT.String "toggleUsernameIsActive"
          , "username"  A..= username_
          , "is_active" A..= is_active_
          ]
