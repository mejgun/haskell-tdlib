-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ReplyMarkup where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.KeyboardButton as KeyboardButton
import {-# SOURCE #-} qualified API.InlineKeyboardButton as InlineKeyboardButton

-- |
-- 
-- Contains a description of a custom keyboard and actions that can be done with it to quickly reply to bots
data ReplyMarkup = 
 -- |
 -- 
 -- Instructs application to remove the keyboard once this message has been received. This kind of keyboard can't be received in an incoming message; instead, UpdateChatReplyMarkup with message_id == 0 will be sent
 -- 
 -- __is_personal__ True, if the keyboard is removed only for the mentioned users or the target user of a reply
 ReplyMarkupRemoveKeyboard { is_personal :: Maybe Bool }  |
 -- |
 -- 
 -- Instructs application to force a reply to this message
 -- 
 -- __is_personal__ True, if a forced reply must automatically be shown to the current user. For outgoing messages, specify true to show the forced reply only for the mentioned users and for the target user of a reply
 -- 
 -- __input_field_placeholder__ If non-empty, the placeholder to be shown in the input field when the reply is active; 0-64 characters
 ReplyMarkupForceReply { input_field_placeholder :: Maybe String, is_personal :: Maybe Bool }  |
 -- |
 -- 
 -- Contains a custom keyboard layout to quickly reply to bots
 -- 
 -- __rows__ A list of rows of bot keyboard buttons
 -- 
 -- __resize_keyboard__ True, if the application needs to resize the keyboard vertically
 -- 
 -- __one_time__ True, if the application needs to hide the keyboard after use
 -- 
 -- __is_personal__ True, if the keyboard must automatically be shown to the current user. For outgoing messages, specify true to show the keyboard only for the mentioned users and for the target user of a reply
 -- 
 -- __input_field_placeholder__ If non-empty, the placeholder to be shown in the input field when the keyboard is active; 0-64 characters
 ReplyMarkupShowKeyboard { input_field_placeholder :: Maybe String, is_personal :: Maybe Bool, one_time :: Maybe Bool, resize_keyboard :: Maybe Bool, _rows :: Maybe [KeyboardButton.KeyboardButton] }  |
 -- |
 -- 
 -- Contains an inline keyboard layout
 -- 
 -- __rows__ A list of rows of inline keyboard buttons
 ReplyMarkupInlineKeyboard { rows :: Maybe [InlineKeyboardButton.InlineKeyboardButton] }  deriving (Eq)

instance Show ReplyMarkup where
 show ReplyMarkupRemoveKeyboard { is_personal=is_personal } =
  "ReplyMarkupRemoveKeyboard" ++ U.cc [U.p "is_personal" is_personal ]

 show ReplyMarkupForceReply { input_field_placeholder=input_field_placeholder, is_personal=is_personal } =
  "ReplyMarkupForceReply" ++ U.cc [U.p "input_field_placeholder" input_field_placeholder, U.p "is_personal" is_personal ]

 show ReplyMarkupShowKeyboard { input_field_placeholder=input_field_placeholder, is_personal=is_personal, one_time=one_time, resize_keyboard=resize_keyboard, _rows=_rows } =
  "ReplyMarkupShowKeyboard" ++ U.cc [U.p "input_field_placeholder" input_field_placeholder, U.p "is_personal" is_personal, U.p "one_time" one_time, U.p "resize_keyboard" resize_keyboard, U.p "_rows" _rows ]

 show ReplyMarkupInlineKeyboard { rows=rows } =
  "ReplyMarkupInlineKeyboard" ++ U.cc [U.p "rows" rows ]

instance T.ToJSON ReplyMarkup where
 toJSON ReplyMarkupRemoveKeyboard { is_personal = is_personal } =
  A.object [ "@type" A..= T.String "replyMarkupRemoveKeyboard", "is_personal" A..= is_personal ]

 toJSON ReplyMarkupForceReply { input_field_placeholder = input_field_placeholder, is_personal = is_personal } =
  A.object [ "@type" A..= T.String "replyMarkupForceReply", "input_field_placeholder" A..= input_field_placeholder, "is_personal" A..= is_personal ]

 toJSON ReplyMarkupShowKeyboard { input_field_placeholder = input_field_placeholder, is_personal = is_personal, one_time = one_time, resize_keyboard = resize_keyboard, _rows = _rows } =
  A.object [ "@type" A..= T.String "replyMarkupShowKeyboard", "input_field_placeholder" A..= input_field_placeholder, "is_personal" A..= is_personal, "one_time" A..= one_time, "resize_keyboard" A..= resize_keyboard, "rows" A..= _rows ]

 toJSON ReplyMarkupInlineKeyboard { rows = rows } =
  A.object [ "@type" A..= T.String "replyMarkupInlineKeyboard", "rows" A..= rows ]

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
    is_personal <- o A..:? "is_personal"
    return $ ReplyMarkupRemoveKeyboard { is_personal = is_personal }

   parseReplyMarkupForceReply :: A.Value -> T.Parser ReplyMarkup
   parseReplyMarkupForceReply = A.withObject "ReplyMarkupForceReply" $ \o -> do
    input_field_placeholder <- o A..:? "input_field_placeholder"
    is_personal <- o A..:? "is_personal"
    return $ ReplyMarkupForceReply { input_field_placeholder = input_field_placeholder, is_personal = is_personal }

   parseReplyMarkupShowKeyboard :: A.Value -> T.Parser ReplyMarkup
   parseReplyMarkupShowKeyboard = A.withObject "ReplyMarkupShowKeyboard" $ \o -> do
    input_field_placeholder <- o A..:? "input_field_placeholder"
    is_personal <- o A..:? "is_personal"
    one_time <- o A..:? "one_time"
    resize_keyboard <- o A..:? "resize_keyboard"
    _rows <- o A..:? "rows"
    return $ ReplyMarkupShowKeyboard { input_field_placeholder = input_field_placeholder, is_personal = is_personal, one_time = one_time, resize_keyboard = resize_keyboard, _rows = _rows }

   parseReplyMarkupInlineKeyboard :: A.Value -> T.Parser ReplyMarkup
   parseReplyMarkupInlineKeyboard = A.withObject "ReplyMarkupInlineKeyboard" $ \o -> do
    rows <- o A..:? "rows"
    return $ ReplyMarkupInlineKeyboard { rows = rows }
 parseJSON _ = mempty
