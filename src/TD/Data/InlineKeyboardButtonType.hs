{-# LANGUAGE OverloadedStrings #-}

module TD.Data.InlineKeyboardButtonType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Describes the type of an inline keyboard button
data InlineKeyboardButtonType
  = -- | A button that opens a specified URL @url HTTP or tg:// URL to open
    InlineKeyboardButtonTypeUrl
      { -- |
        url :: Maybe String
      }
  | -- | A button that opens a specified URL and automatically authorize the current user by calling getLoginUrlInfo @url An HTTP URL to pass to getLoginUrlInfo @id Unique button identifier @forward_text If non-empty, new text of the button in forwarded messages
    InlineKeyboardButtonTypeLoginUrl
      { -- |
        forward_text :: Maybe String,
        -- |
        _id :: Maybe Int,
        -- |
        url :: Maybe String
      }
  | -- | A button that opens a web app by calling openWebApp @url An HTTP URL to pass to openWebApp
    InlineKeyboardButtonTypeWebApp
      { -- |
        url :: Maybe String
      }
  | -- | A button that sends a callback query to a bot @data Data to be sent to the bot via a callback query
    InlineKeyboardButtonTypeCallback
      { -- |
        _data :: Maybe String
      }
  | -- | A button that asks for password of the current user and then sends a callback query to a bot @data Data to be sent to the bot via a callback query
    InlineKeyboardButtonTypeCallbackWithPassword
      { -- |
        _data :: Maybe String
      }
  | -- | A button with a game that sends a callback query to a bot. This button must be in the first column and row of the keyboard and can be attached only to a message with content of the type messageGame
    InlineKeyboardButtonTypeCallbackGame
  | -- | A button that forces an inline query to the bot to be inserted in the input field @query Inline query to be sent to the bot @in_current_chat True, if the inline query must be sent from the current chat
    InlineKeyboardButtonTypeSwitchInline
      { -- |
        in_current_chat :: Maybe Bool,
        -- |
        query :: Maybe String
      }
  | -- | A button to buy something. This button must be in the first column and row of the keyboard and can be attached only to a message with content of the type messageInvoice
    InlineKeyboardButtonTypeBuy
  | -- | A button with a user reference to be handled in the same way as textEntityTypeMentionName entities @user_id User identifier
    InlineKeyboardButtonTypeUser
      { -- |
        user_id :: Maybe Int
      }
  deriving (Eq)

instance Show InlineKeyboardButtonType where
  show
    InlineKeyboardButtonTypeUrl
      { url = url
      } =
      "InlineKeyboardButtonTypeUrl"
        ++ U.cc
          [ U.p "url" url
          ]
  show
    InlineKeyboardButtonTypeLoginUrl
      { forward_text = forward_text,
        _id = _id,
        url = url
      } =
      "InlineKeyboardButtonTypeLoginUrl"
        ++ U.cc
          [ U.p "forward_text" forward_text,
            U.p "_id" _id,
            U.p "url" url
          ]
  show
    InlineKeyboardButtonTypeWebApp
      { url = url
      } =
      "InlineKeyboardButtonTypeWebApp"
        ++ U.cc
          [ U.p "url" url
          ]
  show
    InlineKeyboardButtonTypeCallback
      { _data = _data
      } =
      "InlineKeyboardButtonTypeCallback"
        ++ U.cc
          [ U.p "_data" _data
          ]
  show
    InlineKeyboardButtonTypeCallbackWithPassword
      { _data = _data
      } =
      "InlineKeyboardButtonTypeCallbackWithPassword"
        ++ U.cc
          [ U.p "_data" _data
          ]
  show InlineKeyboardButtonTypeCallbackGame =
    "InlineKeyboardButtonTypeCallbackGame"
      ++ U.cc
        []
  show
    InlineKeyboardButtonTypeSwitchInline
      { in_current_chat = in_current_chat,
        query = query
      } =
      "InlineKeyboardButtonTypeSwitchInline"
        ++ U.cc
          [ U.p "in_current_chat" in_current_chat,
            U.p "query" query
          ]
  show InlineKeyboardButtonTypeBuy =
    "InlineKeyboardButtonTypeBuy"
      ++ U.cc
        []
  show
    InlineKeyboardButtonTypeUser
      { user_id = user_id
      } =
      "InlineKeyboardButtonTypeUser"
        ++ U.cc
          [ U.p "user_id" user_id
          ]

instance T.FromJSON InlineKeyboardButtonType where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "inlineKeyboardButtonTypeUrl" -> parseInlineKeyboardButtonTypeUrl v
      "inlineKeyboardButtonTypeLoginUrl" -> parseInlineKeyboardButtonTypeLoginUrl v
      "inlineKeyboardButtonTypeWebApp" -> parseInlineKeyboardButtonTypeWebApp v
      "inlineKeyboardButtonTypeCallback" -> parseInlineKeyboardButtonTypeCallback v
      "inlineKeyboardButtonTypeCallbackWithPassword" -> parseInlineKeyboardButtonTypeCallbackWithPassword v
      "inlineKeyboardButtonTypeCallbackGame" -> parseInlineKeyboardButtonTypeCallbackGame v
      "inlineKeyboardButtonTypeSwitchInline" -> parseInlineKeyboardButtonTypeSwitchInline v
      "inlineKeyboardButtonTypeBuy" -> parseInlineKeyboardButtonTypeBuy v
      "inlineKeyboardButtonTypeUser" -> parseInlineKeyboardButtonTypeUser v
      _ -> mempty
    where
      parseInlineKeyboardButtonTypeUrl :: A.Value -> T.Parser InlineKeyboardButtonType
      parseInlineKeyboardButtonTypeUrl = A.withObject "InlineKeyboardButtonTypeUrl" $ \o -> do
        url_ <- o A..:? "url"
        return $ InlineKeyboardButtonTypeUrl {url = url_}

      parseInlineKeyboardButtonTypeLoginUrl :: A.Value -> T.Parser InlineKeyboardButtonType
      parseInlineKeyboardButtonTypeLoginUrl = A.withObject "InlineKeyboardButtonTypeLoginUrl" $ \o -> do
        forward_text_ <- o A..:? "forward_text"
        _id_ <- mconcat [o A..:? "id", U.rm <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
        url_ <- o A..:? "url"
        return $ InlineKeyboardButtonTypeLoginUrl {forward_text = forward_text_, _id = _id_, url = url_}

      parseInlineKeyboardButtonTypeWebApp :: A.Value -> T.Parser InlineKeyboardButtonType
      parseInlineKeyboardButtonTypeWebApp = A.withObject "InlineKeyboardButtonTypeWebApp" $ \o -> do
        url_ <- o A..:? "url"
        return $ InlineKeyboardButtonTypeWebApp {url = url_}

      parseInlineKeyboardButtonTypeCallback :: A.Value -> T.Parser InlineKeyboardButtonType
      parseInlineKeyboardButtonTypeCallback = A.withObject "InlineKeyboardButtonTypeCallback" $ \o -> do
        _data_ <- o A..:? "data"
        return $ InlineKeyboardButtonTypeCallback {_data = _data_}

      parseInlineKeyboardButtonTypeCallbackWithPassword :: A.Value -> T.Parser InlineKeyboardButtonType
      parseInlineKeyboardButtonTypeCallbackWithPassword = A.withObject "InlineKeyboardButtonTypeCallbackWithPassword" $ \o -> do
        _data_ <- o A..:? "data"
        return $ InlineKeyboardButtonTypeCallbackWithPassword {_data = _data_}

      parseInlineKeyboardButtonTypeCallbackGame :: A.Value -> T.Parser InlineKeyboardButtonType
      parseInlineKeyboardButtonTypeCallbackGame = A.withObject "InlineKeyboardButtonTypeCallbackGame" $ \o -> do
        return $ InlineKeyboardButtonTypeCallbackGame {}

      parseInlineKeyboardButtonTypeSwitchInline :: A.Value -> T.Parser InlineKeyboardButtonType
      parseInlineKeyboardButtonTypeSwitchInline = A.withObject "InlineKeyboardButtonTypeSwitchInline" $ \o -> do
        in_current_chat_ <- o A..:? "in_current_chat"
        query_ <- o A..:? "query"
        return $ InlineKeyboardButtonTypeSwitchInline {in_current_chat = in_current_chat_, query = query_}

      parseInlineKeyboardButtonTypeBuy :: A.Value -> T.Parser InlineKeyboardButtonType
      parseInlineKeyboardButtonTypeBuy = A.withObject "InlineKeyboardButtonTypeBuy" $ \o -> do
        return $ InlineKeyboardButtonTypeBuy {}

      parseInlineKeyboardButtonTypeUser :: A.Value -> T.Parser InlineKeyboardButtonType
      parseInlineKeyboardButtonTypeUser = A.withObject "InlineKeyboardButtonTypeUser" $ \o -> do
        user_id_ <- mconcat [o A..:? "user_id", U.rm <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ InlineKeyboardButtonTypeUser {user_id = user_id_}
  parseJSON _ = mempty

instance T.ToJSON InlineKeyboardButtonType where
  toJSON
    InlineKeyboardButtonTypeUrl
      { url = url
      } =
      A.object
        [ "@type" A..= T.String "inlineKeyboardButtonTypeUrl",
          "url" A..= url
        ]
  toJSON
    InlineKeyboardButtonTypeLoginUrl
      { forward_text = forward_text,
        _id = _id,
        url = url
      } =
      A.object
        [ "@type" A..= T.String "inlineKeyboardButtonTypeLoginUrl",
          "forward_text" A..= forward_text,
          "id" A..= _id,
          "url" A..= url
        ]
  toJSON
    InlineKeyboardButtonTypeWebApp
      { url = url
      } =
      A.object
        [ "@type" A..= T.String "inlineKeyboardButtonTypeWebApp",
          "url" A..= url
        ]
  toJSON
    InlineKeyboardButtonTypeCallback
      { _data = _data
      } =
      A.object
        [ "@type" A..= T.String "inlineKeyboardButtonTypeCallback",
          "data" A..= _data
        ]
  toJSON
    InlineKeyboardButtonTypeCallbackWithPassword
      { _data = _data
      } =
      A.object
        [ "@type" A..= T.String "inlineKeyboardButtonTypeCallbackWithPassword",
          "data" A..= _data
        ]
  toJSON InlineKeyboardButtonTypeCallbackGame =
    A.object
      [ "@type" A..= T.String "inlineKeyboardButtonTypeCallbackGame"
      ]
  toJSON
    InlineKeyboardButtonTypeSwitchInline
      { in_current_chat = in_current_chat,
        query = query
      } =
      A.object
        [ "@type" A..= T.String "inlineKeyboardButtonTypeSwitchInline",
          "in_current_chat" A..= in_current_chat,
          "query" A..= query
        ]
  toJSON InlineKeyboardButtonTypeBuy =
    A.object
      [ "@type" A..= T.String "inlineKeyboardButtonTypeBuy"
      ]
  toJSON
    InlineKeyboardButtonTypeUser
      { user_id = user_id
      } =
      A.object
        [ "@type" A..= T.String "inlineKeyboardButtonTypeUser",
          "user_id" A..= user_id
        ]
