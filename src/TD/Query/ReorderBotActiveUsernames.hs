module TD.Query.ReorderBotActiveUsernames(ReorderBotActiveUsernames(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data ReorderBotActiveUsernames -- ^ Changes order of active usernames of a bot. Can be called only if userTypeBot.can_be_edited == true
  = ReorderBotActiveUsernames
    { bot_user_id :: Maybe Int      -- ^ Identifier of the target bot
    , usernames   :: Maybe [T.Text] -- ^ The new order of active usernames. All currently active usernames must be specified
    }
  deriving (Eq)

instance Show ReorderBotActiveUsernames where
  show
    ReorderBotActiveUsernames
      { bot_user_id = bot_user_id_
      , usernames   = usernames_
      }
        = "ReorderBotActiveUsernames"
          ++ I.cc
          [ "bot_user_id" `I.p` bot_user_id_
          , "usernames"   `I.p` usernames_
          ]

instance AT.ToJSON ReorderBotActiveUsernames where
  toJSON
    ReorderBotActiveUsernames
      { bot_user_id = bot_user_id_
      , usernames   = usernames_
      }
        = A.object
          [ "@type"       A..= AT.String "reorderBotActiveUsernames"
          , "bot_user_id" A..= bot_user_id_
          , "usernames"   A..= usernames_
          ]
