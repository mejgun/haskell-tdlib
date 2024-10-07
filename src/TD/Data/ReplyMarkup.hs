module TD.Data.ReplyMarkup
  (ReplyMarkup(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.KeyboardButton as KeyboardButton
import qualified TD.Data.InlineKeyboardButton as InlineKeyboardButton

-- | Contains a description of a custom keyboard and actions that can be done with it to quickly reply to bots
data ReplyMarkup
  = ReplyMarkupRemoveKeyboard -- ^ Instructs application to remove the keyboard once this message has been received. This kind of keyboard can't be received in an incoming message; instead, updateChatReplyMarkup with message_id == 0 will be sent
    { is_personal :: Maybe Bool -- ^ True, if the keyboard is removed only for the mentioned users or the target user of a reply
    }
  | ReplyMarkupForceReply -- ^ Instructs application to force a reply to this message
    { is_personal             :: Maybe Bool   -- ^ True, if a forced reply must automatically be shown to the current user. For outgoing messages, specify true to show the forced reply only for the mentioned users and for the target user of a reply
    , input_field_placeholder :: Maybe T.Text -- ^ If non-empty, the placeholder to be shown in the input field when the reply is active; 0-64 characters
    }
  | ReplyMarkupShowKeyboard -- ^ Contains a custom keyboard layout to quickly reply to bots
    { rows                    :: Maybe [[KeyboardButton.KeyboardButton]] -- ^ A list of rows of bot keyboard buttons
    , is_persistent           :: Maybe Bool                              -- ^ True, if the keyboard is expected to always be shown when the ordinary keyboard is hidden
    , resize_keyboard         :: Maybe Bool                              -- ^ True, if the application needs to resize the keyboard vertically
    , one_time                :: Maybe Bool                              -- ^ True, if the application needs to hide the keyboard after use
    , is_personal             :: Maybe Bool                              -- ^ True, if the keyboard must automatically be shown to the current user. For outgoing messages, specify true to show the keyboard only for the mentioned users and for the target user of a reply
    , input_field_placeholder :: Maybe T.Text                            -- ^ If non-empty, the placeholder to be shown in the input field when the keyboard is active; 0-64 characters
    }
  | ReplyMarkupInlineKeyboard -- ^ Contains an inline keyboard layout
    { _rows :: Maybe [[InlineKeyboardButton.InlineKeyboardButton]] -- ^ A list of rows of inline keyboard buttons
    }
  deriving (Eq, Show)

instance I.ShortShow ReplyMarkup where
  shortShow ReplyMarkupRemoveKeyboard
    { is_personal = is_personal_
    }
      = "ReplyMarkupRemoveKeyboard"
        ++ I.cc
        [ "is_personal" `I.p` is_personal_
        ]
  shortShow ReplyMarkupForceReply
    { is_personal             = is_personal_
    , input_field_placeholder = input_field_placeholder_
    }
      = "ReplyMarkupForceReply"
        ++ I.cc
        [ "is_personal"             `I.p` is_personal_
        , "input_field_placeholder" `I.p` input_field_placeholder_
        ]
  shortShow ReplyMarkupShowKeyboard
    { rows                    = rows_
    , is_persistent           = is_persistent_
    , resize_keyboard         = resize_keyboard_
    , one_time                = one_time_
    , is_personal             = is_personal_
    , input_field_placeholder = input_field_placeholder_
    }
      = "ReplyMarkupShowKeyboard"
        ++ I.cc
        [ "rows"                    `I.p` rows_
        , "is_persistent"           `I.p` is_persistent_
        , "resize_keyboard"         `I.p` resize_keyboard_
        , "one_time"                `I.p` one_time_
        , "is_personal"             `I.p` is_personal_
        , "input_field_placeholder" `I.p` input_field_placeholder_
        ]
  shortShow ReplyMarkupInlineKeyboard
    { _rows = _rows_
    }
      = "ReplyMarkupInlineKeyboard"
        ++ I.cc
        [ "_rows" `I.p` _rows_
        ]

instance AT.FromJSON ReplyMarkup where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "replyMarkupRemoveKeyboard" -> parseReplyMarkupRemoveKeyboard v
      "replyMarkupForceReply"     -> parseReplyMarkupForceReply v
      "replyMarkupShowKeyboard"   -> parseReplyMarkupShowKeyboard v
      "replyMarkupInlineKeyboard" -> parseReplyMarkupInlineKeyboard v
      _                           -> mempty
    
    where
      parseReplyMarkupRemoveKeyboard :: A.Value -> AT.Parser ReplyMarkup
      parseReplyMarkupRemoveKeyboard = A.withObject "ReplyMarkupRemoveKeyboard" $ \o -> do
        is_personal_ <- o A..:?  "is_personal"
        pure $ ReplyMarkupRemoveKeyboard
          { is_personal = is_personal_
          }
      parseReplyMarkupForceReply :: A.Value -> AT.Parser ReplyMarkup
      parseReplyMarkupForceReply = A.withObject "ReplyMarkupForceReply" $ \o -> do
        is_personal_             <- o A..:?  "is_personal"
        input_field_placeholder_ <- o A..:?  "input_field_placeholder"
        pure $ ReplyMarkupForceReply
          { is_personal             = is_personal_
          , input_field_placeholder = input_field_placeholder_
          }
      parseReplyMarkupShowKeyboard :: A.Value -> AT.Parser ReplyMarkup
      parseReplyMarkupShowKeyboard = A.withObject "ReplyMarkupShowKeyboard" $ \o -> do
        rows_                    <- o A..:?  "rows"
        is_persistent_           <- o A..:?  "is_persistent"
        resize_keyboard_         <- o A..:?  "resize_keyboard"
        one_time_                <- o A..:?  "one_time"
        is_personal_             <- o A..:?  "is_personal"
        input_field_placeholder_ <- o A..:?  "input_field_placeholder"
        pure $ ReplyMarkupShowKeyboard
          { rows                    = rows_
          , is_persistent           = is_persistent_
          , resize_keyboard         = resize_keyboard_
          , one_time                = one_time_
          , is_personal             = is_personal_
          , input_field_placeholder = input_field_placeholder_
          }
      parseReplyMarkupInlineKeyboard :: A.Value -> AT.Parser ReplyMarkup
      parseReplyMarkupInlineKeyboard = A.withObject "ReplyMarkupInlineKeyboard" $ \o -> do
        _rows_ <- o A..:?  "rows"
        pure $ ReplyMarkupInlineKeyboard
          { _rows = _rows_
          }
  parseJSON _ = mempty

instance AT.ToJSON ReplyMarkup where
  toJSON ReplyMarkupRemoveKeyboard
    { is_personal = is_personal_
    }
      = A.object
        [ "@type"       A..= AT.String "replyMarkupRemoveKeyboard"
        , "is_personal" A..= is_personal_
        ]
  toJSON ReplyMarkupForceReply
    { is_personal             = is_personal_
    , input_field_placeholder = input_field_placeholder_
    }
      = A.object
        [ "@type"                   A..= AT.String "replyMarkupForceReply"
        , "is_personal"             A..= is_personal_
        , "input_field_placeholder" A..= input_field_placeholder_
        ]
  toJSON ReplyMarkupShowKeyboard
    { rows                    = rows_
    , is_persistent           = is_persistent_
    , resize_keyboard         = resize_keyboard_
    , one_time                = one_time_
    , is_personal             = is_personal_
    , input_field_placeholder = input_field_placeholder_
    }
      = A.object
        [ "@type"                   A..= AT.String "replyMarkupShowKeyboard"
        , "rows"                    A..= rows_
        , "is_persistent"           A..= is_persistent_
        , "resize_keyboard"         A..= resize_keyboard_
        , "one_time"                A..= one_time_
        , "is_personal"             A..= is_personal_
        , "input_field_placeholder" A..= input_field_placeholder_
        ]
  toJSON ReplyMarkupInlineKeyboard
    { _rows = _rows_
    }
      = A.object
        [ "@type" A..= AT.String "replyMarkupInlineKeyboard"
        , "rows"  A..= _rows_
        ]

