module TD.Data.KeyboardButtonType
  (KeyboardButtonType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatAdministratorRights as ChatAdministratorRights
import qualified Data.Text as T

-- | Describes a keyboard button type
data KeyboardButtonType
  = KeyboardButtonTypeText -- ^ A simple button, with text that must be sent when the button is pressed
  | KeyboardButtonTypeRequestPhoneNumber -- ^ A button that sends the user's phone number when pressed; available only in private chats
  | KeyboardButtonTypeRequestLocation -- ^ A button that sends the user's location when pressed; available only in private chats
  | KeyboardButtonTypeRequestPoll -- ^ A button that allows the user to create and send a poll when pressed; available only in private chats
    { force_regular :: Maybe Bool -- ^ If true, only regular polls must be allowed to create
    , force_quiz    :: Maybe Bool -- ^ If true, only polls in quiz mode must be allowed to create
    }
  | KeyboardButtonTypeRequestUsers -- ^ A button that requests users to be shared by the current user; available only in private chats. Use the method shareUsersWithBot to complete the request
    { _id                      :: Maybe Int  -- ^ Unique button identifier
    , restrict_user_is_bot     :: Maybe Bool -- ^ True, if the shared users must or must not be bots
    , user_is_bot              :: Maybe Bool -- ^ True, if the shared users must be bots; otherwise, the shared users must not be bots. Ignored if restrict_user_is_bot is false
    , restrict_user_is_premium :: Maybe Bool -- ^ True, if the shared users must or must not be Telegram Premium users
    , user_is_premium          :: Maybe Bool -- ^ True, if the shared users must be Telegram Premium users; otherwise, the shared users must not be Telegram Premium users. Ignored if restrict_user_is_premium is false
    , max_quantity             :: Maybe Int  -- ^ The maximum number of users to share
    , request_name             :: Maybe Bool -- ^ Pass true to request name of the users; bots only
    , request_username         :: Maybe Bool -- ^ Pass true to request username of the users; bots only
    , request_photo            :: Maybe Bool -- ^ Pass true to request photo of the users; bots only
    }
  | KeyboardButtonTypeRequestChat -- ^ A button that requests a chat to be shared by the current user; available only in private chats. Use the method shareChatWithBot to complete the request
    { _id                        :: Maybe Int                                             -- ^ Unique button identifier
    , chat_is_channel            :: Maybe Bool                                            -- ^ True, if the chat must be a channel; otherwise, a basic group or a supergroup chat is shared
    , restrict_chat_is_forum     :: Maybe Bool                                            -- ^ True, if the chat must or must not be a forum supergroup
    , chat_is_forum              :: Maybe Bool                                            -- ^ True, if the chat must be a forum supergroup; otherwise, the chat must not be a forum supergroup. Ignored if restrict_chat_is_forum is false
    , restrict_chat_has_username :: Maybe Bool                                            -- ^ True, if the chat must or must not have a username
    , chat_has_username          :: Maybe Bool                                            -- ^ True, if the chat must have a username; otherwise, the chat must not have a username. Ignored if restrict_chat_has_username is false
    , chat_is_created            :: Maybe Bool                                            -- ^ True, if the chat must be created by the current user
    , user_administrator_rights  :: Maybe ChatAdministratorRights.ChatAdministratorRights -- ^ Expected user administrator rights in the chat; may be null if they aren't restricted
    , bot_administrator_rights   :: Maybe ChatAdministratorRights.ChatAdministratorRights -- ^ Expected bot administrator rights in the chat; may be null if they aren't restricted
    , bot_is_member              :: Maybe Bool                                            -- ^ True, if the bot must be a member of the chat; for basic group and supergroup chats only
    , request_title              :: Maybe Bool                                            -- ^ Pass true to request title of the chat; bots only
    , request_username           :: Maybe Bool                                            -- ^ Pass true to request username of the chat; bots only
    , request_photo              :: Maybe Bool                                            -- ^ Pass true to request photo of the chat; bots only
    }
  | KeyboardButtonTypeWebApp -- ^ A button that opens a Web App by calling getWebAppUrl
    { url :: Maybe T.Text -- ^ An HTTP URL to pass to getWebAppUrl
    }
  deriving (Eq, Show)

instance I.ShortShow KeyboardButtonType where
  shortShow KeyboardButtonTypeText
      = "KeyboardButtonTypeText"
  shortShow KeyboardButtonTypeRequestPhoneNumber
      = "KeyboardButtonTypeRequestPhoneNumber"
  shortShow KeyboardButtonTypeRequestLocation
      = "KeyboardButtonTypeRequestLocation"
  shortShow KeyboardButtonTypeRequestPoll
    { force_regular = force_regular_
    , force_quiz    = force_quiz_
    }
      = "KeyboardButtonTypeRequestPoll"
        ++ I.cc
        [ "force_regular" `I.p` force_regular_
        , "force_quiz"    `I.p` force_quiz_
        ]
  shortShow KeyboardButtonTypeRequestUsers
    { _id                      = _id_
    , restrict_user_is_bot     = restrict_user_is_bot_
    , user_is_bot              = user_is_bot_
    , restrict_user_is_premium = restrict_user_is_premium_
    , user_is_premium          = user_is_premium_
    , max_quantity             = max_quantity_
    , request_name             = request_name_
    , request_username         = request_username_
    , request_photo            = request_photo_
    }
      = "KeyboardButtonTypeRequestUsers"
        ++ I.cc
        [ "_id"                      `I.p` _id_
        , "restrict_user_is_bot"     `I.p` restrict_user_is_bot_
        , "user_is_bot"              `I.p` user_is_bot_
        , "restrict_user_is_premium" `I.p` restrict_user_is_premium_
        , "user_is_premium"          `I.p` user_is_premium_
        , "max_quantity"             `I.p` max_quantity_
        , "request_name"             `I.p` request_name_
        , "request_username"         `I.p` request_username_
        , "request_photo"            `I.p` request_photo_
        ]
  shortShow KeyboardButtonTypeRequestChat
    { _id                        = _id_
    , chat_is_channel            = chat_is_channel_
    , restrict_chat_is_forum     = restrict_chat_is_forum_
    , chat_is_forum              = chat_is_forum_
    , restrict_chat_has_username = restrict_chat_has_username_
    , chat_has_username          = chat_has_username_
    , chat_is_created            = chat_is_created_
    , user_administrator_rights  = user_administrator_rights_
    , bot_administrator_rights   = bot_administrator_rights_
    , bot_is_member              = bot_is_member_
    , request_title              = request_title_
    , request_username           = request_username_
    , request_photo              = request_photo_
    }
      = "KeyboardButtonTypeRequestChat"
        ++ I.cc
        [ "_id"                        `I.p` _id_
        , "chat_is_channel"            `I.p` chat_is_channel_
        , "restrict_chat_is_forum"     `I.p` restrict_chat_is_forum_
        , "chat_is_forum"              `I.p` chat_is_forum_
        , "restrict_chat_has_username" `I.p` restrict_chat_has_username_
        , "chat_has_username"          `I.p` chat_has_username_
        , "chat_is_created"            `I.p` chat_is_created_
        , "user_administrator_rights"  `I.p` user_administrator_rights_
        , "bot_administrator_rights"   `I.p` bot_administrator_rights_
        , "bot_is_member"              `I.p` bot_is_member_
        , "request_title"              `I.p` request_title_
        , "request_username"           `I.p` request_username_
        , "request_photo"              `I.p` request_photo_
        ]
  shortShow KeyboardButtonTypeWebApp
    { url = url_
    }
      = "KeyboardButtonTypeWebApp"
        ++ I.cc
        [ "url" `I.p` url_
        ]

instance AT.FromJSON KeyboardButtonType where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "keyboardButtonTypeText"               -> pure KeyboardButtonTypeText
      "keyboardButtonTypeRequestPhoneNumber" -> pure KeyboardButtonTypeRequestPhoneNumber
      "keyboardButtonTypeRequestLocation"    -> pure KeyboardButtonTypeRequestLocation
      "keyboardButtonTypeRequestPoll"        -> parseKeyboardButtonTypeRequestPoll v
      "keyboardButtonTypeRequestUsers"       -> parseKeyboardButtonTypeRequestUsers v
      "keyboardButtonTypeRequestChat"        -> parseKeyboardButtonTypeRequestChat v
      "keyboardButtonTypeWebApp"             -> parseKeyboardButtonTypeWebApp v
      _                                      -> mempty
    
    where
      parseKeyboardButtonTypeRequestPoll :: A.Value -> AT.Parser KeyboardButtonType
      parseKeyboardButtonTypeRequestPoll = A.withObject "KeyboardButtonTypeRequestPoll" $ \o -> do
        force_regular_ <- o A..:?  "force_regular"
        force_quiz_    <- o A..:?  "force_quiz"
        pure $ KeyboardButtonTypeRequestPoll
          { force_regular = force_regular_
          , force_quiz    = force_quiz_
          }
      parseKeyboardButtonTypeRequestUsers :: A.Value -> AT.Parser KeyboardButtonType
      parseKeyboardButtonTypeRequestUsers = A.withObject "KeyboardButtonTypeRequestUsers" $ \o -> do
        _id_                      <- o A..:?  "id"
        restrict_user_is_bot_     <- o A..:?  "restrict_user_is_bot"
        user_is_bot_              <- o A..:?  "user_is_bot"
        restrict_user_is_premium_ <- o A..:?  "restrict_user_is_premium"
        user_is_premium_          <- o A..:?  "user_is_premium"
        max_quantity_             <- o A..:?  "max_quantity"
        request_name_             <- o A..:?  "request_name"
        request_username_         <- o A..:?  "request_username"
        request_photo_            <- o A..:?  "request_photo"
        pure $ KeyboardButtonTypeRequestUsers
          { _id                      = _id_
          , restrict_user_is_bot     = restrict_user_is_bot_
          , user_is_bot              = user_is_bot_
          , restrict_user_is_premium = restrict_user_is_premium_
          , user_is_premium          = user_is_premium_
          , max_quantity             = max_quantity_
          , request_name             = request_name_
          , request_username         = request_username_
          , request_photo            = request_photo_
          }
      parseKeyboardButtonTypeRequestChat :: A.Value -> AT.Parser KeyboardButtonType
      parseKeyboardButtonTypeRequestChat = A.withObject "KeyboardButtonTypeRequestChat" $ \o -> do
        _id_                        <- o A..:?  "id"
        chat_is_channel_            <- o A..:?  "chat_is_channel"
        restrict_chat_is_forum_     <- o A..:?  "restrict_chat_is_forum"
        chat_is_forum_              <- o A..:?  "chat_is_forum"
        restrict_chat_has_username_ <- o A..:?  "restrict_chat_has_username"
        chat_has_username_          <- o A..:?  "chat_has_username"
        chat_is_created_            <- o A..:?  "chat_is_created"
        user_administrator_rights_  <- o A..:?  "user_administrator_rights"
        bot_administrator_rights_   <- o A..:?  "bot_administrator_rights"
        bot_is_member_              <- o A..:?  "bot_is_member"
        request_title_              <- o A..:?  "request_title"
        request_username_           <- o A..:?  "request_username"
        request_photo_              <- o A..:?  "request_photo"
        pure $ KeyboardButtonTypeRequestChat
          { _id                        = _id_
          , chat_is_channel            = chat_is_channel_
          , restrict_chat_is_forum     = restrict_chat_is_forum_
          , chat_is_forum              = chat_is_forum_
          , restrict_chat_has_username = restrict_chat_has_username_
          , chat_has_username          = chat_has_username_
          , chat_is_created            = chat_is_created_
          , user_administrator_rights  = user_administrator_rights_
          , bot_administrator_rights   = bot_administrator_rights_
          , bot_is_member              = bot_is_member_
          , request_title              = request_title_
          , request_username           = request_username_
          , request_photo              = request_photo_
          }
      parseKeyboardButtonTypeWebApp :: A.Value -> AT.Parser KeyboardButtonType
      parseKeyboardButtonTypeWebApp = A.withObject "KeyboardButtonTypeWebApp" $ \o -> do
        url_ <- o A..:?  "url"
        pure $ KeyboardButtonTypeWebApp
          { url = url_
          }
  parseJSON _ = mempty

instance AT.ToJSON KeyboardButtonType where
  toJSON KeyboardButtonTypeText
      = A.object
        [ "@type" A..= AT.String "keyboardButtonTypeText"
        ]
  toJSON KeyboardButtonTypeRequestPhoneNumber
      = A.object
        [ "@type" A..= AT.String "keyboardButtonTypeRequestPhoneNumber"
        ]
  toJSON KeyboardButtonTypeRequestLocation
      = A.object
        [ "@type" A..= AT.String "keyboardButtonTypeRequestLocation"
        ]
  toJSON KeyboardButtonTypeRequestPoll
    { force_regular = force_regular_
    , force_quiz    = force_quiz_
    }
      = A.object
        [ "@type"         A..= AT.String "keyboardButtonTypeRequestPoll"
        , "force_regular" A..= force_regular_
        , "force_quiz"    A..= force_quiz_
        ]
  toJSON KeyboardButtonTypeRequestUsers
    { _id                      = _id_
    , restrict_user_is_bot     = restrict_user_is_bot_
    , user_is_bot              = user_is_bot_
    , restrict_user_is_premium = restrict_user_is_premium_
    , user_is_premium          = user_is_premium_
    , max_quantity             = max_quantity_
    , request_name             = request_name_
    , request_username         = request_username_
    , request_photo            = request_photo_
    }
      = A.object
        [ "@type"                    A..= AT.String "keyboardButtonTypeRequestUsers"
        , "id"                       A..= _id_
        , "restrict_user_is_bot"     A..= restrict_user_is_bot_
        , "user_is_bot"              A..= user_is_bot_
        , "restrict_user_is_premium" A..= restrict_user_is_premium_
        , "user_is_premium"          A..= user_is_premium_
        , "max_quantity"             A..= max_quantity_
        , "request_name"             A..= request_name_
        , "request_username"         A..= request_username_
        , "request_photo"            A..= request_photo_
        ]
  toJSON KeyboardButtonTypeRequestChat
    { _id                        = _id_
    , chat_is_channel            = chat_is_channel_
    , restrict_chat_is_forum     = restrict_chat_is_forum_
    , chat_is_forum              = chat_is_forum_
    , restrict_chat_has_username = restrict_chat_has_username_
    , chat_has_username          = chat_has_username_
    , chat_is_created            = chat_is_created_
    , user_administrator_rights  = user_administrator_rights_
    , bot_administrator_rights   = bot_administrator_rights_
    , bot_is_member              = bot_is_member_
    , request_title              = request_title_
    , request_username           = request_username_
    , request_photo              = request_photo_
    }
      = A.object
        [ "@type"                      A..= AT.String "keyboardButtonTypeRequestChat"
        , "id"                         A..= _id_
        , "chat_is_channel"            A..= chat_is_channel_
        , "restrict_chat_is_forum"     A..= restrict_chat_is_forum_
        , "chat_is_forum"              A..= chat_is_forum_
        , "restrict_chat_has_username" A..= restrict_chat_has_username_
        , "chat_has_username"          A..= chat_has_username_
        , "chat_is_created"            A..= chat_is_created_
        , "user_administrator_rights"  A..= user_administrator_rights_
        , "bot_administrator_rights"   A..= bot_administrator_rights_
        , "bot_is_member"              A..= bot_is_member_
        , "request_title"              A..= request_title_
        , "request_username"           A..= request_username_
        , "request_photo"              A..= request_photo_
        ]
  toJSON KeyboardButtonTypeWebApp
    { url = url_
    }
      = A.object
        [ "@type" A..= AT.String "keyboardButtonTypeWebApp"
        , "url"   A..= url_
        ]

