module TD.Data.BotCommands
  ( BotCommands(..)    
  , defaultBotCommands 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.BotCommand as BotCommand

data BotCommands
  = BotCommands -- ^ Contains a list of bot commands
    { bot_user_id :: Maybe Int                     -- ^ Bot's user identifier
    , commands    :: Maybe [BotCommand.BotCommand] -- ^ List of bot commands
    }
  deriving (Eq)

instance Show BotCommands where
  show BotCommands
    { bot_user_id = bot_user_id_
    , commands    = commands_
    }
      = "BotCommands"
        ++ I.cc
        [ "bot_user_id" `I.p` bot_user_id_
        , "commands"    `I.p` commands_
        ]

instance AT.FromJSON BotCommands where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "botCommands" -> parseBotCommands v
      _             -> mempty
    
    where
      parseBotCommands :: A.Value -> AT.Parser BotCommands
      parseBotCommands = A.withObject "BotCommands" $ \o -> do
        bot_user_id_ <- o A..:?  "bot_user_id"
        commands_    <- o A..:?  "commands"
        pure $ BotCommands
          { bot_user_id = bot_user_id_
          , commands    = commands_
          }
  parseJSON _ = mempty

instance AT.ToJSON BotCommands where
  toJSON BotCommands
    { bot_user_id = bot_user_id_
    , commands    = commands_
    }
      = A.object
        [ "@type"       A..= AT.String "botCommands"
        , "bot_user_id" A..= bot_user_id_
        , "commands"    A..= commands_
        ]

defaultBotCommands :: BotCommands
defaultBotCommands =
  BotCommands
    { bot_user_id = Nothing
    , commands    = Nothing
    }

