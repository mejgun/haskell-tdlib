module TD.Data.BotCommands
  (BotCommands(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.BotCommand as BotCommand

data BotCommands
  = BotCommands -- ^ Contains a list of bot commands
    { bot_user_id :: Maybe Int                     -- ^ Bot's user identifier
    , commands    :: Maybe [BotCommand.BotCommand] -- ^ List of bot commands
    }
  deriving (Eq, Show)

instance I.ShortShow BotCommands where
  shortShow BotCommands
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

