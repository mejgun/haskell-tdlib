module TD.Data.InlineKeyboardButtonType
  (InlineKeyboardButtonType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Data.TargetChat as TargetChat

-- | Describes the type of inline keyboard button
data InlineKeyboardButtonType
  = InlineKeyboardButtonTypeUrl -- ^ A button that opens a specified URL
    { url :: Maybe T.Text -- ^ HTTP or tg:// URL to open. If the link is of the type internalLinkTypeWebApp, then the button must be marked as a Web App button
    }
  | InlineKeyboardButtonTypeLoginUrl -- ^ A button that opens a specified URL and automatically authorize the current user by calling getLoginUrlInfo
    { url          :: Maybe T.Text -- ^ An HTTP URL to pass to getLoginUrlInfo
    , _id          :: Maybe Int    -- ^ Unique button identifier
    , forward_text :: Maybe T.Text -- ^ If non-empty, new text of the button in forwarded messages
    }
  | InlineKeyboardButtonTypeWebApp -- ^ A button that opens a Web App by calling openWebApp
    { url :: Maybe T.Text -- ^ An HTTP URL to pass to openWebApp
    }
  | InlineKeyboardButtonTypeCallback -- ^ A button that sends a callback query to a bot
    { _data :: Maybe BS.ByteString -- ^ Data to be sent to the bot via a callback query
    }
  | InlineKeyboardButtonTypeCallbackWithPassword -- ^ A button that asks for the 2-step verification password of the current user and then sends a callback query to a bot
    { _data :: Maybe BS.ByteString -- ^ Data to be sent to the bot via a callback query
    }
  | InlineKeyboardButtonTypeCallbackGame -- ^ A button with a game that sends a callback query to a bot. This button must be in the first column and row of the keyboard and can be attached only to a message with content of the type messageGame
  | InlineKeyboardButtonTypeSwitchInline -- ^ A button that forces an inline query to the bot to be inserted in the input field
    { query       :: Maybe T.Text                -- ^ Inline query to be sent to the bot
    , target_chat :: Maybe TargetChat.TargetChat -- ^ Target chat from which to send the inline query
    }
  | InlineKeyboardButtonTypeBuy -- ^ A button to buy something. This button must be in the first column and row of the keyboard and can be attached only to a message with content of the type messageInvoice
  | InlineKeyboardButtonTypeUser -- ^ A button with a user reference to be handled in the same way as textEntityTypeMentionName entities
    { user_id :: Maybe Int -- ^ User identifier
    }
  | InlineKeyboardButtonTypeCopyText -- ^ A button that copies specified text to clipboard
    { text :: Maybe T.Text -- ^ The text to copy to clipboard
    }
  deriving (Eq, Show)

instance I.ShortShow InlineKeyboardButtonType where
  shortShow InlineKeyboardButtonTypeUrl
    { url = url_
    }
      = "InlineKeyboardButtonTypeUrl"
        ++ I.cc
        [ "url" `I.p` url_
        ]
  shortShow InlineKeyboardButtonTypeLoginUrl
    { url          = url_
    , _id          = _id_
    , forward_text = forward_text_
    }
      = "InlineKeyboardButtonTypeLoginUrl"
        ++ I.cc
        [ "url"          `I.p` url_
        , "_id"          `I.p` _id_
        , "forward_text" `I.p` forward_text_
        ]
  shortShow InlineKeyboardButtonTypeWebApp
    { url = url_
    }
      = "InlineKeyboardButtonTypeWebApp"
        ++ I.cc
        [ "url" `I.p` url_
        ]
  shortShow InlineKeyboardButtonTypeCallback
    { _data = _data_
    }
      = "InlineKeyboardButtonTypeCallback"
        ++ I.cc
        [ "_data" `I.p` _data_
        ]
  shortShow InlineKeyboardButtonTypeCallbackWithPassword
    { _data = _data_
    }
      = "InlineKeyboardButtonTypeCallbackWithPassword"
        ++ I.cc
        [ "_data" `I.p` _data_
        ]
  shortShow InlineKeyboardButtonTypeCallbackGame
      = "InlineKeyboardButtonTypeCallbackGame"
  shortShow InlineKeyboardButtonTypeSwitchInline
    { query       = query_
    , target_chat = target_chat_
    }
      = "InlineKeyboardButtonTypeSwitchInline"
        ++ I.cc
        [ "query"       `I.p` query_
        , "target_chat" `I.p` target_chat_
        ]
  shortShow InlineKeyboardButtonTypeBuy
      = "InlineKeyboardButtonTypeBuy"
  shortShow InlineKeyboardButtonTypeUser
    { user_id = user_id_
    }
      = "InlineKeyboardButtonTypeUser"
        ++ I.cc
        [ "user_id" `I.p` user_id_
        ]
  shortShow InlineKeyboardButtonTypeCopyText
    { text = text_
    }
      = "InlineKeyboardButtonTypeCopyText"
        ++ I.cc
        [ "text" `I.p` text_
        ]

instance AT.FromJSON InlineKeyboardButtonType where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inlineKeyboardButtonTypeUrl"                  -> parseInlineKeyboardButtonTypeUrl v
      "inlineKeyboardButtonTypeLoginUrl"             -> parseInlineKeyboardButtonTypeLoginUrl v
      "inlineKeyboardButtonTypeWebApp"               -> parseInlineKeyboardButtonTypeWebApp v
      "inlineKeyboardButtonTypeCallback"             -> parseInlineKeyboardButtonTypeCallback v
      "inlineKeyboardButtonTypeCallbackWithPassword" -> parseInlineKeyboardButtonTypeCallbackWithPassword v
      "inlineKeyboardButtonTypeCallbackGame"         -> pure InlineKeyboardButtonTypeCallbackGame
      "inlineKeyboardButtonTypeSwitchInline"         -> parseInlineKeyboardButtonTypeSwitchInline v
      "inlineKeyboardButtonTypeBuy"                  -> pure InlineKeyboardButtonTypeBuy
      "inlineKeyboardButtonTypeUser"                 -> parseInlineKeyboardButtonTypeUser v
      "inlineKeyboardButtonTypeCopyText"             -> parseInlineKeyboardButtonTypeCopyText v
      _                                              -> mempty
    
    where
      parseInlineKeyboardButtonTypeUrl :: A.Value -> AT.Parser InlineKeyboardButtonType
      parseInlineKeyboardButtonTypeUrl = A.withObject "InlineKeyboardButtonTypeUrl" $ \o -> do
        url_ <- o A..:?  "url"
        pure $ InlineKeyboardButtonTypeUrl
          { url = url_
          }
      parseInlineKeyboardButtonTypeLoginUrl :: A.Value -> AT.Parser InlineKeyboardButtonType
      parseInlineKeyboardButtonTypeLoginUrl = A.withObject "InlineKeyboardButtonTypeLoginUrl" $ \o -> do
        url_          <- o A..:?  "url"
        _id_          <- o A..:?  "id"
        forward_text_ <- o A..:?  "forward_text"
        pure $ InlineKeyboardButtonTypeLoginUrl
          { url          = url_
          , _id          = _id_
          , forward_text = forward_text_
          }
      parseInlineKeyboardButtonTypeWebApp :: A.Value -> AT.Parser InlineKeyboardButtonType
      parseInlineKeyboardButtonTypeWebApp = A.withObject "InlineKeyboardButtonTypeWebApp" $ \o -> do
        url_ <- o A..:?  "url"
        pure $ InlineKeyboardButtonTypeWebApp
          { url = url_
          }
      parseInlineKeyboardButtonTypeCallback :: A.Value -> AT.Parser InlineKeyboardButtonType
      parseInlineKeyboardButtonTypeCallback = A.withObject "InlineKeyboardButtonTypeCallback" $ \o -> do
        _data_ <- fmap I.readBytes <$> o A..:?  "data"
        pure $ InlineKeyboardButtonTypeCallback
          { _data = _data_
          }
      parseInlineKeyboardButtonTypeCallbackWithPassword :: A.Value -> AT.Parser InlineKeyboardButtonType
      parseInlineKeyboardButtonTypeCallbackWithPassword = A.withObject "InlineKeyboardButtonTypeCallbackWithPassword" $ \o -> do
        _data_ <- fmap I.readBytes <$> o A..:?  "data"
        pure $ InlineKeyboardButtonTypeCallbackWithPassword
          { _data = _data_
          }
      parseInlineKeyboardButtonTypeSwitchInline :: A.Value -> AT.Parser InlineKeyboardButtonType
      parseInlineKeyboardButtonTypeSwitchInline = A.withObject "InlineKeyboardButtonTypeSwitchInline" $ \o -> do
        query_       <- o A..:?  "query"
        target_chat_ <- o A..:?  "target_chat"
        pure $ InlineKeyboardButtonTypeSwitchInline
          { query       = query_
          , target_chat = target_chat_
          }
      parseInlineKeyboardButtonTypeUser :: A.Value -> AT.Parser InlineKeyboardButtonType
      parseInlineKeyboardButtonTypeUser = A.withObject "InlineKeyboardButtonTypeUser" $ \o -> do
        user_id_ <- o A..:?  "user_id"
        pure $ InlineKeyboardButtonTypeUser
          { user_id = user_id_
          }
      parseInlineKeyboardButtonTypeCopyText :: A.Value -> AT.Parser InlineKeyboardButtonType
      parseInlineKeyboardButtonTypeCopyText = A.withObject "InlineKeyboardButtonTypeCopyText" $ \o -> do
        text_ <- o A..:?  "text"
        pure $ InlineKeyboardButtonTypeCopyText
          { text = text_
          }
  parseJSON _ = mempty

instance AT.ToJSON InlineKeyboardButtonType where
  toJSON InlineKeyboardButtonTypeUrl
    { url = url_
    }
      = A.object
        [ "@type" A..= AT.String "inlineKeyboardButtonTypeUrl"
        , "url"   A..= url_
        ]
  toJSON InlineKeyboardButtonTypeLoginUrl
    { url          = url_
    , _id          = _id_
    , forward_text = forward_text_
    }
      = A.object
        [ "@type"        A..= AT.String "inlineKeyboardButtonTypeLoginUrl"
        , "url"          A..= url_
        , "id"           A..= _id_
        , "forward_text" A..= forward_text_
        ]
  toJSON InlineKeyboardButtonTypeWebApp
    { url = url_
    }
      = A.object
        [ "@type" A..= AT.String "inlineKeyboardButtonTypeWebApp"
        , "url"   A..= url_
        ]
  toJSON InlineKeyboardButtonTypeCallback
    { _data = _data_
    }
      = A.object
        [ "@type" A..= AT.String "inlineKeyboardButtonTypeCallback"
        , "data"  A..= fmap I.writeBytes  _data_
        ]
  toJSON InlineKeyboardButtonTypeCallbackWithPassword
    { _data = _data_
    }
      = A.object
        [ "@type" A..= AT.String "inlineKeyboardButtonTypeCallbackWithPassword"
        , "data"  A..= fmap I.writeBytes  _data_
        ]
  toJSON InlineKeyboardButtonTypeCallbackGame
      = A.object
        [ "@type" A..= AT.String "inlineKeyboardButtonTypeCallbackGame"
        ]
  toJSON InlineKeyboardButtonTypeSwitchInline
    { query       = query_
    , target_chat = target_chat_
    }
      = A.object
        [ "@type"       A..= AT.String "inlineKeyboardButtonTypeSwitchInline"
        , "query"       A..= query_
        , "target_chat" A..= target_chat_
        ]
  toJSON InlineKeyboardButtonTypeBuy
      = A.object
        [ "@type" A..= AT.String "inlineKeyboardButtonTypeBuy"
        ]
  toJSON InlineKeyboardButtonTypeUser
    { user_id = user_id_
    }
      = A.object
        [ "@type"   A..= AT.String "inlineKeyboardButtonTypeUser"
        , "user_id" A..= user_id_
        ]
  toJSON InlineKeyboardButtonTypeCopyText
    { text = text_
    }
      = A.object
        [ "@type" A..= AT.String "inlineKeyboardButtonTypeCopyText"
        , "text"  A..= text_
        ]

