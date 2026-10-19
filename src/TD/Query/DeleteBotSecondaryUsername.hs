module TD.Query.DeleteBotSecondaryUsername
  (DeleteBotSecondaryUsername(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Removes a secondary username from a bot. Can be called only if userTypeBot.can_be_edited == true and the bot has a secondary username. Returns 'TD.Data.Ok.Ok'
data DeleteBotSecondaryUsername
  = DeleteBotSecondaryUsername
    { bot_user_id :: Maybe Int -- ^ Identifier of the target bot
    }
  deriving (Eq, Show)

instance I.ShortShow DeleteBotSecondaryUsername where
  shortShow
    DeleteBotSecondaryUsername
      { bot_user_id = bot_user_id_
      }
        = "DeleteBotSecondaryUsername"
          ++ I.cc
          [ "bot_user_id" `I.p` bot_user_id_
          ]

instance AT.ToJSON DeleteBotSecondaryUsername where
  toJSON
    DeleteBotSecondaryUsername
      { bot_user_id = bot_user_id_
      }
        = A.object
          [ "@type"       A..= AT.String "deleteBotSecondaryUsername"
          , "bot_user_id" A..= bot_user_id_
          ]

