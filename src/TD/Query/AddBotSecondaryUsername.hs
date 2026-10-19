module TD.Query.AddBotSecondaryUsername
  (AddBotSecondaryUsername(..)
  , defaultAddBotSecondaryUsername
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Adds a secondary username to a bot. Can be called only if userTypeBot.can_be_edited, the bot has no secondary username and the current user has Telegram Premium subscription. May return an error with a message "OWNER_USERNAMES_LIMIT_EXCEEDED" if the current user already owns at least getOption("secondary_bot_username_count_max") bots with a secondary username. Returns 'TD.Data.Ok.Ok'
data AddBotSecondaryUsername
  = AddBotSecondaryUsername
    { bot_user_id :: Maybe Int    -- ^ Identifier of the target bot
    , username    :: Maybe T.Text -- ^ The new secondary username; must be non-empty. Use checkBotUsername to check username validness
    }
  deriving (Eq, Show)

instance I.ShortShow AddBotSecondaryUsername where
  shortShow
    AddBotSecondaryUsername
      { bot_user_id = bot_user_id_
      , username    = username_
      }
        = "AddBotSecondaryUsername"
          ++ I.cc
          [ "bot_user_id" `I.p` bot_user_id_
          , "username"    `I.p` username_
          ]

instance AT.ToJSON AddBotSecondaryUsername where
  toJSON
    AddBotSecondaryUsername
      { bot_user_id = bot_user_id_
      , username    = username_
      }
        = A.object
          [ "@type"       A..= AT.String "addBotSecondaryUsername"
          , "bot_user_id" A..= bot_user_id_
          , "username"    A..= username_
          ]

defaultAddBotSecondaryUsername :: AddBotSecondaryUsername
defaultAddBotSecondaryUsername =
  AddBotSecondaryUsername
    { bot_user_id = Nothing
    , username    = Nothing
    }

