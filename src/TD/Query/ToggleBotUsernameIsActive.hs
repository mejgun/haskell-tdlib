module TD.Query.ToggleBotUsernameIsActive
  (ToggleBotUsernameIsActive(..)
  , defaultToggleBotUsernameIsActive
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Changes active state for a username of a bot. The editable username can't be disabled. May return an error with a message "USERNAMES_ACTIVE_TOO_MUCH" if the maximum number of active usernames has been reached. Can be called only if userTypeBot.can_be_edited == true. Returns 'TD.Data.Ok.Ok'
data ToggleBotUsernameIsActive
  = ToggleBotUsernameIsActive
    { bot_user_id :: Maybe Int    -- ^ Identifier of the target bot
    , username    :: Maybe T.Text -- ^ The username to change
    , is_active   :: Maybe Bool   -- ^ Pass true to activate the username; pass false to disable it
    }
  deriving (Eq, Show)

instance I.ShortShow ToggleBotUsernameIsActive where
  shortShow
    ToggleBotUsernameIsActive
      { bot_user_id = bot_user_id_
      , username    = username_
      , is_active   = is_active_
      }
        = "ToggleBotUsernameIsActive"
          ++ I.cc
          [ "bot_user_id" `I.p` bot_user_id_
          , "username"    `I.p` username_
          , "is_active"   `I.p` is_active_
          ]

instance AT.ToJSON ToggleBotUsernameIsActive where
  toJSON
    ToggleBotUsernameIsActive
      { bot_user_id = bot_user_id_
      , username    = username_
      , is_active   = is_active_
      }
        = A.object
          [ "@type"       A..= AT.String "toggleBotUsernameIsActive"
          , "bot_user_id" A..= bot_user_id_
          , "username"    A..= username_
          , "is_active"   A..= is_active_
          ]

defaultToggleBotUsernameIsActive :: ToggleBotUsernameIsActive
defaultToggleBotUsernameIsActive =
  ToggleBotUsernameIsActive
    { bot_user_id = Nothing
    , username    = Nothing
    , is_active   = Nothing
    }

