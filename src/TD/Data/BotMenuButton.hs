{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.BotMenuButton where

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
      { url = url_,
        text = text_
      } =
      "BotMenuButton"
        ++ U.cc
          [ U.p "url" url_,
            U.p "text" text_
          ]

instance T.FromJSON BotMenuButton where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "botMenuButton" -> parseBotMenuButton v
      _ -> mempty
    where
      parseBotMenuButton :: A.Value -> T.Parser BotMenuButton
      parseBotMenuButton = A.withObject "BotMenuButton" $ \o -> do
        url_ <- o A..:? "url"
        text_ <- o A..:? "text"
        return $ BotMenuButton {url = url_, text = text_}
  parseJSON _ = mempty

instance T.ToJSON BotMenuButton where
  toJSON
    BotMenuButton
      { url = url_,
        text = text_
      } =
      A.object
        [ "@type" A..= T.String "botMenuButton",
          "url" A..= url_,
          "text" A..= text_
        ]
