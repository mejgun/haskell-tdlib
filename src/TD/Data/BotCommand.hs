module TD.Data.BotCommand where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data BotCommand
  = BotCommand -- ^ Represents a command supported by a bot
    { command     :: Maybe T.Text -- ^ Text of the bot command
    , description :: Maybe T.Text
    }
  deriving (Eq)

instance Show BotCommand where
  show BotCommand
    { command     = command_
    , description = description_
    }
      = "BotCommand"
        ++ I.cc
        [ "command"     `I.p` command_
        , "description" `I.p` description_
        ]

instance AT.FromJSON BotCommand where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "botCommand" -> parseBotCommand v
      _            -> mempty
    
    where
      parseBotCommand :: A.Value -> AT.Parser BotCommand
      parseBotCommand = A.withObject "BotCommand" $ \o -> do
        command_     <- o A..:?  "command"
        description_ <- o A..:?  "description"
        pure $ BotCommand
          { command     = command_
          , description = description_
          }

instance AT.ToJSON BotCommand where
  toJSON BotCommand
    { command     = command_
    , description = description_
    }
      = A.object
        [ "@type"       A..= AT.String "botCommand"
        , "command"     A..= command_
        , "description" A..= description_
        ]
