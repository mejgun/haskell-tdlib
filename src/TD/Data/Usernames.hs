{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.Usernames where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data Usernames = -- | Describes usernames assigned to a user, a supergroup, or a channel
  Usernames
  { -- | The active username, which can be changed with setUsername or setSupergroupUsername
    editable_username :: Maybe String,
    -- | List of currently disabled usernames; the username can be activated with toggleUsernameIsActive, toggleBotUsernameIsActive, or toggleSupergroupUsernameIsActive
    disabled_usernames :: Maybe [String],
    -- | List of active usernames; the first one must be shown as the primary username. The order of active usernames can be changed with reorderActiveUsernames, reorderBotActiveUsernames or reorderSupergroupActiveUsernames
    active_usernames :: Maybe [String]
  }
  deriving (Eq)

instance Show Usernames where
  show
    Usernames
      { editable_username = editable_username_,
        disabled_usernames = disabled_usernames_,
        active_usernames = active_usernames_
      } =
      "Usernames"
        ++ U.cc
          [ U.p "editable_username" editable_username_,
            U.p "disabled_usernames" disabled_usernames_,
            U.p "active_usernames" active_usernames_
          ]

instance T.FromJSON Usernames where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "usernames" -> parseUsernames v
      _ -> mempty
    where
      parseUsernames :: A.Value -> T.Parser Usernames
      parseUsernames = A.withObject "Usernames" $ \o -> do
        editable_username_ <- o A..:? "editable_username"
        disabled_usernames_ <- o A..:? "disabled_usernames"
        active_usernames_ <- o A..:? "active_usernames"
        return $ Usernames {editable_username = editable_username_, disabled_usernames = disabled_usernames_, active_usernames = active_usernames_}
  parseJSON _ = mempty

instance T.ToJSON Usernames where
  toJSON
    Usernames
      { editable_username = editable_username_,
        disabled_usernames = disabled_usernames_,
        active_usernames = active_usernames_
      } =
      A.object
        [ "@type" A..= T.String "usernames",
          "editable_username" A..= editable_username_,
          "disabled_usernames" A..= disabled_usernames_,
          "active_usernames" A..= active_usernames_
        ]
