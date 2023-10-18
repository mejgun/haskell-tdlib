module TD.Query.ToggleSupergroupUsernameIsActive
  (ToggleSupergroupUsernameIsActive(..)
  , defaultToggleSupergroupUsernameIsActive
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Changes active state for a username of a supergroup or channel, requires owner privileges in the supergroup or channel. The editable username can't be disabled. May return an error with a message "USERNAMES_ACTIVE_TOO_MUCH" if the maximum number of active usernames has been reached. Returns 'TD.Data.Ok.Ok'
data ToggleSupergroupUsernameIsActive
  = ToggleSupergroupUsernameIsActive
    { supergroup_id :: Maybe Int    -- ^ Identifier of the supergroup or channel
    , username      :: Maybe T.Text -- ^ The username to change
    , is_active     :: Maybe Bool   -- ^ Pass true to activate the username; pass false to disable it
    }
  deriving (Eq, Show)

instance I.ShortShow ToggleSupergroupUsernameIsActive where
  shortShow
    ToggleSupergroupUsernameIsActive
      { supergroup_id = supergroup_id_
      , username      = username_
      , is_active     = is_active_
      }
        = "ToggleSupergroupUsernameIsActive"
          ++ I.cc
          [ "supergroup_id" `I.p` supergroup_id_
          , "username"      `I.p` username_
          , "is_active"     `I.p` is_active_
          ]

instance AT.ToJSON ToggleSupergroupUsernameIsActive where
  toJSON
    ToggleSupergroupUsernameIsActive
      { supergroup_id = supergroup_id_
      , username      = username_
      , is_active     = is_active_
      }
        = A.object
          [ "@type"         A..= AT.String "toggleSupergroupUsernameIsActive"
          , "supergroup_id" A..= supergroup_id_
          , "username"      A..= username_
          , "is_active"     A..= is_active_
          ]

defaultToggleSupergroupUsernameIsActive :: ToggleSupergroupUsernameIsActive
defaultToggleSupergroupUsernameIsActive =
  ToggleSupergroupUsernameIsActive
    { supergroup_id = Nothing
    , username      = Nothing
    , is_active     = Nothing
    }

