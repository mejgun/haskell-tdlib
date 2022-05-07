{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.BotMenuButton where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

data BotMenuButton = -- | Describes a button to be shown instead of bot commands menu button @text Text of the button @url URL to be passed to openWebApp
  BotMenuButton
  { -- |
    url :: Maybe String,
    -- |
    text :: Maybe String
  }
  deriving (Eq)

instance Show BotMenuButton where
  show
    BotMenuButton
      { url = url,
        text = text
      } =
      "BotMenuButton"
        ++ U.cc
          [ U.p "url" url,
            U.p "text" text
          ]

instance T.FromJSON BotMenuButton where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "botMenuButton" -> parseBotMenuButton v
      _ -> fail ""
    where
      parseBotMenuButton :: A.Value -> T.Parser BotMenuButton
      parseBotMenuButton = A.withObject "BotMenuButton" $ \o -> do
        url_ <- o A..:? "url"
        text_ <- o A..:? "text"
        return $ BotMenuButton {url = url_, text = text_}
  parseJSON _ = fail ""

instance T.ToJSON BotMenuButton where
  toJSON
    BotMenuButton
      { url = url,
        text = text
      } =
      A.object
        [ "@type" A..= T.String "botMenuButton",
          "url" A..= url,
          "text" A..= text
        ]
