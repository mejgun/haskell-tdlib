{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ToggleSupergroupUsernameIsActive where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Changes active state for a username of a supergroup or channel, requires owner privileges in the supergroup or channel. The editable username can't be disabled.
-- May return an error with a message "USERNAMES_ACTIVE_TOO_MUCH" if the maximum number of active usernames has been reached
data ToggleSupergroupUsernameIsActive = ToggleSupergroupUsernameIsActive
  { -- | Pass true to activate the username; pass false to disable it
    is_active :: Maybe Bool,
    -- | The username to change
    username :: Maybe String,
    -- | Identifier of the supergroup or channel
    supergroup_id :: Maybe Int
  }
  deriving (Eq)

instance Show ToggleSupergroupUsernameIsActive where
  show
    ToggleSupergroupUsernameIsActive
      { is_active = is_active_,
        username = username_,
        supergroup_id = supergroup_id_
      } =
      "ToggleSupergroupUsernameIsActive"
        ++ U.cc
          [ U.p "is_active" is_active_,
            U.p "username" username_,
            U.p "supergroup_id" supergroup_id_
          ]

instance T.ToJSON ToggleSupergroupUsernameIsActive where
  toJSON
    ToggleSupergroupUsernameIsActive
      { is_active = is_active_,
        username = username_,
        supergroup_id = supergroup_id_
      } =
      A.object
        [ "@type" A..= T.String "toggleSupergroupUsernameIsActive",
          "is_active" A..= is_active_,
          "username" A..= username_,
          "supergroup_id" A..= supergroup_id_
        ]
