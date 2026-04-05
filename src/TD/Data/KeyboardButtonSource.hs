module TD.Data.KeyboardButtonSource
  (KeyboardButtonSource(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Describes source of a keyboard button
data KeyboardButtonSource
  = KeyboardButtonSourceMessage -- ^ The button is from a bot's message
    { chat_id    :: Maybe Int -- ^ Identifier of the chat with the message
    , message_id :: Maybe Int -- ^ Identifier of the message with the button
    }
  | KeyboardButtonSourceWebApp -- ^ The button is a prepared keyboard button from a Mini App received via getPreparedKeyboardButton
    { bot_user_id        :: Maybe Int    -- ^ Identifier of the bot that created the button
    , prepared_button_id :: Maybe T.Text -- ^ Identifier of the prepared button
    }
  deriving (Eq, Show)

instance I.ShortShow KeyboardButtonSource where
  shortShow KeyboardButtonSourceMessage
    { chat_id    = chat_id_
    , message_id = message_id_
    }
      = "KeyboardButtonSourceMessage"
        ++ I.cc
        [ "chat_id"    `I.p` chat_id_
        , "message_id" `I.p` message_id_
        ]
  shortShow KeyboardButtonSourceWebApp
    { bot_user_id        = bot_user_id_
    , prepared_button_id = prepared_button_id_
    }
      = "KeyboardButtonSourceWebApp"
        ++ I.cc
        [ "bot_user_id"        `I.p` bot_user_id_
        , "prepared_button_id" `I.p` prepared_button_id_
        ]

instance AT.FromJSON KeyboardButtonSource where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "keyboardButtonSourceMessage" -> parseKeyboardButtonSourceMessage v
      "keyboardButtonSourceWebApp"  -> parseKeyboardButtonSourceWebApp v
      _                             -> mempty
    
    where
      parseKeyboardButtonSourceMessage :: A.Value -> AT.Parser KeyboardButtonSource
      parseKeyboardButtonSourceMessage = A.withObject "KeyboardButtonSourceMessage" $ \o -> do
        chat_id_    <- o A..:?  "chat_id"
        message_id_ <- o A..:?  "message_id"
        pure $ KeyboardButtonSourceMessage
          { chat_id    = chat_id_
          , message_id = message_id_
          }
      parseKeyboardButtonSourceWebApp :: A.Value -> AT.Parser KeyboardButtonSource
      parseKeyboardButtonSourceWebApp = A.withObject "KeyboardButtonSourceWebApp" $ \o -> do
        bot_user_id_        <- o A..:?  "bot_user_id"
        prepared_button_id_ <- o A..:?  "prepared_button_id"
        pure $ KeyboardButtonSourceWebApp
          { bot_user_id        = bot_user_id_
          , prepared_button_id = prepared_button_id_
          }
  parseJSON _ = mempty

instance AT.ToJSON KeyboardButtonSource where
  toJSON KeyboardButtonSourceMessage
    { chat_id    = chat_id_
    , message_id = message_id_
    }
      = A.object
        [ "@type"      A..= AT.String "keyboardButtonSourceMessage"
        , "chat_id"    A..= chat_id_
        , "message_id" A..= message_id_
        ]
  toJSON KeyboardButtonSourceWebApp
    { bot_user_id        = bot_user_id_
    , prepared_button_id = prepared_button_id_
    }
      = A.object
        [ "@type"              A..= AT.String "keyboardButtonSourceWebApp"
        , "bot_user_id"        A..= bot_user_id_
        , "prepared_button_id" A..= prepared_button_id_
        ]

