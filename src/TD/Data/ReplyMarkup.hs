{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ReplyMarkup where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InlineKeyboardButton as InlineKeyboardButton
import qualified TD.Data.KeyboardButton as KeyboardButton
import qualified Utils as U

-- | Contains a description of a custom keyboard and actions that can be done with it to quickly reply to bots
data ReplyMarkup
  = -- | Instructs application to remove the keyboard once this message has been received. This kind of keyboard can't be received in an incoming message; instead, updateChatReplyMarkup with message_id == 0 will be sent
    ReplyMarkupRemoveKeyboard
      { -- | True, if the keyboard is removed only for the mentioned users or the target user of a reply
        is_personal :: Maybe Bool
      }
  | -- | Instructs application to force a reply to this message
    ReplyMarkupForceReply
      { -- | If non-empty, the placeholder to be shown in the input field when the reply is active; 0-64 characters
        input_field_placeholder :: Maybe String,
        -- | True, if a forced reply must automatically be shown to the current user. For outgoing messages, specify true to show the forced reply only for the mentioned users and for the target user of a reply
        is_personal :: Maybe Bool
      }
  | -- | Contains a custom keyboard layout to quickly reply to bots
    ReplyMarkupShowKeyboard
      { -- | If non-empty, the placeholder to be shown in the input field when the keyboard is active; 0-64 characters
        input_field_placeholder :: Maybe String,
        -- | True, if the keyboard must automatically be shown to the current user. For outgoing messages, specify true to show the keyboard only for the mentioned users and for the target user of a reply
        is_personal :: Maybe Bool,
        -- | True, if the application needs to hide the keyboard after use
        one_time :: Maybe Bool,
        -- | True, if the application needs to resize the keyboard vertically
        resize_keyboard :: Maybe Bool,
        -- | A list of rows of bot keyboard buttons
        rows :: Maybe [[KeyboardButton.KeyboardButton]]
      }
  | -- | Contains an inline keyboard layout
    ReplyMarkupInlineKeyboard
      { -- | A list of rows of inline keyboard buttons
        _rows :: Maybe [[InlineKeyboardButton.InlineKeyboardButton]]
      }
  deriving (Eq)

instance Show ReplyMarkup where
  show
    ReplyMarkupRemoveKeyboard
      { is_personal = is_personal_
      } =
      "ReplyMarkupRemoveKeyboard"
        ++ U.cc
          [ U.p "is_personal" is_personal_
          ]
  show
    ReplyMarkupForceReply
      { input_field_placeholder = input_field_placeholder_,
        is_personal = is_personal_
      } =
      "ReplyMarkupForceReply"
        ++ U.cc
          [ U.p "input_field_placeholder" input_field_placeholder_,
            U.p "is_personal" is_personal_
          ]
  show
    ReplyMarkupShowKeyboard
      { input_field_placeholder = input_field_placeholder_,
        is_personal = is_personal_,
        one_time = one_time_,
        resize_keyboard = resize_keyboard_,
        rows = rows_
      } =
      "ReplyMarkupShowKeyboard"
        ++ U.cc
          [ U.p "input_field_placeholder" input_field_placeholder_,
            U.p "is_personal" is_personal_,
            U.p "one_time" one_time_,
            U.p "resize_keyboard" resize_keyboard_,
            U.p "rows" rows_
          ]
  show
    ReplyMarkupInlineKeyboard
      { _rows = _rows_
      } =
      "ReplyMarkupInlineKeyboard"
        ++ U.cc
          [ U.p "_rows" _rows_
          ]

instance T.FromJSON ReplyMarkup where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "replyMarkupRemoveKeyboard" -> parseReplyMarkupRemoveKeyboard v
      "replyMarkupForceReply" -> parseReplyMarkupForceReply v
      "replyMarkupShowKeyboard" -> parseReplyMarkupShowKeyboard v
      "replyMarkupInlineKeyboard" -> parseReplyMarkupInlineKeyboard v
      _ -> mempty
    where
      parseReplyMarkupRemoveKeyboard :: A.Value -> T.Parser ReplyMarkup
      parseReplyMarkupRemoveKeyboard = A.withObject "ReplyMarkupRemoveKeyboard" $ \o -> do
        is_personal_ <- o A..:? "is_personal"
        return $ ReplyMarkupRemoveKeyboard {is_personal = is_personal_}

      parseReplyMarkupForceReply :: A.Value -> T.Parser ReplyMarkup
      parseReplyMarkupForceReply = A.withObject "ReplyMarkupForceReply" $ \o -> do
        input_field_placeholder_ <- o A..:? "input_field_placeholder"
        is_personal_ <- o A..:? "is_personal"
        return $ ReplyMarkupForceReply {input_field_placeholder = input_field_placeholder_, is_personal = is_personal_}

      parseReplyMarkupShowKeyboard :: A.Value -> T.Parser ReplyMarkup
      parseReplyMarkupShowKeyboard = A.withObject "ReplyMarkupShowKeyboard" $ \o -> do
        input_field_placeholder_ <- o A..:? "input_field_placeholder"
        is_personal_ <- o A..:? "is_personal"
        one_time_ <- o A..:? "one_time"
        resize_keyboard_ <- o A..:? "resize_keyboard"
        rows_ <- o A..:? "rows"
        return $ ReplyMarkupShowKeyboard {input_field_placeholder = input_field_placeholder_, is_personal = is_personal_, one_time = one_time_, resize_keyboard = resize_keyboard_, rows = rows_}

      parseReplyMarkupInlineKeyboard :: A.Value -> T.Parser ReplyMarkup
      parseReplyMarkupInlineKeyboard = A.withObject "ReplyMarkupInlineKeyboard" $ \o -> do
        _rows_ <- o A..:? "rows"
        return $ ReplyMarkupInlineKeyboard {_rows = _rows_}
  parseJSON _ = mempty

instance T.ToJSON ReplyMarkup where
  toJSON
    ReplyMarkupRemoveKeyboard
      { is_personal = is_personal_
      } =
      A.object
        [ "@type" A..= T.String "replyMarkupRemoveKeyboard",
          "is_personal" A..= is_personal_
        ]
  toJSON
    ReplyMarkupForceReply
      { input_field_placeholder = input_field_placeholder_,
        is_personal = is_personal_
      } =
      A.object
        [ "@type" A..= T.String "replyMarkupForceReply",
          "input_field_placeholder" A..= input_field_placeholder_,
          "is_personal" A..= is_personal_
        ]
  toJSON
    ReplyMarkupShowKeyboard
      { input_field_placeholder = input_field_placeholder_,
        is_personal = is_personal_,
        one_time = one_time_,
        resize_keyboard = resize_keyboard_,
        rows = rows_
      } =
      A.object
        [ "@type" A..= T.String "replyMarkupShowKeyboard",
          "input_field_placeholder" A..= input_field_placeholder_,
          "is_personal" A..= is_personal_,
          "one_time" A..= one_time_,
          "resize_keyboard" A..= resize_keyboard_,
          "rows" A..= rows_
        ]
  toJSON
    ReplyMarkupInlineKeyboard
      { _rows = _rows_
      } =
      A.object
        [ "@type" A..= T.String "replyMarkupInlineKeyboard",
          "rows" A..= _rows_
        ]
