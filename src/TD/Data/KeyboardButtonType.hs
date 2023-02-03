{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.KeyboardButtonType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatAdministratorRights as ChatAdministratorRights
import qualified Utils as U

-- | Describes a keyboard button type
data KeyboardButtonType
  = -- | A simple button, with text that must be sent when the button is pressed
    KeyboardButtonTypeText
  | -- | A button that sends the user's phone number when pressed; available only in private chats
    KeyboardButtonTypeRequestPhoneNumber
  | -- | A button that sends the user's location when pressed; available only in private chats
    KeyboardButtonTypeRequestLocation
  | -- | A button that allows the user to create and send a poll when pressed; available only in private chats @force_regular If true, only regular polls must be allowed to create @force_quiz If true, only polls in quiz mode must be allowed to create
    KeyboardButtonTypeRequestPoll
      { -- |
        force_quiz :: Maybe Bool,
        -- |
        force_regular :: Maybe Bool
      }
  | -- | A button that requests a user to be shared by the current user; available only in private chats. Use the method shareUserWithBot to complete the request
    KeyboardButtonTypeRequestUser
      { -- | True, if the shared user must be a Telegram Premium user; otherwise, the shared user must no be a Telegram Premium user. Ignored if restrict_user_is_premium is false
        user_is_premium :: Maybe Bool,
        -- | True, if the shared user must or must not be a Telegram Premium user
        restrict_user_is_premium :: Maybe Bool,
        -- | True, if the shared user must be a bot; otherwise, the shared user must no be a bot. Ignored if restrict_user_is_bot is false
        user_is_bot :: Maybe Bool,
        -- | True, if the shared user must or must not be a bot
        restrict_user_is_bot :: Maybe Bool,
        -- | Unique button identifier
        _id :: Maybe Int
      }
  | -- | A button that requests a chat to be shared by the current user; available only in private chats. Use the method shareChatWithBot to complete the request
    KeyboardButtonTypeRequestChat
      { -- | True, if the bot must be a member of the chat; for basic group and supergroup chats only
        bot_is_member :: Maybe Bool,
        -- | Expected bot administrator rights in the chat; may be null if they aren't restricted
        bot_administrator_rights :: Maybe ChatAdministratorRights.ChatAdministratorRights,
        -- | Expected user administrator rights in the chat; may be null if they aren't restricted
        user_administrator_rights :: Maybe ChatAdministratorRights.ChatAdministratorRights,
        -- | True, if the chat must be created by the current user
        chat_is_created :: Maybe Bool,
        -- | True, if the chat must have a username; otherwise, the chat must not have a username. Ignored if restrict_chat_has_username is false
        chat_has_username :: Maybe Bool,
        -- | True, if the chat must or must not have a username
        restrict_chat_has_username :: Maybe Bool,
        -- | True, if the chat must be a forum supergroup; otherwise, the chat must not be a forum supergroup. Ignored if restrict_chat_is_forum is false
        chat_is_forum :: Maybe Bool,
        -- | True, if the chat must or must not be a forum supergroup
        restrict_chat_is_forum :: Maybe Bool,
        -- | True, if the chat must be a channel; otherwise, a basic group or a supergroup chat is shared
        chat_is_channel :: Maybe Bool,
        -- | Unique button identifier
        _id :: Maybe Int
      }
  | -- | A button that opens a Web App by calling getWebAppUrl @url An HTTP URL to pass to getWebAppUrl
    KeyboardButtonTypeWebApp
      { -- |
        url :: Maybe String
      }
  deriving (Eq)

instance Show KeyboardButtonType where
  show KeyboardButtonTypeText =
    "KeyboardButtonTypeText"
      ++ U.cc
        []
  show KeyboardButtonTypeRequestPhoneNumber =
    "KeyboardButtonTypeRequestPhoneNumber"
      ++ U.cc
        []
  show KeyboardButtonTypeRequestLocation =
    "KeyboardButtonTypeRequestLocation"
      ++ U.cc
        []
  show
    KeyboardButtonTypeRequestPoll
      { force_quiz = force_quiz_,
        force_regular = force_regular_
      } =
      "KeyboardButtonTypeRequestPoll"
        ++ U.cc
          [ U.p "force_quiz" force_quiz_,
            U.p "force_regular" force_regular_
          ]
  show
    KeyboardButtonTypeRequestUser
      { user_is_premium = user_is_premium_,
        restrict_user_is_premium = restrict_user_is_premium_,
        user_is_bot = user_is_bot_,
        restrict_user_is_bot = restrict_user_is_bot_,
        _id = _id_
      } =
      "KeyboardButtonTypeRequestUser"
        ++ U.cc
          [ U.p "user_is_premium" user_is_premium_,
            U.p "restrict_user_is_premium" restrict_user_is_premium_,
            U.p "user_is_bot" user_is_bot_,
            U.p "restrict_user_is_bot" restrict_user_is_bot_,
            U.p "_id" _id_
          ]
  show
    KeyboardButtonTypeRequestChat
      { bot_is_member = bot_is_member_,
        bot_administrator_rights = bot_administrator_rights_,
        user_administrator_rights = user_administrator_rights_,
        chat_is_created = chat_is_created_,
        chat_has_username = chat_has_username_,
        restrict_chat_has_username = restrict_chat_has_username_,
        chat_is_forum = chat_is_forum_,
        restrict_chat_is_forum = restrict_chat_is_forum_,
        chat_is_channel = chat_is_channel_,
        _id = _id_
      } =
      "KeyboardButtonTypeRequestChat"
        ++ U.cc
          [ U.p "bot_is_member" bot_is_member_,
            U.p "bot_administrator_rights" bot_administrator_rights_,
            U.p "user_administrator_rights" user_administrator_rights_,
            U.p "chat_is_created" chat_is_created_,
            U.p "chat_has_username" chat_has_username_,
            U.p "restrict_chat_has_username" restrict_chat_has_username_,
            U.p "chat_is_forum" chat_is_forum_,
            U.p "restrict_chat_is_forum" restrict_chat_is_forum_,
            U.p "chat_is_channel" chat_is_channel_,
            U.p "_id" _id_
          ]
  show
    KeyboardButtonTypeWebApp
      { url = url_
      } =
      "KeyboardButtonTypeWebApp"
        ++ U.cc
          [ U.p "url" url_
          ]

instance T.FromJSON KeyboardButtonType where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "keyboardButtonTypeText" -> parseKeyboardButtonTypeText v
      "keyboardButtonTypeRequestPhoneNumber" -> parseKeyboardButtonTypeRequestPhoneNumber v
      "keyboardButtonTypeRequestLocation" -> parseKeyboardButtonTypeRequestLocation v
      "keyboardButtonTypeRequestPoll" -> parseKeyboardButtonTypeRequestPoll v
      "keyboardButtonTypeRequestUser" -> parseKeyboardButtonTypeRequestUser v
      "keyboardButtonTypeRequestChat" -> parseKeyboardButtonTypeRequestChat v
      "keyboardButtonTypeWebApp" -> parseKeyboardButtonTypeWebApp v
      _ -> mempty
    where
      parseKeyboardButtonTypeText :: A.Value -> T.Parser KeyboardButtonType
      parseKeyboardButtonTypeText = A.withObject "KeyboardButtonTypeText" $ \_ -> return KeyboardButtonTypeText

      parseKeyboardButtonTypeRequestPhoneNumber :: A.Value -> T.Parser KeyboardButtonType
      parseKeyboardButtonTypeRequestPhoneNumber = A.withObject "KeyboardButtonTypeRequestPhoneNumber" $ \_ -> return KeyboardButtonTypeRequestPhoneNumber

      parseKeyboardButtonTypeRequestLocation :: A.Value -> T.Parser KeyboardButtonType
      parseKeyboardButtonTypeRequestLocation = A.withObject "KeyboardButtonTypeRequestLocation" $ \_ -> return KeyboardButtonTypeRequestLocation

      parseKeyboardButtonTypeRequestPoll :: A.Value -> T.Parser KeyboardButtonType
      parseKeyboardButtonTypeRequestPoll = A.withObject "KeyboardButtonTypeRequestPoll" $ \o -> do
        force_quiz_ <- o A..:? "force_quiz"
        force_regular_ <- o A..:? "force_regular"
        return $ KeyboardButtonTypeRequestPoll {force_quiz = force_quiz_, force_regular = force_regular_}

      parseKeyboardButtonTypeRequestUser :: A.Value -> T.Parser KeyboardButtonType
      parseKeyboardButtonTypeRequestUser = A.withObject "KeyboardButtonTypeRequestUser" $ \o -> do
        user_is_premium_ <- o A..:? "user_is_premium"
        restrict_user_is_premium_ <- o A..:? "restrict_user_is_premium"
        user_is_bot_ <- o A..:? "user_is_bot"
        restrict_user_is_bot_ <- o A..:? "restrict_user_is_bot"
        _id_ <- o A..:? "id"
        return $ KeyboardButtonTypeRequestUser {user_is_premium = user_is_premium_, restrict_user_is_premium = restrict_user_is_premium_, user_is_bot = user_is_bot_, restrict_user_is_bot = restrict_user_is_bot_, _id = _id_}

      parseKeyboardButtonTypeRequestChat :: A.Value -> T.Parser KeyboardButtonType
      parseKeyboardButtonTypeRequestChat = A.withObject "KeyboardButtonTypeRequestChat" $ \o -> do
        bot_is_member_ <- o A..:? "bot_is_member"
        bot_administrator_rights_ <- o A..:? "bot_administrator_rights"
        user_administrator_rights_ <- o A..:? "user_administrator_rights"
        chat_is_created_ <- o A..:? "chat_is_created"
        chat_has_username_ <- o A..:? "chat_has_username"
        restrict_chat_has_username_ <- o A..:? "restrict_chat_has_username"
        chat_is_forum_ <- o A..:? "chat_is_forum"
        restrict_chat_is_forum_ <- o A..:? "restrict_chat_is_forum"
        chat_is_channel_ <- o A..:? "chat_is_channel"
        _id_ <- o A..:? "id"
        return $ KeyboardButtonTypeRequestChat {bot_is_member = bot_is_member_, bot_administrator_rights = bot_administrator_rights_, user_administrator_rights = user_administrator_rights_, chat_is_created = chat_is_created_, chat_has_username = chat_has_username_, restrict_chat_has_username = restrict_chat_has_username_, chat_is_forum = chat_is_forum_, restrict_chat_is_forum = restrict_chat_is_forum_, chat_is_channel = chat_is_channel_, _id = _id_}

      parseKeyboardButtonTypeWebApp :: A.Value -> T.Parser KeyboardButtonType
      parseKeyboardButtonTypeWebApp = A.withObject "KeyboardButtonTypeWebApp" $ \o -> do
        url_ <- o A..:? "url"
        return $ KeyboardButtonTypeWebApp {url = url_}
  parseJSON _ = mempty

instance T.ToJSON KeyboardButtonType where
  toJSON KeyboardButtonTypeText =
    A.object
      [ "@type" A..= T.String "keyboardButtonTypeText"
      ]
  toJSON KeyboardButtonTypeRequestPhoneNumber =
    A.object
      [ "@type" A..= T.String "keyboardButtonTypeRequestPhoneNumber"
      ]
  toJSON KeyboardButtonTypeRequestLocation =
    A.object
      [ "@type" A..= T.String "keyboardButtonTypeRequestLocation"
      ]
  toJSON
    KeyboardButtonTypeRequestPoll
      { force_quiz = force_quiz_,
        force_regular = force_regular_
      } =
      A.object
        [ "@type" A..= T.String "keyboardButtonTypeRequestPoll",
          "force_quiz" A..= force_quiz_,
          "force_regular" A..= force_regular_
        ]
  toJSON
    KeyboardButtonTypeRequestUser
      { user_is_premium = user_is_premium_,
        restrict_user_is_premium = restrict_user_is_premium_,
        user_is_bot = user_is_bot_,
        restrict_user_is_bot = restrict_user_is_bot_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "keyboardButtonTypeRequestUser",
          "user_is_premium" A..= user_is_premium_,
          "restrict_user_is_premium" A..= restrict_user_is_premium_,
          "user_is_bot" A..= user_is_bot_,
          "restrict_user_is_bot" A..= restrict_user_is_bot_,
          "id" A..= _id_
        ]
  toJSON
    KeyboardButtonTypeRequestChat
      { bot_is_member = bot_is_member_,
        bot_administrator_rights = bot_administrator_rights_,
        user_administrator_rights = user_administrator_rights_,
        chat_is_created = chat_is_created_,
        chat_has_username = chat_has_username_,
        restrict_chat_has_username = restrict_chat_has_username_,
        chat_is_forum = chat_is_forum_,
        restrict_chat_is_forum = restrict_chat_is_forum_,
        chat_is_channel = chat_is_channel_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "keyboardButtonTypeRequestChat",
          "bot_is_member" A..= bot_is_member_,
          "bot_administrator_rights" A..= bot_administrator_rights_,
          "user_administrator_rights" A..= user_administrator_rights_,
          "chat_is_created" A..= chat_is_created_,
          "chat_has_username" A..= chat_has_username_,
          "restrict_chat_has_username" A..= restrict_chat_has_username_,
          "chat_is_forum" A..= chat_is_forum_,
          "restrict_chat_is_forum" A..= restrict_chat_is_forum_,
          "chat_is_channel" A..= chat_is_channel_,
          "id" A..= _id_
        ]
  toJSON
    KeyboardButtonTypeWebApp
      { url = url_
      } =
      A.object
        [ "@type" A..= T.String "keyboardButtonTypeWebApp",
          "url" A..= url_
        ]
