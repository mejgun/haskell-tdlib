module TD.Query.ToggleUsernameIsActive
  (ToggleUsernameIsActive(..)
  , defaultToggleUsernameIsActive
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Changes active state for a username of the current user. The editable username can't be disabled. May return an error with a message "USERNAMES_ACTIVE_TOO_MUCH" if the maximum number of active usernames has been reached. Returns 'TD.Data.Ok.Ok'
data ToggleUsernameIsActive
  = ToggleUsernameIsActive
    { username  :: Maybe T.Text -- ^ The username to change
    , is_active :: Maybe Bool   -- ^ Pass true to activate the username; pass false to disable it
    }
  deriving (Eq, Show)

instance I.ShortShow ToggleUsernameIsActive where
  shortShow
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

defaultToggleUsernameIsActive :: ToggleUsernameIsActive
defaultToggleUsernameIsActive =
  ToggleUsernameIsActive
    { username  = Nothing
    , is_active = Nothing
    }

