module TD.Data.BotCommand
  ( BotCommand(..)    
  , defaultBotCommand 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data BotCommand
  = BotCommand -- ^ Represents a command supported by a bot
    { command      :: Maybe T.Text -- ^ Text of the bot command
    , description  :: Maybe T.Text -- ^ Description of the bot command
    , is_ephemeral :: Maybe Bool   -- ^ True, if the command must send an ephemeral message instead of a regular one
    }
  deriving (Eq, Show)

instance I.ShortShow BotCommand where
  shortShow BotCommand
    { command      = command_
    , description  = description_
    , is_ephemeral = is_ephemeral_
    }
      = "BotCommand"
        ++ I.cc
        [ "command"      `I.p` command_
        , "description"  `I.p` description_
        , "is_ephemeral" `I.p` is_ephemeral_
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
        command_      <- o A..:?  "command"
        description_  <- o A..:?  "description"
        is_ephemeral_ <- o A..:?  "is_ephemeral"
        pure $ BotCommand
          { command      = command_
          , description  = description_
          , is_ephemeral = is_ephemeral_
          }
  parseJSON _ = mempty

instance AT.ToJSON BotCommand where
  toJSON BotCommand
    { command      = command_
    , description  = description_
    , is_ephemeral = is_ephemeral_
    }
      = A.object
        [ "@type"        A..= AT.String "botCommand"
        , "command"      A..= command_
        , "description"  A..= description_
        , "is_ephemeral" A..= is_ephemeral_
        ]

defaultBotCommand :: BotCommand
defaultBotCommand =
  BotCommand
    { command      = Nothing
    , description  = Nothing
    , is_ephemeral = Nothing
    }

