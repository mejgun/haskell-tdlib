{-# LANGUAGE OverloadedStrings #-}

module TD.Query.OpenWebApp where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.ThemeParameters as ThemeParameters
import qualified Utils as U

-- |
-- Informs TDLib that a web app is being opened from attachment menu, a botMenuButton button, an internalLinkTypeAttachmentMenuBot link, or an inlineKeyboardButtonTypeWebApp button.
-- For each bot, a confirmation alert about data sent to the bot must be shown once
data OpenWebApp = OpenWebApp
  { -- | Identifier of the replied message for the message sent by the web app; 0 if none
    reply_to_message_id :: Maybe Int,
    -- | Preferred web app theme; pass null to use the default theme
    theme :: Maybe ThemeParameters.ThemeParameters,
    -- | The URL from an inlineKeyboardButtonTypeWebApp button, a botMenuButton button, or an internalLinkTypeAttachmentMenuBot link, or an empty string otherwise
    url :: Maybe String,
    -- | Identifier of the bot, providing the web app
    bot_user_id :: Maybe Int,
    -- | Identifier of the chat in which the web app is opened. Web apps can be opened only in private chats for now
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show OpenWebApp where
  show
    OpenWebApp
      { reply_to_message_id = reply_to_message_id,
        theme = theme,
        url = url,
        bot_user_id = bot_user_id,
        chat_id = chat_id
      } =
      "OpenWebApp"
        ++ U.cc
          [ U.p "reply_to_message_id" reply_to_message_id,
            U.p "theme" theme,
            U.p "url" url,
            U.p "bot_user_id" bot_user_id,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON OpenWebApp where
  toJSON
    OpenWebApp
      { reply_to_message_id = reply_to_message_id,
        theme = theme,
        url = url,
        bot_user_id = bot_user_id,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "openWebApp",
          "reply_to_message_id" A..= reply_to_message_id,
          "theme" A..= theme,
          "url" A..= url,
          "bot_user_id" A..= bot_user_id,
          "chat_id" A..= chat_id
        ]
