{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ToggleUsernameIsActive where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Changes active state for a username of the current user. The editable username can't be disabled. May return an error with a message "USERNAMES_ACTIVE_TOO_MUCH" if the maximum number of active usernames has been reached @username The username to change @is_active Pass true to activate the username; pass false to disable it
data ToggleUsernameIsActive = ToggleUsernameIsActive
  { -- |
    is_active :: Maybe Bool,
    -- |
    username :: Maybe String
  }
  deriving (Eq)

instance Show ToggleUsernameIsActive where
  show
    ToggleUsernameIsActive
      { is_active = is_active_,
        username = username_
      } =
      "ToggleUsernameIsActive"
        ++ U.cc
          [ U.p "is_active" is_active_,
            U.p "username" username_
          ]

instance T.ToJSON ToggleUsernameIsActive where
  toJSON
    ToggleUsernameIsActive
      { is_active = is_active_,
        username = username_
      } =
      A.object
        [ "@type" A..= T.String "toggleUsernameIsActive",
          "is_active" A..= is_active_,
          "username" A..= username_
        ]
