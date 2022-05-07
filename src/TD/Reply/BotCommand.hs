{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.BotCommand where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

data BotCommand = -- | Represents a command supported by a bot @command Text of the bot command @param_description Description of the bot command
  BotCommand
  { -- |
    description :: Maybe String,
    -- |
    command :: Maybe String
  }
  deriving (Eq)

instance Show BotCommand where
  show
    BotCommand
      { description = description,
        command = command
      } =
      "BotCommand"
        ++ U.cc
          [ U.p "description" description,
            U.p "command" command
          ]

instance T.FromJSON BotCommand where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "botCommand" -> parseBotCommand v
      _ -> fail ""
    where
      parseBotCommand :: A.Value -> T.Parser BotCommand
      parseBotCommand = A.withObject "BotCommand" $ \o -> do
        description_ <- o A..:? "description"
        command_ <- o A..:? "command"
        return $ BotCommand {description = description_, command = command_}
  parseJSON _ = fail ""

instance T.ToJSON BotCommand where
  toJSON
    BotCommand
      { description = description,
        command = command
      } =
      A.object
        [ "@type" A..= T.String "botCommand",
          "description" A..= description,
          "command" A..= command
        ]
