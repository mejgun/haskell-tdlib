module TD.Data.Usernames
  (Usernames(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data Usernames
  = Usernames -- ^ Describes usernames assigned to a user, a supergroup, or a channel
    { active_usernames      :: Maybe [T.Text] -- ^ List of active usernames; the first one must be shown as the primary username. The order of active usernames can be changed with reorderActiveUsernames, reorderBotActiveUsernames or reorderSupergroupActiveUsernames
    , disabled_usernames    :: Maybe [T.Text] -- ^ List of currently disabled usernames; the username can be activated with toggleUsernameIsActive, toggleBotUsernameIsActive, or toggleSupergroupUsernameIsActive
    , editable_username     :: Maybe T.Text   -- ^ Active or disabled username, which may be changed with setUsername or setSupergroupUsername
    , collectible_usernames :: Maybe [T.Text] -- ^ Collectible usernames that were purchased at https://fragment.com and can be passed to getCollectibleItemInfo for more details
    }
  deriving (Eq, Show)

instance I.ShortShow Usernames where
  shortShow Usernames
    { active_usernames      = active_usernames_
    , disabled_usernames    = disabled_usernames_
    , editable_username     = editable_username_
    , collectible_usernames = collectible_usernames_
    }
      = "Usernames"
        ++ I.cc
        [ "active_usernames"      `I.p` active_usernames_
        , "disabled_usernames"    `I.p` disabled_usernames_
        , "editable_username"     `I.p` editable_username_
        , "collectible_usernames" `I.p` collectible_usernames_
        ]

instance AT.FromJSON Usernames where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "usernames" -> parseUsernames v
      _           -> mempty
    
    where
      parseUsernames :: A.Value -> AT.Parser Usernames
      parseUsernames = A.withObject "Usernames" $ \o -> do
        active_usernames_      <- o A..:?  "active_usernames"
        disabled_usernames_    <- o A..:?  "disabled_usernames"
        editable_username_     <- o A..:?  "editable_username"
        collectible_usernames_ <- o A..:?  "collectible_usernames"
        pure $ Usernames
          { active_usernames      = active_usernames_
          , disabled_usernames    = disabled_usernames_
          , editable_username     = editable_username_
          , collectible_usernames = collectible_usernames_
          }
  parseJSON _ = mempty

